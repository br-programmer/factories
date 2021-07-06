import 'package:flutter/services.dart';
import 'package:flutter/material.dart' show Colors, FontWeight, TextStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The `Helpers` class helps to group functions/methods, objects, etc.
class Helpers {
  /// The `overlayStyle` method is used to change the color of the StatusBar.
  static void get overlayStyle => SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      );

  static TextStyle get inputStyle =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 35.sp);

  static TextStyle get loginHeaderInputStyle =>
      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w500);

  static TextStyle get loginInputStyle =>
      TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w700);

  static TextStyle get searchStyle =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 40.sp);

  static TextStyle get homeStyle =>
      TextStyle(fontSize: 70.sp, fontWeight: FontWeight.w700);

  static TextStyle get createFactoryStyle => TextStyle(
        fontSize: 50.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static bool userValid(String value) => value.length > 4;

  static bool isValidPassword(String value) =>
      RegExp(r'^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{6,12}$').hasMatch(value);

  static bool nameValid(String name) => name.length >= 10;
  static bool descriptionValid(String description) => description.length >= 100;
}
