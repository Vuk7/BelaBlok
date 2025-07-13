import 'package:flutter/material.dart';

class AnimatedButtonIcon extends StatefulWidget {
  final IconData icon;
  final AnimationType animationType;
  final Duration duration;
  final Color? color;
  final double? size;

  const AnimatedButtonIcon({
    super.key,
    required this.icon,
    this.animationType = AnimationType.none,
    this.duration = const Duration(milliseconds: 300),
    this.color,
    this.size,
  });

  @override
  State<AnimatedButtonIcon> createState() => _AnimatedButtonIconState();
}

class _AnimatedButtonIconState extends State<AnimatedButtonIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    switch (widget.animationType) {
      case AnimationType.rotate:
        _animation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ));
        break;
      case AnimationType.slideRight:
        _animation = Tween<double>(
          begin: 0.0,
          end: 10.0,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ));
        break;
      case AnimationType.scale:
        _animation = Tween<double>(
          begin: 1.0,
          end: 1.3,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.elasticOut,
        ));
        break;
      case AnimationType.none:
        _animation = Tween<double>(
          begin: 0.0,
          end: 0.0,
        ).animate(_controller);
        break;
    }
  }

  void startAnimation() {
    _controller.forward().then((_) {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        switch (widget.animationType) {
          case AnimationType.rotate:
            return Transform.rotate(
              angle: _animation.value * 2 * 3.14159, // Full rotation
              child: Icon(
                widget.icon,
                color: widget.color,
                size: widget.size,
              ),
            );
          case AnimationType.slideRight:
            return Transform.translate(
              offset: Offset(_animation.value, 0),
              child: Icon(
                widget.icon,
                color: widget.color,
                size: widget.size,
              ),
            );
          case AnimationType.scale:
            return Transform.scale(
              scale: _animation.value,
              child: Icon(
                widget.icon,
                color: widget.color,
                size: widget.size,
              ),
            );
          case AnimationType.none:
            return Icon(
              widget.icon,
              color: widget.color,
              size: widget.size,
            );
        }
      },
    );
  }
}

enum AnimationType {
  none,
  rotate,
  slideRight,
  scale,
}

// Enhanced BigButton with animated icon
class AnimatedBigButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final AnimationType iconAnimationType;
  final TextStyle? textStyle;
  final Color? bgColor;
  final VoidCallback? onTap;
  final double textPadding;

  const AnimatedBigButton({
    super.key,
    required this.text,
    this.icon,
    this.iconAnimationType = AnimationType.none,
    this.textStyle,
    this.bgColor,
    this.onTap,
    this.textPadding = 10,
  });

  @override
  State<AnimatedBigButton> createState() => _AnimatedBigButtonState();
}

class _AnimatedBigButtonState extends State<AnimatedBigButton> {
  final GlobalKey<_AnimatedButtonIconState> _iconKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Trigger icon animation before calling onTap
        _iconKey.currentState?.startAnimation();
        
        // Small delay to let animation start, then call the original onTap
        Future.delayed(const Duration(milliseconds: 50), () {
          widget.onTap?.call();
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(widget.textPadding),
        decoration: BoxDecoration(
          color: widget.bgColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[
              AnimatedButtonIcon(
                key: _iconKey,
                icon: widget.icon!,
                animationType: widget.iconAnimationType,
                duration: const Duration(milliseconds: 500),
                color: widget.textStyle?.color ?? Colors.white,
                size: 28,
              ),
              const SizedBox(width: 12),
            ],
            Text(
              widget.text,
              style: widget.textStyle ?? 
                TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
