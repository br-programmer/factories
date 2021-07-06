import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key? key, this.color = AppColors.green})
      : super(
          elevation: 0,
          backgroundColor: AppColors.scaffoldColor,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: color),
          title: Text('New Factory',
              style: Helpers.loginInputStyle.copyWith(color: color)),
        );
  final Color color;
}
