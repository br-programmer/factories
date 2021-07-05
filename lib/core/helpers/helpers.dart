import 'package:flutter/services.dart';
import 'package:flutter/material.dart' show Colors;

/// The `Helpers` class helps to group functions/methods, objects, etc.
class Helpers {
  /// The `overlayStyle` method is used to change the color of the StatusBar.
  static void get overlayStyle => SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      );
}
