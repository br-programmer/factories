import 'package:flutter/material.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/ui/app_colors.dart';

class HeaderParamsFactory extends StatelessWidget {
  const HeaderParamsFactory({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Helpers.createFactoryStyle,
        children: [
          TextSpan(
            text: ' *',
            style: Helpers.createFactoryStyle.copyWith(
              color: AppColors.requiredColor,
            ),
          ),
        ],
      ),
    );
  }
}
