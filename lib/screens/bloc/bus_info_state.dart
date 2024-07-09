part of 'bus_info_bloc.dart';

@immutable
sealed class BusInfoState {}

final class BusInfoInitial extends BusInfoState {}

class BusInfoAllRoutesChangeName extends BusInfoState {
  final String name;

  BusInfoAllRoutesChangeName({required this.name});
}
