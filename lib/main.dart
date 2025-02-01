import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:koodiarana_client/bloc/ajout_utilisateur/ajout_utilisateur_bloc.dart';
import 'package:koodiarana_client/bloc/change_password/change_password_bloc.dart';
import 'package:koodiarana_client/bloc/fetch_destination/fetch_destination_bloc.dart';
import 'package:koodiarana_client/bloc/get_otp/get_otp_bloc.dart';
import 'package:koodiarana_client/bloc/signInGoogle/sign_in_google_bloc.dart';
import 'package:koodiarana_client/bloc/stepper/step_bloc.dart';
import 'package:koodiarana_client/bloc/test_otp/test_otp_bloc.dart';
import 'package:koodiarana_client/bloc/to_login/to_login_bloc.dart';
import 'package:koodiarana_client/bloc/verification_mail/verification_mail_bloc.dart';
import 'package:koodiarana_client/providers/app_manager.dart';
import 'package:koodiarana_client/providers/navigation_manager.dart';
import 'package:koodiarana_client/providers/connection_manager.dart';
import 'package:koodiarana_client/providers/stepper.dart';
import 'package:koodiarana_client/screens/pages/splash_screen.dart';
import 'package:koodiarana_client/services/authentification.dart';
import 'package:koodiarana_client/services/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../screens/theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FMTCObjectBoxBackend().initialise();
  await Firebase.initializeApp();
  await dotenv.load(fileName: '.env');
  await FMTCStore('mapStore').manage.create();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => StepperNotifier()),
            StreamProvider.value(
                value: AuthService().userConnection, initialData: null),
            ChangeNotifierProvider(create: (context) => NavigationManager()),
            ChangeNotifierProvider(create: (context) => AppManager()),
            ChangeNotifierProvider(create: (context) => ConnectionManager())
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => VerificationMailBloc()),
              BlocProvider(create: (context) => StepBloc()),
              BlocProvider(create: (context) => SignInGoogleBloc()),
              BlocProvider(create: (context) => FetchDestinationBloc()),
              BlocProvider(create: (context) => GetOtpBloc()),
              BlocProvider(create: (context) => TestOtpBloc()),
              BlocProvider(create: (context) => ChangePasswordBloc()),
              BlocProvider(create: (context) => ToLoginBloc()),
              BlocProvider(create: (context) => AjoutUtilisateurBloc())
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            ),
          )),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    late final routers = GoRouters();
    final router = routers.router;
    return ShadApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
