import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koodiarana_client/screens/composants/card_chaffeur.dart';
import 'package:provider/provider.dart';

class ListChauffeurs extends StatefulWidget {
  const ListChauffeurs({super.key});

  @override
  State<ListChauffeurs> createState() => _ListChauffeursState();
}

class _ListChauffeursState extends State<ListChauffeurs> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = Provider.of<User?>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Chauffeurs:"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.00),
          child: SingleChildScrollView(
            child: Column(spacing: 16, children: [
              Text("Voici la liste des chauffeurs disponibles:",
                  style: textTheme.titleLarge),
              CardChauffeur(
                pathImages: user!.photoURL!,
                nom: "Brice",
              ),
              CardChauffeur(
                pathImages: user.photoURL!,
                nom: "Brice",
              ),
              CardChauffeur(
                pathImages: user.photoURL!,
                nom: "Brice",
              ),
              CardChauffeur(
                pathImages: user.photoURL!,
                nom: "Brice",
              ),
              CardChauffeur(
                pathImages: user.photoURL!,
                nom: "Brice",
              ),
              CardChauffeur(
                pathImages: user.photoURL!,
                nom: "Brice",
              ),
              CardChauffeur(
                pathImages: user.photoURL!,
                nom: "Brice",
              ),
              CardChauffeur(
                pathImages: user.photoURL!,
                nom: "Brice",
              ),
              CardChauffeur(pathImages: user.photoURL!, nom: "Brice"),
            ]),
          ),
        ));
  }
}
