import 'package:factories/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.colorButton,
    required this.textButton,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    this.opacity = .85,
  })  : assert(opacity >= 0.0 && opacity <= 1.0),
        super(key: key);
  final Color colorButton;
  final String textButton;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: opacity,
      child: Container(
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: padding,
        alignment: Alignment.center,
        child: Text(
          textButton,
          style: Helpers.loginHeaderInputStyle.copyWith(color: Colors.white),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
