import 'package:auto_size_text/auto_size_text.dart';
import 'package:electric_tile_demo/utils/constants/colors.dart';

import 'package:electric_tile_demo/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.label,
      this.icon,
      this.backgroundColor,
      this.foregroundcolor,
      this.fontSize,
      this.fontWeight,
      required this.onPressed,
      this.width});

  final String label;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? foregroundcolor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback onPressed;
  final double? width;
  @override
  Widget build(BuildContext context) {
    iColors().secondary; // Use default color if foregroundColor is null
    return SizedBox(
      width: width ?? double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
        ),
        child: Row(
          mainAxisAlignment:
              icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!, // Muestra el ícono solo si no es null
              const Gap(25), // Espacio entre ícono y texto
            ], // El ícono
            // Espacio entre ícono y texto

            AutoSizeText(label,
                style: GoogleFonts.poppins(
                  fontSize: fontSize ?? 19,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: foregroundcolor ?? Color.fromARGB(255, 20, 33, 61),
                ))
          ],
        ),
      ),
    );
  }
}
