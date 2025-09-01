import 'package:flutter/material.dart';
import 'package:bela_blok/themes/app_theme.dart';

class AnimatedPlayDirectionChoice extends StatefulWidget {
  final int selectedChoice;
  final Color selectedColor;
  final Color notSelectedColor;
  final Function(int id) onTap;
  
  const AnimatedPlayDirectionChoice({
    super.key,
    required this.selectedChoice,
    required this.selectedColor,
    required this.notSelectedColor,
    required this.onTap,
  });

  @override
  State<AnimatedPlayDirectionChoice> createState() => _AnimatedPlayDirectionChoiceState();
}

class _AnimatedPlayDirectionChoiceState extends State<AnimatedPlayDirectionChoice>
    with TickerProviderStateMixin {
  late AnimationController _clockwiseController;
  late AnimationController _counterClockwiseController;
  late Animation<double> _clockwiseAnimation;
  late Animation<double> _counterClockwiseAnimation;

  @override
  void initState() {
    super.initState();
    
    _clockwiseController = AnimationController(
      duration: AppTheme.animatedPlayDirectionAnimationDuration,
      vsync: this,
    );
    
    _counterClockwiseController = AnimationController(
      duration: AppTheme.animatedPlayDirectionAnimationDuration,
      vsync: this,
    );
    
    _clockwiseAnimation = Tween<double>(
      begin: 0.0,
      end: AppTheme.animatedPlayDirectionClockwiseRotation,
    ).animate(CurvedAnimation(
      parent: _clockwiseController,
      curve: AppTheme.animatedPlayDirectionAnimationCurve,
    ));
    
    _counterClockwiseAnimation = Tween<double>(
      begin: 0.0,
      end: AppTheme.animatedPlayDirectionCounterClockwiseRotation,
    ).animate(CurvedAnimation(
      parent: _counterClockwiseController,
      curve: AppTheme.animatedPlayDirectionAnimationCurve,
    ));
  }

  @override
  void dispose() {
    _clockwiseController.dispose();
    _counterClockwiseController.dispose();
    super.dispose();
  }

  void _animateClockwise() {
    _clockwiseController.forward().then((_) {
      _clockwiseController.reverse();
    });
  }

  void _animateCounterClockwise() {
    _counterClockwiseController.forward().then((_) {
      _counterClockwiseController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Clockwise option
        GestureDetector(
          onTap: () {
            _animateClockwise();
            // Small delay to let animation start
            Future.delayed(AppTheme.animatedPlayDirectionTapDelay, () {
              widget.onTap(0);
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: AppTheme.playDirectionIconContainerSize,
                height: AppTheme.playDirectionIconContainerSize,
                decoration: BoxDecoration(
                  color: (widget.selectedChoice == 0) 
                    ? widget.selectedColor 
                    : widget.notSelectedColor,
                  borderRadius: BorderRadius.circular(AppTheme.playDirectionBorderRadius),
                ),
                child: AnimatedBuilder(
                  animation: _clockwiseAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _clockwiseAnimation.value * AppTheme.animatedPlayDirectionRotationAngle,
                      child: const Icon(
                        Icons.rotate_right,
                        color: AppTheme.playDirectionIconColor,
                        size: AppTheme.playDirectionIconSize,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: AppTheme.playDirectionSpacingHorizontal),
              Text(
                "U SMJERU KAZALJKE NA SATU",
                style: AppTheme.playDirectionLabelTextStyle.copyWith(
                  color: (widget.selectedChoice == 0)
                    ? widget.selectedColor
                    : widget.notSelectedColor,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: AppTheme.playDirectionSpacingVertical),
        // Counter-clockwise option
        GestureDetector(
          onTap: () {
            _animateCounterClockwise();
            // Small delay to let animation start
            Future.delayed(AppTheme.animatedPlayDirectionTapDelay, () {
              widget.onTap(1);
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: AppTheme.playDirectionIconContainerSize,
                height: AppTheme.playDirectionIconContainerSize,
                decoration: BoxDecoration(
                  color: (widget.selectedChoice == 1) 
                    ? widget.selectedColor 
                    : widget.notSelectedColor,
                  borderRadius: BorderRadius.circular(AppTheme.playDirectionBorderRadius),
                ),
                child: AnimatedBuilder(
                  animation: _counterClockwiseAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _counterClockwiseAnimation.value * AppTheme.animatedPlayDirectionRotationAngle,
                      child: const Icon(
                        Icons.rotate_left,
                        color: AppTheme.playDirectionIconColor,
                        size: AppTheme.playDirectionIconSize,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: AppTheme.playDirectionSpacingHorizontal),
              Text(
                "SUPROTNO OD KAZALJKE NA SATU",
                style: AppTheme.playDirectionLabelTextStyle.copyWith(
                  color: (widget.selectedChoice == 1)
                    ? widget.selectedColor
                    : widget.notSelectedColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
