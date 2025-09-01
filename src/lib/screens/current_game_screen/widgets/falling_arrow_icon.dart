import 'package:flutter/material.dart';
import '../../../../themes/app_theme.dart';

class FallingArrowIcon extends StatefulWidget {
  final bool animateOnce;
  const FallingArrowIcon({super.key, this.animateOnce = true});

  @override
  State<FallingArrowIcon> createState() => _FallingArrowIconState();
}

class _FallingArrowIconState extends State<FallingArrowIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppTheme.fallingArrowAnimationDuration,
    );
    _shakeAnimation = Tween<double>(
      begin: AppTheme.fallingArrowShakeBegin, 
      end: AppTheme.fallingArrowShakeEnd
    ).chain(CurveTween(curve: AppTheme.fallingArrowAnimationCurve)).animate(_controller);
    if (widget.animateOnce) {
      _controller.forward().then((_) => _controller.reverse());
    } else {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeAnimation.value * (_controller.status == AnimationStatus.reverse ? -1 : 1), 0),
          child: child,
        );
      },
      child: const Icon(
        AppTheme.fallingArrowIcon,
        color: AppTheme.fallingArrowIconColor,
        size: AppTheme.fallingArrowIconSize,
      ),
    );
  }
}
