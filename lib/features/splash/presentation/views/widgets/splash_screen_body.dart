import 'package:bookly_array/features/splash/presentation/views/widgets/sliding_logo.dart';
import 'package:bookly_array/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController textAnimationController;
  late Animation<Offset> textSlidingAnimation;
  late AnimationController logoAnimationController;
  late Animation<Offset> logoSlidingAnimation;

  @override
  void initState() {
    super.initState();
    textAnimation();
    logoAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    textAnimationController.dispose();
    logoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlidingLogo(
            slidingAnimation: logoSlidingAnimation,
          ),
          const SizedBox(height: 10),
          SlidingText(
            slidingAnimation: textSlidingAnimation,
          )
        ],
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).pushReplacement(AppRouter.homeView);
      },
    );
  }

  void textAnimation() {
    textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    textSlidingAnimation = Tween<Offset>(
      begin: const Offset(0, 30),
      end: Offset.zero,
    ).animate(textAnimationController);
    textAnimationController.forward();
  }

  void logoAnimation() {
    logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    logoSlidingAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: Offset.zero,
    ).animate(logoAnimationController);
    logoAnimationController.forward();
  }
}
