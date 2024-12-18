import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:koodiarana_client/bloc/fetch_destination/fetch_destination_bloc.dart';
import 'package:koodiarana_client/screens/pages/loading.dart';
import 'package:koodiarana_client/screens/pages/reservation.dart';
import 'package:latlong2/latlong.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef TapMap = void Function(TapPosition positon, LatLng latLng);

// ignore: must_be_immutable
class MapFlutter extends StatefulWidget {
  TapMap? onTapMap;
  LatLng? currentPosition;
  bool? loading;
  Marker? destination;
  LatLng? myDestination;
  MapFlutter(
      {super.key,
      this.myDestination,
      this.onTapMap,
      this.destination,
      this.loading,
      this.currentPosition});

  @override
  State<MapFlutter> createState() => _MapFlutterState();
}

class _MapFlutterState extends State<MapFlutter> {
  TextEditingController controllerLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<FetchDestinationBloc, FetchDestinationState>(
      listener: (context, state) {
        if (state is SearchDestinationBlank) {
          showDialog(
              context: context,
              builder: (context) => Padding(
                    padding: EdgeInsets.all(16),
                    child: ShadDialog.alert(
                      title: const Text('Lieu introuvable'),
                      description: const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Le lieux que vous cherchez n\'est pas disponible dans Koodiarana',
                        ),
                      ),
                      actions: [
                        ShadButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ));
        } else if (state is SearchDestinationDone) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Reservation(
                      source: state.source, destination: state.destination)));
          // Fluttertoast.showToast(msg: "Vous etes maintenant a Mahamasina");
        }
      },
      child: Stack(
        children: [
          FlutterMap(
              options: MapOptions(
                initialCenter: widget.currentPosition == null
                    ? widget.myDestination!
                    : widget.currentPosition!,
                initialZoom: 15,
                onTap: widget.onTapMap,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                  subdomains: const ['a', 'b', 'c'],
                  tileProvider: FMTCStore('mapStore').getTileProvider(),
                ),
                MarkerLayer(markers: [
                  Marker(
                      point: widget.currentPosition!,
                      child: Icon(
                        Icons.location_on_rounded,
                        color: Colors.red,
                        size: 35,
                      )),
                  if (widget.destination != null) widget.destination!
                ])
              ]),
          if (!widget.loading!)
            Positioned(
              left: 15,
              top: 15,
              child: Row(
                children: [
                  Card(
                    color: theme.secondaryHeaderColor,
                    child: IconButton(
                      onPressed: () {
                        context.read<FetchDestinationBloc>().add(
                            OnSearchDestination(
                                source: widget.currentPosition,
                                searchDestination: controllerLocation.text));
                        controllerLocation.clear();
                      },
                      icon: Icon(
                        Icons.search,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.00),
                        color: theme.secondaryHeaderColor,
                      ),
                      width: 260,
                      child: ShadInputFormField(
                          controller: controllerLocation,
                          placeholder: const Text(
                            'Recherchez votre destination ici',
                          )),
                    ),
                  ),
                ],
              ),
            ),
          if (widget.loading!) Loading()
        ],
      ),
    );
  }
}
