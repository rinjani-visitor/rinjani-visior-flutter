import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rinjani_visitor/core/theme/color.dart';

ThemeData rinjaniTheme(TextTheme textTheme) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor, primary: seedColor),
    textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
      bodyLarge: GoogleFonts.inter(textStyle: textTheme.bodyLarge),
      bodyMedium: GoogleFonts.inter(textStyle: textTheme.bodyMedium),
      bodySmall: GoogleFonts.inter(textStyle: textTheme.bodySmall),
    ),
    //=== Global button styling ===//
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: seedColor),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)))),
    useMaterial3: true,
  );
}
