import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:koodiarana_client/bloc/signInGoogle/sign_in_google_bloc.dart';
import 'package:koodiarana_client/bloc/signInGoogle/sign_in_google_event.dart';
import 'package:koodiarana_client/screens/composants/button_google.dart';
import 'package:koodiarana_client/screens/pages/forgot_password.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../composants/password_input.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  bool error;
  Login({super.key, required this.error});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mailNum = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.error) {
      Fluttertoast.showToast(
          msg: "Erreur de connexion", toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<ShadFormState>();
    // final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return Padding(
        padding: EdgeInsets.all(16.00),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                ShadCard(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    "Client",
                    //    style: style,
                  ),
                  description:
                      Text("Se connecter avec votre compte client Koodiarana"),
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShadButton(
                        child: const Text('Se connecter'),
                        onPressed: () async {
                          if (formKey.currentState!.saveAndValidate()) {
                            print(
                                'validation succeeded with ${formKey.currentState!.value}');
                          }
                        },
                      ),
                      ShadButton.link(
                          onPressed: () {},
                          child: Text(
                            'S\'inscrire',
                            //  style: style,
                          ))
                    ],
                  ),
                  child: ShadForm(
                    key: formKey,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(),
                          ShadInputFormField(
                            id: 'username',
                            label: const Text('adresse ou numéro de téléphone'),
                            placeholder: const Text(
                                'Entrez votre email ou numero de telephone'),
                            // description:
                            //     const Text('This is your public display name.'),
                            validator: (v) {
                              if (v.isEmpty) {
                                return 'ce champ est obligatoire';
                              }
                              return null;
                            },
                          ),
                          PasswordInput(
                            rePassword: false,
                              controller: mailNum, color: theme.primaryColor)
                        ],
                      ),
                    ),
                  ),
                ),
                ShadButton.link(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    "Mot de passe oublié?",
                    textAlign: TextAlign.start,
                  ),
                ),
                Center(
                  child: ButtonGoogle(
                    onPressed: () {
                      context.read<SignInGoogleBloc>().add(TapGoogleButton());
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}



//  Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const SizedBox(height: 14),
//                       FormBuilderTextField(
//                         controller: mailNum,
//                         name: "mailNum",
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         style: TextStyle(color: theme.primaryColor),
//                         decoration: InputDecoration(
//                           label: Text('Mail ou Numero de telephone',
//                               style: textTheme.titleSmall),
//                           border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(8.00)),
//                           ),
//                           hintText: "...@gmail.com ou +261....",
//                         ),
//                         validator: FormBuilderValidators.compose([
//                           FormBuilderValidators.required(
//                               errorText: "Ce champ  est obligatoire"),
//                         ]),
//                       ),
//                       const SizedBox(height: 16),
//                       PasswordInput(
//                         controller: password,
//                         color: theme.primaryColor,
//                       ),
//                       const SizedBox(height: 16),
//                     ],
//                   ),