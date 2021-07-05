import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/core/ui/widgets/loading.dart';

class SplashLoading extends StatelessWidget {
  const SplashLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Loading(
        radius: 100.r,
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor,
        ],
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
