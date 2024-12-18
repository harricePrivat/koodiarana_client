part of 'fetch_destination_bloc.dart';

sealed class FetchDestinationState extends Equatable {
  const FetchDestinationState();

  @override
  List<Object> get props => [];
}

final class FetchDestinationInitial extends FetchDestinationState {}

// ignore: must_be_immutable
final class FetchDestinationDone extends FetchDestinationState {
  Object? source;
  Object? destination;
  FetchDestinationDone({
    required this.destination,
    required this.source,
  });

  @override
  List<Object> get props => [source!, destination!];
}

final class FetchDestinationLoading extends FetchDestinationState {}

final class FetchDestinationError extends FetchDestinationState {}

// ignore: must_be_immutable
final class SearchDestinationDone extends FetchDestinationState {
  Object? source;
  Object? destination;

  SearchDestinationDone({required this.source, required this.destination});

  @override
  List<Object> get props => [source!, destination!];
}

final class SearchDestinationBlank extends FetchDestinationState {}

final class SearchDestinationLoading extends FetchDestinationState {}
