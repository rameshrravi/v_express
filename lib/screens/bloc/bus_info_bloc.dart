import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bus_info_event.dart';
part 'bus_info_state.dart';

class BusInfoBloc extends Bloc<BusInfoEvent, BusInfoState> {
  BusInfoBloc() : super(BusInfoInitial()) {
    on<BusInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<BusInfoAllRoutes>((event, emit) {
      emit(BusInfoAllRoutesChangeName(name: 'Hello World!'));
    });

      
     on<BusInfoAllRoutes>((event, emit) {
      _onSubmitted( event, emit);
      emit(UILoginButtonPress());
    });
  }
void _onSubmitted(BusInfoAllRoutes event, Emitter<BusInfoState> emit) {
  print("kjbsbsSs");
}
  String _busRoutespaths() {
    return '';
  }
}
