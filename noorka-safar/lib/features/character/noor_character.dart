import 'package:flutter/material.dart';
import '../../core/theme/game_theme.dart';

/// Noor - The main character of Noor Ka Safar
/// Beautiful, child-friendly design that adapts to screen sizes
class NoorCharacter extends StatefulWidget {
  final double size; // Base size for scaling
  final NoorMood mood;
  final bool showAnimation;
  final Color? customColor;
  
  const NoorCharacter({
    super.key,
    this.size = 300,
    this.mood = NoorMood.happy,
    this.showAnimation = true,
    this.customColor,
  });
  
  @override
  State<NoorCharacter> createState() => _NoorCharacterState();
}

class _NoorCharacterState extends State<NoorCharacter> with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late AnimationController _blinkController;
  late Animation<double> _bounceAnimation;
  late Animation<double> _blinkAnimation;
  
  @override
  void initState() {
    super.initState();
    
    // Bouncing animation
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -15), weight: 25),
      TweenSequenceItem(tween: Tween(begin: -15, end: 0), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 0, end: -8), weight: 25),
      TweenSequenceItem(tween: Tween(begin: -8, end: 0), weight: 25),
    ]).animate(CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut));
    
    if (widget.showAnimation) {
      _bounceController.repeat();
    }
    
    // Blinking animation
    _blinkController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    _blinkAnimation = Tween<double>(begin: 1.0, end: 0.1).animate(_blinkController);
    
    // Random blinking
    if (widget.showAnimation) {
      _startBlinking();
    }
  }
  
  void _startBlinking() async {
    while (mounted) {
      await Future.delayed(Duration(seconds: 2 + (DateTime.now().millisecond % 4)));
      if (mounted) {
        await _blinkController.forward();
        if (mounted) {
          await _blinkController.reverse();
        }
      }
    }
  }
  
  @override
  void dispose() {
    _bounceController.dispose();
    _blinkController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final bodyColor = widget.customColor ?? GameColors.noorBody;
    
    return AnimatedBuilder(
      animation: Listenable.merge([_bounceAnimation, _blinkAnimation]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, widget.showAnimation ? _bounceAnimation.value : 0),
          child: child,
        );
      },
      child: SizedBox(
        width: widget.size,
        height: widget.size * 1.2, // Taller for body proportions
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Body (round blob shape)
            Positioned(
              bottom: 0,
              child: _NoorBody(color: bodyColor, size: widget.size),
            ),
            
            // Eyes
            Positioned(
              top: widget.size * 0.25,
              child: _NoorEyes(
                size: widget.size,
                mood: widget.mood,
                blinkValue: _blinkAnimation.value,
              ),
            ),
            
            // Blush
            Positioned(
              top: widget.size * 0.4,
              left: widget.size * 0.15,
              child: _BlushDot(size: widget.size),
            ),
            Positioned(
              top: widget.size * 0.4,
              right: widget.size * 0.15,
              child: _BlushDot(size: widget.size),
            ),
            
            // Smile
            Positioned(
              top: widget.size * 0.45,
              child: _NoorMouth(mood: widget.mood, size: widget.size),
            ),
            
            // Accessories (optional hat)
            Positioned(
              top: 0,
              child: _NoorHat(size: widget.size),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoorBody extends StatelessWidget {
  final Color color;
  final double size;
  
  const _NoorBody({required this.color, required this.size});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.9,
      height: size * 0.85,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.3, -0.3),
          radius: 0.8,
          colors: [
            color.withValues(alpha: 1.0),
            color.withValues(alpha: 0.9),
            color.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size * 0.45),
          topRight: Radius.circular(size * 0.45),
          bottomLeft: Radius.circular(size * 0.4),
          bottomRight: Radius.circular(size * 0.4),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Shine effect
          Positioned(
            top: size * 0.1,
            left: size * 0.15,
            child: Container(
              width: size * 0.15,
              height: size * 0.1,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(size * 0.05),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoorEyes extends StatelessWidget {
  final double size;
  final NoorMood mood;
  final double blinkValue;
  
  const _NoorEyes({
    required this.size,
    required this.mood,
    required this.blinkValue,
  });
  
  @override
  Widget build(BuildContext context) {
    final eyeWidth = size * 0.18;
    final eyeHeight = size * 0.22 * blinkValue;
    final pupilSize = size * 0.08;
    
    return SizedBox(
      width: size * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left eye
          _Eye(
            width: eyeWidth,
            height: eyeHeight,
            pupilSize: pupilSize,
            mood: mood,
          ),
          SizedBox(width: size * 0.08),
          // Right eye
          _Eye(
            width: eyeWidth,
            height: eyeHeight,
            pupilSize: pupilSize,
            mood: mood,
          ),
        ],
      ),
    );
  }
}

class _Eye extends StatelessWidget {
  final double width;
  final double height;
  final double pupilSize;
  final NoorMood mood;
  
  const _Eye({
    required this.width,
    required this.height,
    required this.pupilSize,
    required this.mood,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width / 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: mood == NoorMood.surprised ? width * 0.9 : pupilSize,
          height: mood == NoorMood.surprised ? height * 0.9 : pupilSize,
          decoration: BoxDecoration(
            color: mood == NoorMood.thinking 
                ? GameColors.primaryDark 
                : Colors.brown.shade800,
            borderRadius: BorderRadius.circular(pupilSize / 2),
          ),
          child: mood == NoorMood.happy
              ? Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: pupilSize * 0.4,
                    height: pupilSize * 0.3,
                    margin: EdgeInsets.only(top: pupilSize * 0.1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(pupilSize * 0.2),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class _NoorMouth extends StatelessWidget {
  final NoorMood mood;
  final double size;
  
  const _NoorMouth({required this.mood, required this.size});
  
  @override
  Widget build(BuildContext context) {
    final mouthWidth = size * 0.15;
    final mouthHeight = size * 0.08;
    
    switch (mood) {
      case NoorMood.happy:
        return Container(
          width: mouthWidth,
          height: mouthHeight,
          decoration: BoxDecoration(
            color: Colors.brown.shade800,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(mouthWidth / 2),
              bottomRight: Radius.circular(mouthWidth / 2),
            ),
          ),
        );
        
      case NoorMood.sad:
        return Container(
          width: mouthWidth,
          height: mouthHeight,
          decoration: BoxDecoration(
            color: Colors.brown.shade800,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(mouthWidth / 2),
              topRight: Radius.circular(mouthWidth / 2),
            ),
          ),
        );
        
      case NoorMood.surprised:
        return Container(
          width: mouthWidth * 0.6,
          height: mouthWidth * 0.6,
          decoration: BoxDecoration(
            color: Colors.brown.shade800,
            borderRadius: BorderRadius.circular(mouthWidth * 0.3),
          ),
        );
        
      case NoorMood.thinking:
        return Container(
          width: mouthWidth,
          height: mouthHeight * 0.5,
          decoration: BoxDecoration(
            color: Colors.brown.shade800,
            borderRadius: BorderRadius.circular(mouthWidth / 2),
          ),
        );
        
      case NoorMood.celebrating:
        return Container(
          width: mouthWidth * 1.2,
          height: mouthHeight * 1.5,
          decoration: BoxDecoration(
            color: Colors.brown.shade800,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(mouthWidth / 2),
              bottomRight: Radius.circular(mouthWidth / 2),
            ),
          ),
        );
    }
  }
}

class _BlushDot extends StatelessWidget {
  final double size;
  
  const _BlushDot({required this.size});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.1,
      height: size * 0.06,
      decoration: BoxDecoration(
        color: GameColors.noorBlush.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(size * 0.03),
      ),
    );
  }
}

class _NoorHat extends StatelessWidget {
  final double size;
  
  const _NoorHat({required this.size});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.4,
      height: size * 0.2,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE91E63), // Pink
            Color(0xFFC2185B), // Dark pink
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size * 0.1),
          topRight: Radius.circular(size * 0.1),
          bottomLeft: Radius.circular(size * 0.05),
          bottomRight: Radius.circular(size * 0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative stripe
          Positioned(
            bottom: size * 0.04,
            left: 0,
            right: 0,
            child: Container(
              height: size * 0.03,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          // Pompom
          Positioned(
            top: -size * 0.03,
            left: size * 0.15,
            child: Container(
              width: size * 0.1,
              height: size * 0.1,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Mood states for Noor
enum NoorMood {
  happy,
  sad,
  surprised,
  thinking,
  celebrating,
}

/// Demo screen to preview Noor
class NoorPreview extends StatelessWidget {
  const NoorPreview({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.sky,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'نور کا سفر',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  _MoodPreview(mood: NoorMood.happy),
                  _MoodPreview(mood: NoorMood.celebrating),
                  _MoodPreview(mood: NoorMood.thinking),
                  _MoodPreview(mood: NoorMood.surprised),
                  _MoodPreview(mood: NoorMood.sad),
                  _MoodPreview(mood: NoorMood.happy, customColor: Colors.purple),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoodPreview extends StatelessWidget {
  final NoorMood mood;
  final Color? customColor;
  
  const _MoodPreview({required this.mood, this.customColor});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NoorCharacter(
          size: 120,
          mood: mood,
          customColor: customColor,
        ),
        const SizedBox(height: 8),
        Text(
          mood.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
