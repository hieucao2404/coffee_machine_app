import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color coffeeBrown = Color(0xFF6F4E37);
  static const Color lightBrown = Color(0xFFD4A574);
  static const Color creamWhite = Color(0xFFFFFBF0);
  
  // Background
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color cardWhite = Colors.white;
  static const Color cardDark = Color(0xFF3E2723);
  
  // Status Colors
  static const Color statusReady = Color(0xFF4CAF50);
  static const Color statusLowStock = Color(0xFFFF9800);
  static const Color statusEmpty = Color(0xFFF44336);
  static const Color statusActive = Color(0xFF2196F3);
  
  // Text
  static const Color textDark = Color(0xFF212121);
  static const Color textMedium = Color(0xFF757575);
  static const Color textLight = Color(0xFFBDBDBD);
  
  // Accents
  static const Color accentOrange = Color(0xFFFF6F00);
  static const Color accentGreen = Color(0xFF00C853);
  
  // Gradients
  static const LinearGradient brownGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF8D6E63), Color(0xFF5D4037)],
  );
}