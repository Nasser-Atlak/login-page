import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text('You are now logged in!'),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                context.read<AuthBloc>().add(LoggedOut());
              },
              child: Text('Logout', style: TextStyle(color: Colors.white)),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
