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
    final user = Provider.of<User?>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Chauffeurs:"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.00),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardChauffeur(
                    pathImages: user!.photoURL!, nom: "Brice", niveau: "L3"),
                CardChauffeur(
                    pathImages: user.photoURL!, nom: "Brice", niveau: "L3"),
                CardChauffeur(
                    pathImages: user.photoURL!, nom: "Brice", niveau: "L3"),
              ],
            ),
          ),
        ));
  }
}
