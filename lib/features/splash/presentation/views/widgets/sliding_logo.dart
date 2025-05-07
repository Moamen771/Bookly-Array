import 'package:flutter/material.dart';

class SlidingLogo extends StatelessWidget {
  const SlidingLogo({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Image.asset('assets/images/bookly_logo.png'),
        );
      },
    );
  }
}
