import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'chauffeurs_disponibles_event.dart';
part 'chauffeurs_disponibles_state.dart';

class ChauffeursDisponiblesBloc
    extends Bloc<ChauffeursDisponiblesEvent, ChauffeursDisponiblesState> {
  ChauffeursDisponiblesBloc() : super(ChauffeursDisponiblesInitial()) {
    on<ChauffeursDisponiblesEvent>((event, emit) {});
  }
}
