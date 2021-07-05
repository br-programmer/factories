import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyInput extends StatelessWidget {
  const MyInput({
    Key? key,
    required this.placeHolder,
    this.obscureText = false,
    this.onTap,
    this.suffix,
    this.borderColor = AppColors.grey,
    required this.onChanged,
  }) : super(key: key);

  final String placeHolder;
  final bool obscureText;
  final VoidCallback? onTap;
  final IconData? suffix;
  final Color borderColor;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: borderColor),
      ),
      obscureText: obscureText,
      placeholder: placeHolder,
      placeholderStyle: Helpers.inputStyle.copyWith(color: AppColors.grey),
      style: Helpers.inputStyle,
      padding: const EdgeInsets.all(15),
      suffix: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(suffix, color: AppColors.grey),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
