import 'dart:math';

import 'package:flutter/material.dart';

class RoundedRectangleClipper extends CustomClipper<Path> {
  final double borderRadius;

  RoundedRectangleClipper({this.borderRadius = 20.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from the top-left corner
    path.moveTo(0, 0);

    // Draw a straight line to the top-right corner
    path.lineTo(size.width, 0);

    // Create the rounded bottom-right corner
    path.arcTo(
      Rect.fromLTWH(size.width - borderRadius, size.height - borderRadius,
          borderRadius * 2, borderRadius * 2),
      -pi / 2,
      pi / 2,
      false,
    );

    // Draw a straight line to the bottom-left corner
    path.lineTo(0, size.height);

    // Create the rounded bottom-left corner
    path.arcTo(
      Rect.fromLTWH(
          0, size.height - borderRadius, borderRadius * 2, borderRadius * 2),
      pi / 2,
      pi / 2,
      false,
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
