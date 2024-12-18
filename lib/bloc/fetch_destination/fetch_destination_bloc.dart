import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:koodiarana_client/services/send_data.dart';
import 'package:latlong2/latlong.dart';
part 'fetch_destination_event.dart';
part 'fetch_destination_state.dart';

class FetchDestinationBloc
    extends Bloc<FetchDestinationEvent, FetchDestinationState> {
  FetchDestinationBloc() : super(FetchDestinationInitial()) {
    on<onTapDestination>((event, emit) async {
      emit(FetchDestinationLoading());
      try {
        final rDestination = await SendData().goGet(
            'https://nominatim.openstreetmap.org/reverse?format=json&lat=${event.destination!.latitude}&lon=${event.destination!.longitude}');
        final rSource = await SendData().goGet(
            'https://nominatim.openstreetmap.org/reverse?format=json&lat=${event.source!.latitude}&lon=${event.source!.longitude}');
        if (rDestination.statusCode == 200 && rSource.statusCode == 200) {
          final destination = jsonDecode(rDestination.body);
          final source = jsonDecode(rSource.body);
          print("Votre destination: $destination");
          emit(FetchDestinationDone(source: source, destination: destination));
          emit(FetchDestinationInitial());
        } else {
          emit(FetchDestinationError());
        }
      } catch (e) {
        emit(FetchDestinationError());
      }
    });
  }
}