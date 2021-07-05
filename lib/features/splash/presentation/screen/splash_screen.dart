import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/features/splash/presentation/bloc/bloc.dart';
import 'package:factories/features/splash/presentation/widgets/body_splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void _listener(BuildContext context, SplashState state) {
    if (state.status == SplashStatus.logout) {
      //TODO: GO TO LOGIN SCREEN
    } else if (state.status == SplashStatus.login) {
      //TODO: GO TO HOME SCREEN
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBLoC, SplashState>(
      listener: _listener,
      bloc: SplashBLoC()..add(LoadingEvent()),
      child: Scaffold(body: const BodySplash()),
    );
  }
}
