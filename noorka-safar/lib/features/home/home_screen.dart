import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/game_theme.dart';
import '../../core/widgets/responsive_widgets.dart';
import '../character/noor_character.dart';

/// Main home screen for Noor Ka Safar
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();
  }
  
  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GameScreen(
      backgroundColor: GameColors.sky,
      builder: (context, size) {
        final scaleX = size.width / GameDimensions.baseWidth;
        final scaleY = size.height / GameDimensions.baseHeight;
        final scale = (scaleX + scaleY) / 2;
        
        return SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                // Title
                SizedBox(height: 20 * scaleY),
                _buildTitle(size, scale),
                
                // Main character
                Expanded(
                  flex: 3,
                  child: Center(
                    child: NoorCharacter(
                      size: 250 * scale,
                      mood: NoorMood.celebrating,
                    ),
                  ),
                ),
                
                // Progress indicator
                _buildProgressCard(size, scale),
                
                // Play button
                Padding(
                  padding: EdgeInsets.all(24 * scale),
                  child: GameButton(
                    text: 'کھیلنے کا وقت ہے!',
                    isLarge: true,
                    onPressed: () => _startGame(context),
                    backgroundColor: GameColors.secondary,
                  ),
                ),
                
                // Bottom navigation
                _buildBottomNav(size, scale),
                SizedBox(height: 16 * scaleY),
              ],
            ),
          ),
        );
      },
    );
  }
  
  Widget _buildTitle(Size size, double scale) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [GameColors.primary, GameColors.secondary],
          ).createShader(bounds),
          child: Text(
            'نور کا سفر',
            style: TextStyle(
              fontSize: 48 * scale,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "Noor's Journey",
          style: TextStyle(
            fontSize: 18 * scale,
            color: Colors.white.withValues(alpha: 0.8),
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
  
  Widget _buildProgressCard(Size size, double scale) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24 * scale),
      padding: EdgeInsets.all(20 * scale),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(24 * scale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          // Progress circle
          Container(
            width: 80 * scale,
            height: 80 * scale,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [GameColors.primary, GameColors.primaryLight],
              ),
              boxShadow: [
                BoxShadow(
                  color: GameColors.primary.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '12',
                    style: TextStyle(
                      fontSize: 28 * scale,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'ستارے',
                    style: TextStyle(
                      fontSize: 10 * scale,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(width: 20 * scale),
          
          // Progress details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'باب 1: حروف ابجد',
                  style: TextStyle(
                    fontSize: 18 * scale,
                    fontWeight: FontWeight.bold,
                    color: GameColors.primaryDark,
                  ),
                ),
                SizedBox(height: 4 * scale),
                Text(
                  '3 out of 10 levels complete',
                  style: TextStyle(
                    fontSize: 14 * scale,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 8 * scale),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4 * scale),
                  child: LinearProgressIndicator(
                    value: 0.3,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation(GameColors.primary),
                    minHeight: 8 * scale,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildBottomNav(Size size, double scale) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24 * scale),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavButton(
            icon: Icons.star,
            label: 'ستارے',
            scale: scale,
            onTap: () {},
          ),
          _NavButton(
            icon: Icons.card_giftcard,
            label: 'انعامات',
            scale: scale,
            onTap: () {},
          ),
          _NavButton(
            icon: Icons.settings,
            label: 'ترتیبات',
            scale: scale,
            onTap: () {},
          ),
        ],
      ),
    );
  }
  
  void _startGame(BuildContext context) {
    HapticFeedback.mediumImpact();
    // Navigate to world selection
    // Navigator.push(context, MaterialPageRoute(builder: (_) => const WorldScreen()));
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double scale;
  final VoidCallback onTap;
  
  const _NavButton({
    required this.icon,
    required this.label,
    required this.scale,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      borderRadius: BorderRadius.circular(16 * scale),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20 * scale,
          vertical: 12 * scale,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16 * scale),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 28 * scale),
            SizedBox(height: 4 * scale),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12 * scale,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
