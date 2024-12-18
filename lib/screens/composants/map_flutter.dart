import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:koodiarana_client/bloc/fetch_destination/fetch_destination_bloc.dart';
import 'package:koodiarana_client/screens/pages/loading.dart';
import 'package:latlong2/latlong.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef TapMap = void Function(TapPosition positon, LatLng latLng);

// ignore: must_be_immutable
class MapFlutter extends StatefulWidget {
  TapMap? onTapMap;
  LatLng? currentPosition;
  bool? loading;
  Marker? destination;
  MapFlutter(
      {super.key,
      this.onTapMap,
      this.destination,
      this.loading,
      this.currentPosition});

  @override
  State<MapFlutter> createState() => _MapFlutterState();
}

class _MapFlutterState extends State<MapFlutter> {
  LatLng? myDestination;

  TextEditingController controllerLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<FetchDestinationBloc, FetchDestinationState>(
      listener: (context, state) {
        if (state is SearchDestinationBlank) {
          Fluttertoast.showToast(msg: "Lieu introuvable");
        } else if (state is SearchDestinationDone) {
          Fluttertoast.showToast(msg: "Vous etes maintenant a Mahamasina");
        }
      },
      child: Stack(
        children: [
          FlutterMap(
              options: MapOptions(
                initialCenter: myDestination == null
                    ? widget.currentPosition!
                    : myDestination!,
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
