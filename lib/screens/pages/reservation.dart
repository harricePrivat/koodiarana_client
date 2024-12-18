import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Reservation extends StatefulWidget {
  Object? source;
  Object ?destination;
   Reservation({super.key,required this.source,required this.destination});
  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Réservation"),
      ),
      body: Center(
        child: Text("Reservation"),
      ),
    );
  }
}
