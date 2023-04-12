import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page/repository/irepository.dart';
import 'package:login_page/ui/bloc/auth_bloc.dart';

import '../injection/injection.dart';
import '../ui/bloc/auth_event.dart';
import '../ui/bloc/auth_state.dart';
import '../ui/home/home_page.dart';
import '../ui/login_page/login_page.dart';
import '../ui/widgets/loading_indicator.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(sl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppScreen(),
      ),
    );
  }
}

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(AppStarted());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthUninitialized) {
            return LoginPage();
          }
          if (state is AuthAuthenticated) {
            return HomePage();
          }
          if (state is AuthUnauthenticated) {
            return LoginPage();
          }
          if (state is AuthLoading) {
            return LoadingIndicator();
          }
          throw Exception();
        },
      ),
    );
  }
}
