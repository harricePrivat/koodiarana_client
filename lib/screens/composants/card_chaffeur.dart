import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// ignore: must_be_immutable
class CardChauffeur extends StatelessWidget {
  String pathImages;
  String nom;
  String niveau;
  CardChauffeur(
      {super.key,
      required this.pathImages,
      required this.nom,
      required this.niveau});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            //color: Colors.red
            gradient: const LinearGradient(colors: <Color>[
              Color.fromRGBO(82, 81, 81, 0.8),
              Color.fromRGBO(170, 168, 168, 0.898),
            ])),
        child: Padding(
            padding: const EdgeInsets.all(16.00),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ShadAvatar(
                      pathImages,
                      size: const Size(90, 90),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.00),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nom: $nom"),
                          const Text("Statut: Etudiant"),
                          Text("Niveau: $niveau")
                        ],
                      ),
                    ))
                  ],
                )
              ],
            )));
  }
}
