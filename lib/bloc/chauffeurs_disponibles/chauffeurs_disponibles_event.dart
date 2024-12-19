part of 'chauffeurs_disponibles_bloc.dart';

sealed class ChauffeursDisponiblesEvent extends Equatable {
  const ChauffeursDisponiblesEvent();

  @override
  List<Object> get props => [];
}

class OnSearchChauffeurs extends ChauffeursDisponiblesEvent {}
