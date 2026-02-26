import 'package:flutter/material.dart';

/// Adaptive game graphics system for Noor Ka Safar
/// Supports all screen sizes with responsive scaling

class GameColors {
  // Primary colors - Warm & Inviting
  static const Color primary = Color(0xFF00BFA5);       // Teal - Noor color
  static const Color primaryLight = Color(0xFF5DF2D6);
  static const Color primaryDark = Color(0xFF008E76);
  
  // Secondary colors - Warm & Playful
  static const Color secondary = Color(0xFFFF9800);     // Orange
  static const Color secondaryLight = Color(0xFFFFC947);
  static const Color secondaryDark = Color(0xFFC66900);
  
  // Accent colors
  static const Color accent = Color(0xFFE91E63);        // Pink
  static const Color accentLight = Color(0xFFFF6090);
  
  // Background colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF263238);
  static const Color surface = Colors.white;
  static const Color surfaceDark = Color(0xFF37474F);
  
  // Game world colors
  static const Color sky = Color(0xFF87CEEB);           // Sky blue
  static const Color skySunset = Color(0xFFFFB74D);     // Sunset orange
  static const Color grass = Color(0xFF81C784);         // Green
  static const Color water = Color(0xFF4FC3F7);         // Water blue
  static const Color sand = Color(0xFFFFD54F);           // Sand
  static const Color night = Color(0xFF1A237E);         // Night blue
  
  // UI colors
  static const Color starGold = Color(0xFFFFD700);
  static const Color starSilver = Color(0xFFC0C0C0);
  static const Color starBronze = Color(0xFFCD7F32);
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  
  // Character colors for Noor
  static const Color noorBody = Color(0xFF00BFA5);
  static const Color noorEyes = Colors.white;
  static const Color noorBlush = Color(0xFFFFB6C1);
}

/// Game dimensions and responsive utilities
class GameDimensions {
  // Base dimensions (designed for 1920x1080)
  static const double baseWidth = 1920;
  static const double baseHeight = 1080;
  
  // Common game element sizes (base)
  static const double letterCardSize = 200;
  static const double buttonHeight = 80;
  static const double buttonRadius = 40;
  static const double iconSize = 64;
  static const double starSize = 48;
  static const double characterHeight = 300;
  static const double characterWidth = 200;
  
  // Spacing
  static const double paddingSmall = 8;
  static const double paddingMedium = 16;
  static const double paddingLarge = 24;
  static const double paddingXLarge = 32;
  
  // Border radius
  static const double radiusSmall = 8;
  static const double radiusMedium = 16;
  static const double radiusLarge = 24;
  static const double radiusXLarge = 32;
}

/// Responsive scaling mixin for adaptive graphics
mixin ResponsiveMixin<T extends StatefulWidget> on State<T> {
  late double _scaleX;
  late double _scaleY;
  late double _scale;
  late bool _isInitialized;
  
  Size? _screenSize;
  
  void initResponsive(BuildContext context) {
    if (_isInitialized && _screenSize == MediaQuery.of(context).size) return;
    
    _screenSize = MediaQuery.of(context).size;
    final designSize = const Size(GameDimensions.baseWidth, GameDimensions.baseHeight);
    
    _scaleX = _screenSize!.width / designSize.width;
    _scaleY = _screenSize!.height / designSize.height;
    _scale = (_scaleX + _scaleY) / 2;
    _isInitialized = true;
  }
  
  double get scaleX => _scaleX;
  double get scaleY => _scaleY;
  double get scale => _scale;
  
  /// Scale a value based on screen size
  double scaleValue(double value) => value * _scale;
  
  /// Scale horizontally
  double scaleXValue(double value) => value * _scaleX;
  
  /// Scale vertically
  double scaleYValue(double value) => value * _scaleY;
  
  /// Get responsive font size
  double fontSize(double baseSize) => baseSize * _scale;
  
  /// Check if screen is small (mobile)
  bool get isSmallScreen => _screenSize != null && _screenSize!.width < 600;
  
  /// Check if screen is medium (tablet)
  bool get isMediumScreen => _screenSize != null && 
      _screenSize!.width >= 600 && _screenSize!.width < 1200;
  
  /// Check if screen is large (desktop)
  bool get isLargeScreen => _screenSize != null && _screenSize!.width >= 1200;
  
  /// Get responsive padding
  EdgeInsets responsivePadding({
    double? all,
    double? horizontal,
    double? vertical,
  }) {
    final h = horizontal != null ? horizontal * _scaleX : 0.0;
    final v = vertical != null ? vertical * _scaleY : 0.0;
    final a = all != null ? all * _scale : 0.0;
    
    if (a != 0) return EdgeInsets.all(a);
    return EdgeInsets.symmetric(horizontal: h, vertical: v);
  }
}

/// Game theme data
class GameTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: GameColors.primary,
        primary: GameColors.primary,
        secondary: GameColors.secondary,
        surface: GameColors.surface,
        error: GameColors.error,
      ),
      fontFamily: 'Nastaliq', // Urdu font
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: GameColors.primaryDark,
        ),
        displayMedium: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: GameColors.primaryDark,
        ),
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: GameColors.primary,
        ),
        titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: GameColors.primaryDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: Colors.black87,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: GameColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GameDimensions.radiusLarge),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GameDimensions.radiusMedium),
        ),
      ),
    );
  }
}
