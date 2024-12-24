import 'package:flutter/material.dart';
import 'package:koodiarana_client/screens/composants/input_form.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Ajout d'utilisateur"),
        ),
        body: SingleChildScrollView(
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
                    ShadInputFormField(
                      label: Text("votre email *"),
                      placeholder: Text('entrez votre mail'),
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
                    ShadButton(
                      onPressed: () {
                        if (formKey.currentState!.saveAndValidate()) {}
                      },
                      child: Text("Créer mon compte"),
                    )
                  ],
                ),
              )),
        ));
  }
}
