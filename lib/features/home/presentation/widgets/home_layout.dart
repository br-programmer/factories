import 'package:flutter/material.dart';
import 'package:factories/features/home/presentation/widgets/widgets.dart'
    show HomeBody, ButtonAddFactory, HomeLoading;

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        HomeBody(),
        ButtonAddFactory(),
        HomeLoading(),
      ],
    );
  }
}
