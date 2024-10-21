import 'package:flutter/material.dart';
import 'package:todo/core/utils/size_utils.dart';
import 'package:todo/di/di.dart';
import 'package:todo/presentation/view/main_tab_screen.dart';
import 'package:todo/presentation/view_model/animation_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  final AnimationViewModel animationViewModel = DI().get<AnimationViewModel>();

  @override
  void initState() {
    super.initState();

    animationViewModel.splashAnimation(vsync: this, navigatorFunction: _navigatorFunction);
    animationViewModel.addListener(updateScreen);
  }

  void updateScreen() => setState(() {});

  void _navigatorFunction() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainTabScreen()));

  @override
  void dispose() {
    animationViewModel.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1A3D66),
        body: AnimatedBuilder(animation: animationViewModel.animation, builder: (context, child) => Transform.translate(offset: Offset(0, animationViewModel.animation.value * ssH(context) / 2)),),
      ),
    );
  }
}
