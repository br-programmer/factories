import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/ui/navigation/fade_page_route.dart';
import 'package:factories/features/home/presentation/screen/home_screen.dart';
import 'package:factories/features/login/presentation/screen/login_screen.dart';
import 'package:factories/features/splash/presentation/bloc/bloc.dart';
import 'package:factories/features/splash/presentation/widgets/body_splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void _listener(BuildContext context, SplashState state) {
    if (state.status == SplashStatus.logout) {
      Navigator.pushReplacement(
        context,
        FadePageRoute(
          duration: const Duration(milliseconds: 900),
          screen: LoginScreen.init(),
        ),
      );
    } else if (state.status == SplashStatus.login) {
      Navigator.pushReplacement(
        context,
        FadePageRoute(screen: HomeScreen.init()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBLoC, SplashState>(
      listener: _listener,
      bloc: SplashBLoC(context.read())..add(LoadingEvent()),
      child: Scaffold(body: const BodySplash()),
    );
  }
}
