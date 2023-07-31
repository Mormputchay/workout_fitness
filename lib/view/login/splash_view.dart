import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/view/login/on_boarding_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Image.asset(
              "assets/img/virtual_fitness.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "WorkOut Fitness",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
        backgroundColor: TColor.primary,
        splashIconSize: 250,
        duration: 4000,
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.topToBottom,
        animationDuration: const Duration(seconds: 1),
        nextScreen: const OnBoardingView());
  }
}
