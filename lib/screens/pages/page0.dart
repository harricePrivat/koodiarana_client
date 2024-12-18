import 'package:flutter/material.dart';
import 'package:koodiarana_client/providers/navigation_manager.dart';
import 'package:koodiarana_client/screens/composants/card_contenu.dart';
import 'package:provider/provider.dart';

class Page0 extends StatefulWidget {
  const Page0({super.key});

  @override
  State<Page0> createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  List<Icon> icons = [
    Icon(
      Icons.map,
      size: 55,
    ),
    Icon(
      Icons.motorcycle,
      size: 55,
    ),
    Icon(
      Icons.person,
      size: 55,
    )
  ];

  List<String> labels = ["Maps", "Activité", "Compte"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 3,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Provider.of<NavigationManager>(context, listen: false)
                  .goTo(i + 1);
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CardContenu(
                nom: labels[i],
                icon: icons[i],
              ),
            ),
          );
        });
  }
}
