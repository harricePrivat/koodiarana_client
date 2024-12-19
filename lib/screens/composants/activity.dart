import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(colors: <Color>[
                Color.fromRGBO(121, 116, 116, 0.8),
                Color.fromRGBO(170, 168, 168, 0.898),
              ])),
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    "Vous serez transporté par Mr ${user.displayName!} à 18:35",
                    style: textTheme.titleLarge,
                  ),
                  Text(
                    "Ambohimahintsy, Antananarivo, Madagascar",
                    style: textTheme.titleLarge,
                  )
                ],
              ))),
    );
  }
}
