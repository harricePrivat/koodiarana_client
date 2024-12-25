import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:koodiarana_client/bloc/ajout_utilisateur/ajout_utilisateur_bloc.dart';
import 'package:koodiarana_client/models/user.dart';
import 'package:koodiarana_client/screens/composants/input_date.dart';
import 'package:koodiarana_client/screens/composants/input_form.dart';
import 'package:koodiarana_client/screens/composants/input_num.dart';
import 'package:koodiarana_client/screens/composants/password_input.dart';
import 'package:koodiarana_client/screens/pages/loading.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AjoutUtilisateur extends StatefulWidget {
  const AjoutUtilisateur({super.key});

  @override
  State<AjoutUtilisateur> createState() => _AjoutUtilisateurState();
}

class _AjoutUtilisateurState extends State<AjoutUtilisateur> {
  final formKey = GlobalKey<ShadFormState>();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  DateTime pickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Ajout d'utilisateur"),
        ),
        body: BlocListener<AjoutUtilisateurBloc, AjoutUtilisateurState>(
          listener: (context, state) {
            if (state is AjoutUtilisateurDone) {
              showDialog(
                  context: context,
                  builder: (context) => Padding(
                        padding: EdgeInsets.all(16),
                        child: ShadDialog.alert(
                          title: Text("Créer avec succès !!"),
                          description: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Un mail de validation a été envoyé",
                            ),
                          ),
                          actions: [
                            ShadButton(
                              child: const Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ));
            }
          },
          child: BlocBuilder<AjoutUtilisateurBloc, AjoutUtilisateurState>(
              builder: (context, state) {
            if (state is AjoutUtilisateurLoading) {
              return Loading();
            }
            return SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(16.00),
                  child: ShadForm(
                    key: formKey,
                    child: Column(
                      spacing: 16,
                      children: [
                        Text(
                          "Bienvenue dans Koodiarana!Créer votre compte pour commencer votre expérience",
                          style: theme.textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                        InputForm(
                            label: "votre nom *",
                            placeholder: "entrez votre nom",
                            controller: nom),
                        InputForm(
                            label: "votre prénom *",
                            placeholder: "entrez votre prénom",
                            controller: prenom),
                        InputDate(
                          datePicker: pickedDate,
                          onDateChanged: (value) {
                            setState(() {
                              pickedDate = value!;
                            });
                          },
                        ),
                        ShadInputFormField(
                          label: Text("votre email *"),
                          controller: mail,
                          placeholder: Text('entrez votre mail'),
                          keyboardType: TextInputType.emailAddress,
                          decoration: ShadDecoration(
                              border: ShadBorder(
                            top: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey),
                            left: BorderSide(color: Colors.grey),
                            right: BorderSide(color: Colors.grey),
                          )),
                          validator: (v) {
                            if (v.isEmpty) {
                              return 'ce champ est obligatoire';
                            } else if (!v.contains('@') || !v.contains('.')) {
                              return 'veuillez entrez un mail valide';
                            }
                            return null;
                          },
                        ),
                        InputNum(controller: num),
                        PasswordInput(
                            rePassword: false,
                            controller: password,
                            color: theme.primaryColor),
                        PasswordInput(
                            rePassword: false,
                            controller: rePassword,
                            color: theme.primaryColor),
                        ShadButton(
                          onPressed: () {
                            if (formKey.currentState!.saveAndValidate()) {
                              if (password.text.compareTo(rePassword.text) ==
                                  0) {
                                context.read<AjoutUtilisateurBloc>().add(
                                    OnAddUser(
                                        users: Users(
                                            nom: nom.text,
                                            prenom: prenom.text,
                                            phoneNumber: num.text,
                                            datedeNaissance:
                                                pickedDate.toString(),
                                            email: mail.text),
                                        password: password.text));
                                clearForm();
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Veuillez vérifier votre mot de passe");
                              }
                            }
                          },
                          child: Text("Créer mon compte"),
                        )
                      ],
                    ),
                  )),
            );
          }),
        ));
  }

  void clearForm() {
    num.clear();
    nom.clear();
    prenom.clear();
    mail.clear();
    password.clear();
    rePassword.clear();
  }
}
