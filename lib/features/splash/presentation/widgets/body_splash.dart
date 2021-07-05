import 'package:flutter/material.dart';
import 'package:factories/core/ui/widgets/background.dart';
import 'package:factories/features/splash/presentation/widgets/splash_loading.dart';
import 'package:factories/features/splash/presentation/widgets/text_loading.dart';

class BodySplash extends StatelessWidget {
  const BodySplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Spacer(),
          Background(),
          TextLoading(),
          SplashLoading(),
        ],
      ),
    );
  }
}
