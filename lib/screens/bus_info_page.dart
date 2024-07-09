import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_express/screens/bloc/bus_info_bloc.dart';

class BusInfoPage extends StatelessWidget {
  const BusInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusInfoBloc(),
      child: const _BusInfoView(),
    );
  }
}

class _BusInfoView extends StatelessWidget {
  const _BusInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<BusInfoBloc>().add(BusInfoAllRoutes());
      }),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<BusInfoBloc, BusInfoState>(builder: (context, state) {
              if (state is BusInfoAllRoutesChangeName) {
                return Text(state.name);
              } else {
                return const CircularProgressIndicator();
              }
            }),
            Builder(builder: (context) {
              final data = context.select<BusInfoBloc, String>((e) =>
                  e.state is BusInfoAllRoutesChangeName
                      ? (e.state as BusInfoAllRoutesChangeName).name
                      : '');
              return Text(data);
            })
          ],
        ),
      ),
    );
  }
}
