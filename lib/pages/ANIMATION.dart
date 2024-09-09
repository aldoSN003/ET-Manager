import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  static const String assetName = 'assets/svg/ETMainLogo.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                  begin: 50,
                  end: MediaQuery.sizeOf(context).width *
                      0.9), // Adjust the size range as needed
              duration: const Duration(milliseconds: 1500),
              curve: Curves
                  .easeInOut, // Optional: Add easing for smoother animation
              builder: (context, size, _) {
                return SvgPicture.asset(
                  assetName,
                  width: size,
                  height: size,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
