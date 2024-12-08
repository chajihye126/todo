import 'package:flutter/cupertino.dart';

class AnimationViewModel extends ChangeNotifier {
  late AnimationController animationController;
  late Animation<double> animation;

  Future<void> splashAnimation({required TickerProvider vsync, required void Function() navigatorFunction}) async {
    animationController = AnimationController(vsync: vsync, duration: Duration(seconds: 2))..forward();
    animation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animationController.addStatusListener((status) => status == AnimationStatus.completed ? navigatorFunction() : null);
  }
}