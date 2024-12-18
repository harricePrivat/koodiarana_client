part of 'fetch_destination_bloc.dart';

sealed class FetchDestinationEvent extends Equatable {
  const FetchDestinationEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class onTapDestination extends FetchDestinationEvent {
  LatLng? source;
  LatLng? destination;
  onTapDestination({required this.destination, required this.source});

  @override
  List<Object> get props => [source!, destination!];
}

// ignore: must_be_immutable
class OnSearchDestination extends FetchDestinationEvent {
  String? searchDestination;
  LatLng? source;
  OnSearchDestination({required this.searchDestination, required this.source});

  @override
  List<Object> get props => [searchDestination!];
}
