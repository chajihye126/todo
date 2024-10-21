import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_theme.dart';
import 'package:todo/presentation/view/splash_screen.dart';
import 'package:todo/presentation/view_model/animation_view_model.dart';

import 'di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final DI di = DI();

  final AnimationViewModel animationViewModel = AnimationViewModel();

  di.set<AnimationViewModel>(animationViewModel);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
