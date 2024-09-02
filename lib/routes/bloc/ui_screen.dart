import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_express/screens/bloc/bus_info_bloc.dart';

class LoginScrrenBloc extends StatelessWidget {
  const LoginScrrenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration:
                  const InputDecoration(labelText: 'Username or email address'),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Log in'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                  context.read<BusInfoBloc>().add(BusInfoAllRoutes());
              },
              child: const Text('Forgot password?'),
            ),
          ],
        ),
      ),
 
    );
  }
}