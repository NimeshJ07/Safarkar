import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SafarTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      labelLarge: GoogleFonts.montserrat(
        color: Colors.black87,
      ),
      headlineSmall: GoogleFonts.montserrat(
        color: Colors.black87,
      ));
  static TextTheme darkTextTheme = TextTheme(
      labelLarge: GoogleFonts.montserrat(
        color: Colors.white70,
      ),
      headlineSmall: GoogleFonts.montserrat(
        color: Colors.white70,
      ));
}
