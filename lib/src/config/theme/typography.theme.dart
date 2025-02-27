import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTypography {
  static TextStyle heading1({
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.black,
        fontStyle: fontStyle,
      );

  static TextStyle heading2({
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.black,
        fontStyle: fontStyle,
      );

  static TextStyle heading3({
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.black,
        fontStyle: fontStyle,
      );

  static TextStyle heading4({
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.black,
        fontStyle: fontStyle,
      );

  static TextStyle body({
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.black,
        fontStyle: fontStyle,
      );
}
