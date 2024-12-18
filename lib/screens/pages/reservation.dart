import 'package:flutter/material.dart';
import 'package:koodiarana_client/screens/composants/info_place.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// ignore: must_be_immutable
class Reservation extends StatefulWidget {
  dynamic source;
  dynamic destination;
  Reservation({super.key, required this.source, required this.destination});
  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    print("Voici la destination : ${widget.destination['display_name']}");
    print("Voici la source : ${widget.source['display_name']}");

    return Scaffold(
        appBar: AppBar(
          title: Text("Réservation"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.00),
              child: Column(
                spacing: 16,
                children: [
                  InfoPlace(
                      title: "Localisation",
                      data: widget.source['display_name']!),
                  InfoPlace(
                      title: "Destination",
                      data: widget.destination['display_name']!),
                  ShadButton(
                    child: Text("Réservez votre déplacement "),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
