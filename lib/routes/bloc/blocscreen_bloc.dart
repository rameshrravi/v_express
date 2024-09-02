import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'blocscreen_event.dart';
part 'blocscreen_state.dart';

class BlocscreenBloc extends Bloc<BlocscreenEvent, BlocscreenState> {
  BlocscreenBloc() : super(BlocscreenInitial()) {
    on<BlocscreenEvent>((event, emit) {
      // TODO: implement event handler
    });
    
  }
}
