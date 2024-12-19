part of 'chauffeurs_disponibles_bloc.dart';

sealed class ChauffeursDisponiblesState extends Equatable {
  const ChauffeursDisponiblesState();
  
  @override
  List<Object> get props => [];
}

final class ChauffeursDisponiblesInitial extends ChauffeursDisponiblesState {}
final class ChauffeursDisponiblesDone extends ChauffeursDisponiblesState {}
final class ChauffeursDisponiblesLoading extends ChauffeursDisponiblesState {}
final class ChauffeursDisponiblesError extends ChauffeursDisponiblesState {}



