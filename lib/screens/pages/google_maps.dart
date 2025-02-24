//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:koodiarana_client/providers/connection_manager.dart';
import 'package:koodiarana_client/screens/pages/loading.dart';
import 'package:provider/provider.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  // final Completer<GoogleMapController> _controller = Completer();
  double latitude = 48.8566;
  double longitude = 2.3522;

  LatLng? _currentPosition;
  Marker? destination;

  Future<void> getCurrentLocalisation() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Future.error('Vous avez besoin de la permission');
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('La permission a ete refuse');
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('La permission a ete refuse de maniere permanente');
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocalisation();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ConnectionManager>(context).getConnectivity) {
      return _currentPosition == null
          ? Loading()
          : GoogleMap(
              onTap: (latLong) {},
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 14,
              ),
              markers: {
                Marker(
                    markerId: MarkerId("Location"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentPosition!),
              },
            );
    } else {
      return Image.asset(
        'assets/connection_lost.png',
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
  }
}
