import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/core/ui/app_theme.dart';
import 'package:factories/dependencies.dart';
import 'package:factories/features/splash/presentation/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1100, 2050),
      builder: () => MultiRepositoryProvider(
        providers: MyGlobalDependencies.buildDependencies(),
        child: MaterialApp(
          title: 'Factories',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
