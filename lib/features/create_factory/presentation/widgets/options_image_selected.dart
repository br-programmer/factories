import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/ui/app_colors.dart';

class OptionsSelectImage extends StatelessWidget {
  const OptionsSelectImage({Key? key, required this.piker, required this.take})
      : super(key: key);
  final VoidCallback piker;
  final VoidCallback take;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
        color: Colors.white,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Chosse an option',
                  style: Helpers.createFactoryStyle,
                ),
              ),
              _Option(
                text: 'Picker an Image',
                onPressed: piker,
              ),
              Divider(height: 1, color: AppColors.grey),
              _Option(
                text: 'Take an Photo',
                onPressed: take,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: .9,
      onPressed: onPressed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: Helpers.loginHeaderInputStyle.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
