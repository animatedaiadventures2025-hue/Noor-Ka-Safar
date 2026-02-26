import 'package:flutter/material.dart';
import '../../core/theme/game_theme.dart';
import '../../core/widgets/responsive_widgets.dart';
import '../../data/game_data.dart';
import '../../features/character/noor_character.dart';

/// World Selection Screen
class WorldScreen extends StatelessWidget {
  final int totalStars;
  final Function(GameWorld) onWorldSelected;
  
  const WorldScreen({
    super.key,
    required this.totalStars,
    required this.onWorldSelected,
  });
  
  @override
  Widget build(BuildContext context) {
    return GameScreen(
      backgroundColor: GameColors.sky,
      builder: (context, size) {
        final scaleX = size.width / GameDimensions.baseWidth;
        final scaleY = size.height / GameDimensions.baseHeight;
        final scale = (scaleX + scaleY) / 2;
        
        return SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(size, scale),
              
              // Noor character
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16 * scaleY),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NoorCharacter(
                      size: 100 * scale,
                      mood: NoorMood.happy,
                    ),
                    SizedBox(width: 16 * scaleX),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$totalStars ستارے',
                          style: TextStyle(
                            fontSize: 24 * scale,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Stars Earned',
                          style: TextStyle(
                            fontSize: 14 * scale,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // World grid
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16 * scale),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width > 600 ? 3 : 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16 * scaleX,
                    mainAxisSpacing: 16 * scaleY,
                  ),
                  itemCount: GameWorld.worlds.length,
                  itemBuilder: (context, index) {
                    return _WorldCard(
                      world: GameWorld.worlds[index],
                      totalStars: totalStars,
                      scale: scale,
                      onTap: () {
                        if (totalStars >= GameWorld.worlds[index].unlockStars) {
                          onWorldSelected(GameWorld.worlds[index]);
                        }
                      },
                    );
                  },
                ),
              ),
              
              // Back button
              Padding(
                padding: EdgeInsets.all(16 * scale),
                child: GameButton(
                  text: 'واپس - Back',
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: Colors.white24,
                  icon: Icons.arrow_back,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildHeader(Size size, double scale) {
    return Padding(
      padding: EdgeInsets.all(16 * scale),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, Colors.white70],
            ).createShader(bounds),
            child: Text(
              'دنیا انتخاب کریں',
              style: TextStyle(
                fontSize: 32 * scale,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Text(
            'Select World',
            style: TextStyle(
              fontSize: 14 * scale,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class _WorldCard extends StatelessWidget {
  final GameWorld world;
  final int totalStars;
  final double scale;
  final VoidCallback onTap;
  
  const _WorldCard({
    required this.world,
    required this.totalStars,
    required this.scale,
    required this.onTap,
  });
  
  bool get isUnlocked => totalStars >= world.unlockStars;
  
  @override
  Widget build(BuildContext context) {
    final color = Color(int.parse(world.themeColor.replaceFirst('#', '0xFF')));
    
    return GestureDetector(
      onTap: isUnlocked ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: isUnlocked
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color.withValues(alpha: 0.8),
                    color,
                  ],
                )
              : LinearGradient(
                  colors: [Colors.grey.shade600, Colors.grey.shade800],
                ),
          borderRadius: BorderRadius.circular(24 * scale),
          boxShadow: [
            BoxShadow(
              color: (isUnlocked ? color : Colors.grey).withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background pattern
            if (isUnlocked)
              Positioned(
                right: -20 * scale,
                bottom: -20 * scale,
                child: Icon(
                  Icons.star,
                  size: 80 * scale,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
            
            // Content
            Padding(
              padding: EdgeInsets.all(16 * scale),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // World icon
                  Container(
                    width: 80 * scale,
                    height: 80 * scale,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isUnlocked ? _getWorldIcon() : Icons.lock,
                      size: 40 * scale,
                      color: Colors.white,
                    ),
                  ),
                  
                  SizedBox(height: 12 * scale),
                  
                  // World name
                  Text(
                    world.nameUrdu,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18 * scale,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                  Text(
                    world.name,
                    style: TextStyle(
                      fontSize: 12 * scale,
                      color: Colors.white70,
                    ),
                  ),
                  
                  SizedBox(height: 8 * scale),
                  
                  // Unlock requirement
                  if (!isUnlocked)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12 * scale,
                        vertical: 4 * scale,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(12 * scale),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            size: 14 * scale,
                            color: GameColors.starGold,
                          ),
                          SizedBox(width: 4 * scale),
                          Text(
                            '${world.unlockStars}',
                            style: TextStyle(
                              fontSize: 12 * scale,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  IconData _getWorldIcon() {
    switch (world.id) {
      case 'world_1':
        return Icons.home;
      case 'world_2':
        return Icons.park;
      case 'world_3':
        return Icons.beach_access;
      case 'world_4':
        return Icons.castle;
      case 'world_5':
        return Icons.cloud;
      default:
        return Icons.star;
    }
  }
}
