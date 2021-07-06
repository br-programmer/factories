import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/ui/app_colors.dart';
import 'package:factories/core/ui/widgets/my_button.dart';
import 'package:factories/features/home/presentation/bloc/bloc.dart';

class ButtonAddFactory extends StatelessWidget {
  const ButtonAddFactory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBLoC = HomeBLoC.of(context);
    return BlocBuilder<HomeBLoC, HomeState>(
      buildWhen: (previous, current) =>
          previous.showButton != current.showButton,
      builder: (_, state) => AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        bottom:
            state.showButton ? kToolbarHeight / 2.5 : -kToolbarHeight * 1.75,
        curve: Curves.fastLinearToSlowEaseIn,
        left: 25,
        right: 25,
        child: SafeArea(
          top: false,
          child: Align(
            child: MyButton(
              colorButton: AppColors.green,
              opacity: .95,
              textButton: 'Create a factory',
              padding: const EdgeInsets.symmetric(vertical: 20),
              onPressed: homeBLoC.createFactory,
            ),
          ),
        ),
      ),
    );
  }
}
