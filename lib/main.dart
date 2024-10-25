import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_theme.dart';
import 'package:todo/presentation/view/splash_screen.dart';
import 'package:todo/presentation/view_model/animation_view_model.dart';
import 'package:todo/presentation/view_model/main_tab_view_model.dart';

import 'di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final DI di = DI();

  final AnimationViewModel animationViewModel = AnimationViewModel();
  final MainTabViewModel mainTabViewModel = MainTabViewModel();

  di.set<AnimationViewModel>(animationViewModel);
  di.set<MainTabViewModel>(mainTabViewModel);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
