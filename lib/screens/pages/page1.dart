import 'package:flutter/material.dart';
import 'package:koodiarana_client/screens/composants/activity.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Activity(),
              Activity(), Activity(), Activity(), Activity(), Activity()

              // Text(
              //   "Aucune activité récente",
              //   textAlign: TextAlign.center,
              //   style: textTheme.displaySmall,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
