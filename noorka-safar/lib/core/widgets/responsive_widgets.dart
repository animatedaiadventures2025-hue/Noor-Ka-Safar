import 'package:flutter/material.dart';
import '../theme/game_theme.dart';

/// Responsive game screen wrapper
/// Automatically adapts to any screen size
class GameScreen extends StatefulWidget {
  final Widget Function(BuildContext context, Size size) builder;
  final Color? backgroundColor;
  final bool useBackground;
  
  const GameScreen({
    super.key,
    required this.builder,
    this.backgroundColor,
    this.useBackground = true,
  });
  
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        
        return Container(
          width: size.width,
          height: size.height,
          decoration: widget.useBackground
              ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      GameColors.sky,
                      GameColors.sky.withValues(alpha: 0.7),
                      GameColors.grass.withValues(alpha: 0.3),
                    ],
                  ),
                )
              : BoxDecoration(color: widget.backgroundColor),
          child: widget.builder(context, size),
        );
      },
    );
  }
}

/// Game button with responsive sizing
class GameButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool isLarge;
  
  const GameButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.icon,
    this.isLarge = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scaleX = constraints.maxWidth / GameDimensions.baseWidth;
        final scaleY = constraints.maxHeight / GameDimensions.baseHeight;
        final scale = (scaleX + scaleY) / 2;
        
        final buttonHeight = (isLarge ? 100.0 : 70.0) * scale;
        final fontSize = (isLarge ? 28.0 : 20.0) * scale;
        final iconSize = (isLarge ? 40.0 : 28.0) * scale;
        
        return SizedBox(
          width: width != null ? width! * scaleX : double.infinity,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? GameColors.primary,
              foregroundColor: textColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonHeight / 2),
              ),
              elevation: 4,
              shadowColor: Colors.black26,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: iconSize),
                  SizedBox(width: 12 * scale),
                ],
                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Star rating display
class StarRating extends StatelessWidget {
  final int stars; // 0-5
  final double size;
  final bool animated;
  
  const StarRating({
    super.key,
    required this.stars,
    this.size = 48,
    this.animated = true,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isFilled = index < stars;
        final starType = _getStarType(index, stars);
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: _StarIcon(
            type: starType,
            size: size,
          ),
        );
      }),
    );
  }
  
  StarType _getStarType(int index, int total) {
    if (index < total - 2) return StarType.bronze;
    if (index < total - 1) return StarType.silver;
    if (index < total) return StarType.gold;
    return StarType.empty;
  }
}

enum StarType { empty, bronze, silver, gold }

class _StarIcon extends StatelessWidget {
  final StarType type;
  final double size;
  
  const _StarIcon({
    required this.type,
    required this.size,
  });
  
  @override
  Widget build(BuildContext context) {
    if (type == StarType.empty) {
      return Icon(
        Icons.star_border,
        size: size,
        color: Colors.grey.shade400,
      );
    }
    
    Color color;
    switch (type) {
      case StarType.gold:
        color = GameColors.starGold;
        break;
      case StarType.silver:
        color = GameColors.starSilver;
        break;
      case StarType.bronze:
        color = GameColors.starBronze;
        break;
      default:
        color = Colors.grey;
    }
    
    return Icon(
      Icons.star,
      size: size,
      color: color,
    );
  }
}
