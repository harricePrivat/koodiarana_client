import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:koodiarana_client/screens/pages/loading.dart';
import 'package:latlong2/latlong.dart';

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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
            options: MapOptions(
              initialCenter: widget.currentPosition!,
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
        if (widget.loading!) Loading()
      ],
    );
  }
}
