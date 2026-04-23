import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF1976D2); // Medical blue
  static const Color accentGreen = Color(0xFF43A047); // Healing green
  static const Color emergencyRed = Color(0xFFD32F2F); // Emergency red
  static const Color background = Color(0xFFF7F9FB); // Soft background
  static const Color cardWhite = Colors.white;

  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.light(
          primary: primaryBlue,
          secondary: accentGreen,
          background: background,
          error: emergencyRed,
        ),
        scaffoldBackgroundColor: background,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 1,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: cardWhite,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primaryBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: accentGreen, width: 2),
          ),
        ),
        cardTheme: const CardThemeData(
          color: cardWhite,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, color: primaryBlue, fontSize: 22),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
