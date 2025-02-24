import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef void OnTapMaps(LatLng latLng);

// ignore: must_be_immutable
class GoogleMaps extends StatefulWidget {
  LatLng currentPosition;
  OnTapMaps onTap;
  GoogleMaps({super.key, required this.onTap, required this.currentPosition});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onTap: widget.onTap,
      initialCameraPosition: CameraPosition(
        target: widget.currentPosition,
        zoom: 14,
      ),
      markers: {
        Marker(
            markerId: MarkerId("Location"),
            icon: BitmapDescriptor.defaultMarker,
            position: widget.currentPosition),
      },
    );
  }
}
