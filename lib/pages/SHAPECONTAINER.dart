import 'package:flutter/material.dart';

class CustomShapeContainer extends StatelessWidget {
  const CustomShapeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bezier Curves Example'),
      ),
      body: Stack(
        children: [
          // Your main scaffold content
          const Center(child: Text('Main Scaffold Content')),

          // Positioned container with custom shape
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: screenWidth,
              height:
                  300, // Adjust this as needed for the height of the container
              child: CustomPaint(
                size: Size(screenWidth, 200),
                painter: BezierPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BezierPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from the bottom-left corner
    path.moveTo(0, size.height);

    // Draw a line to the top-left corner
    path.lineTo(0, 50);

    // Draw the top-left Bezier curve
    path.quadraticBezierTo(
      size.width * 0.05, // Control point x
      0, // Control point y
      size.width * 0.2, // End point x
      0, // End point y
    );

    // Draw a straight line across the top to the right Bezier curve
    path.lineTo(size.width * 0.8, 0);

    // Draw the top-right Bezier curve
    path.quadraticBezierTo(
      size.width * 0.95, // Control point x
      0, // Control point y
      size.width, // End point x
      50, // End point y
    );

    // Draw a line to the bottom-right corner
    path.lineTo(size.width, size.height);

    // Close the path to complete the shape
    path.close();

    // Draw the path onto the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint for now
  }
}
