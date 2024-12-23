import 'package:flutter/material.dart';
import 'package:koodiarana_client/screens/composants/info_place.dart';
import 'package:koodiarana_client/screens/composants/text_area.dart';
import 'package:koodiarana_client/screens/composants/time_picker.dart';
import 'package:koodiarana_client/screens/pages/list_chauffeurs.dart';
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
  TextEditingController controller = TextEditingController();
  ShadTimeOfDay timeOfDay = ShadTimeOfDay.now();
  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                  Text(
                    "Veuillez bien lire les informations sur votre réservation avant de cliquez sur le bouton de réservation. Et notez bien que la réservation n'est disponible qu'aujourd'hui",
                    style: theme.textTheme.titleLarge,
                  ),
                  TimePicker(
                    label: "Heure de départ:",
                    changeTimeOfDay: (value) {
                      timeOfDay = value;
                    },
                  ),
                  InfoPlace(
                      title: "Localisation",
                      data: widget.source['display_name']!),
                  InfoPlace(
                      title: "Destination",
                      data: widget.destination['display_name']!),
                  ShadForm(
                    key: formKey,
                    child:
                        TextArea(label: "Description", controller: controller),
                  ),
                  ShadButton(
                    child: Text("Réservez votre déplacement "),
                    onPressed: () {
                      if (formKey.currentState!.saveAndValidate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListChauffeurs()));
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
