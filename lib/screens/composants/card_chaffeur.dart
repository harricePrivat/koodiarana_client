import 'package:flutter/material.dart';
import 'package:koodiarana_client/providers/navigation_manager.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// ignore: must_be_immutable
class CardChauffeur extends StatelessWidget {
  String pathImages;
  String nom;
  CardChauffeur({
    super.key,
    required this.pathImages,
    required this.nom,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Provider.of<NavigationManager>(context, listen: false).changeTab(2);
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 123,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(colors: <Color>[
                Color.fromRGBO(121, 116, 116, 0.8),
                Color.fromRGBO(170, 168, 168, 0.898),
              ])),
          child: Padding(
              padding: const EdgeInsets.all(14.00),
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
                            Text(nom),
                            const Text("Kymco Racing"),
                            Text("3 étoiles")
                          ],
                        ),
                      ))
                    ],
                  )
                ],
              ))),
    );
  }
}
