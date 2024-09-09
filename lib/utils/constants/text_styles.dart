// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:electric_tile_demo/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class iTextStyles {
  final Color? foreGroundColor;
  iTextStyles({this.foreGroundColor});

  Color get finalColor =>
      foreGroundColor ?? const Color.fromARGB(255, 20, 33, 61);

  TextStyle get heading2 {
    return GoogleFonts.poppins(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: finalColor,
    );
  }

  TextStyle get heading1 {
    return GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w600, color: finalColor);
  }

  TextStyle get subHeading2 {
    return GoogleFonts.poppins(
        fontSize: 19, fontWeight: FontWeight.w400, color: finalColor);
  }

  TextStyle get smallText {
    return GoogleFonts.poppins(
        fontSize: 12, fontWeight: FontWeight.w500, color: finalColor);
  }

  TextStyle get text {
    return GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w500, color: finalColor);
  }

  TextStyle get subHeading1 {
    return GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w500, color: finalColor);
  }
}
