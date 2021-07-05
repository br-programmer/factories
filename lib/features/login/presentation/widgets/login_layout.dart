import 'package:flutter/material.dart';
import 'package:factories/features/login/presentation/widgets/widgets.dart'
    show LoginBody, LoginLoading;

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [LoginBody(), LoginLoading()]);
  }
}
