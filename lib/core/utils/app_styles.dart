import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle styles23W700 = GoogleFonts.poppins(
    fontSize: 23,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
  );
  static const styles24 = TextStyle(
    fontSize: 24.0,
  );
  static const styles16W500 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  static const styles2W500 = TextStyle(
    fontSize: 2.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );
  static const styles16W500white70 = TextStyle(
    color: Colors.white70,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );
  static const styles14W400 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.2,
  );
  static const styles12W500 = TextStyle(
    color: Colors.white70,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );
  static TextStyle styles19W500 = GoogleFonts.poppins(
    fontSize: 19,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );
  static TextStyle errorTextStyle = TextStyle(
    color: Colors.redAccent,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    shadows: [
      Shadow(
        offset: const Offset(1.0, 1.0),
        blurRadius: 3.0,
        color: Colors.black.withOpacity(0.7),
      ),
    ],
  );
}
