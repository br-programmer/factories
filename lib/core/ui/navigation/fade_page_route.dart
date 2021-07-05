import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  FadePageRoute(
      {required this.screen,
      Duration duration = const Duration(milliseconds: 500)})
      : super(
          pageBuilder: (_, animation, ___) => FadeTransition(
            opacity: animation,
            child: screen,
          ),
          transitionDuration: duration,
          reverseTransitionDuration: duration,
        );

  final Widget screen;
}
