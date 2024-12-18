import 'package:flutter/material.dart';
import 'package:koodiarana_client/providers/navigation_manager.dart';
import 'package:koodiarana_client/screens/pages/page1.dart';
import 'package:koodiarana_client/screens/pages/page2.dart';
import 'package:koodiarana_client/screens/pages/page_maps.dart';
import 'package:koodiarana_client/services/connectivity.dart';

import 'package:provider/provider.dart';

import 'page0.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  List<Widget> listPages = [Page0(), PageMaps(), Page1(), Page2()];
  List<String> title = ["Accueil", "Koodiarana Maps", "Activités", "Comptes"];


  @override
  void initState() {
    super.initState();
    ConnectivityServices().checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<NavigationManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 16,
          title: Text(
            title[tabManager.tabValue],
            style: theme.textTheme.displayLarge,
          ),
        ),
        body: listPages[tabManager.tabValue],
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            selectedIconTheme:
                IconThemeData(size: 40, color: theme.primaryColor),
            unselectedItemColor: theme.primaryColor,
            unselectedLabelStyle: TextStyle(color: theme.primaryColor),
            currentIndex: tabManager.tabValue,
            onTap: (value) {
              tabManager.changeTab(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Maps'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.motorcycle), label: 'Activité'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Compte')
            ]),
      );
    });
  }
}
