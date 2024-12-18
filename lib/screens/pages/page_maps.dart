import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koodiarana_client/bloc/fetch_destination/fetch_destination_bloc.dart';
import 'package:koodiarana_client/providers/connection_manager.dart';
import 'package:koodiarana_client/screens/composants/map_flutter.dart';
import 'package:koodiarana_client/screens/pages/loading.dart';
import 'package:koodiarana_client/screens/pages/reservation.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class PageMaps extends StatefulWidget {
  const PageMaps({super.key});

  @override
  State<PageMaps> createState() => _PageMapsState();
}

class _PageMapsState extends State<PageMaps> {
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
      if (_currentPosition == null) {
        return Loading();
      } else {
        return BlocListener<FetchDestinationBloc, FetchDestinationState>(
          listener: (context, state) {
            if (state is FetchDestinationDone) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Reservation(
                          source: state.source,
                          destination: state.destination)));
            }
          },
          child: BlocBuilder<FetchDestinationBloc, FetchDestinationState>(
              builder: (context, state) {
            if (state is FetchDestinationLoading) {
              return MapFlutter(
                  onTapMap: (position, latLng) {},
                  currentPosition: _currentPosition,
                  destination: destination,
                  loading: true);
            }

            if (state is FetchDestinationInitial) {
              return MapFlutter(
                  onTapMap: (position, latLng) async {
                    setState(() {
                      destination = Marker(
                          point: LatLng(latLng.latitude, latLng.longitude),
                          child: Icon(
                            Icons.location_on_rounded,
                            color: Colors.black,
                            size: 35,
                          ));
                    });
                    context.read<FetchDestinationBloc>().add(onTapDestination(
                        destination: LatLng(latLng.latitude, latLng.longitude),
                        source: _currentPosition!));
                  },
                  loading: false,
                  destination: destination,
                  currentPosition: _currentPosition);
            }
            return MapFlutter(
                onTapMap: (position, latLng) async {
                  setState(() {
                    destination = Marker(
                        point: LatLng(latLng.latitude, latLng.longitude),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: Colors.black,
                          size: 35,
                        ));
                  });
                  context.read<FetchDestinationBloc>().add(onTapDestination(
                      destination: LatLng(latLng.latitude, latLng.longitude),
                      source: _currentPosition!));
                },
                loading: false,
                destination: destination,
                currentPosition: _currentPosition);
          }),
        );
      }
    } else {
      return Image.asset(
        'assets/connection_lost.png',
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
  }
}
