import 'package:flutter/material.dart';

class GlowEffect extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final Color glowColor;
  final double glowRadius;
  final Duration duration;

  const GlowEffect({
    super.key,
    required this.child,
    this.isActive = false,
    this.glowColor = Colors.amber,
    this.glowRadius = 20.0,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<GlowEffect> createState() => _GlowEffectState();
}

class _GlowEffectState extends State<GlowEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    if (widget.isActive) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(GlowEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isActive && !oldWidget.isActive) {
      _controller.repeat(reverse: true);
    } else if (!widget.isActive && oldWidget.isActive) {
      _controller.stop();
      _controller.reset();
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
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          decoration: widget.isActive ? BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: widget.glowColor.withValues(alpha: _glowAnimation.value * 0.6),
                blurRadius: widget.glowRadius * _glowAnimation.value,
                spreadRadius: widget.glowRadius * _glowAnimation.value * 0.3,
              ),
            ],
          ) : null,
          child: widget.child,
        );
      },
    );
  }
}

// Advanced pulse effect with color changes
class AdvancedPulse extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final List<Color> colors;
  final Duration duration;
  final double minScale;
  final double maxScale;

  const AdvancedPulse({
    super.key,
    required this.child,
    this.isActive = false,
    this.colors = const [Colors.red, Colors.orange, Colors.yellow],
    this.duration = const Duration(milliseconds: 800),
    this.minScale = 0.95,
    this.maxScale = 1.05,
  });

  @override
  State<AdvancedPulse> createState() => _AdvancedPulseState();
}

class _AdvancedPulseState extends State<AdvancedPulse>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _colorController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    
    _scaleController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _colorController = AnimationController(
      duration: Duration(milliseconds: widget.duration.inMilliseconds * 2),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));

    _colorAnimation = TweenSequence<Color?>(
      widget.colors.asMap().entries.map((entry) {
        final index = entry.key;
        final color = entry.value;
        final weight = 1.0 / widget.colors.length;
        
        return TweenSequenceItem(
          tween: ColorTween(
            begin: index == 0 ? color : widget.colors[index - 1],
            end: color,
          ),
          weight: weight,
        );
      }).toList(),
    ).animate(_colorController);

    if (widget.isActive) {
      _scaleController.repeat(reverse: true);
      _colorController.repeat();
    }
  }

  @override
  void didUpdateWidget(AdvancedPulse oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isActive && !oldWidget.isActive) {
      _scaleController.repeat(reverse: true);
      _colorController.repeat();
    } else if (!widget.isActive && oldWidget.isActive) {
      _scaleController.stop();
      _colorController.stop();
      _scaleController.reset();
      _colorController.reset();
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _colorAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: widget.isActive ? _scaleAnimation.value : 1.0,
          child: Container(
            decoration: widget.isActive ? BoxDecoration(
              color: _colorAnimation.value?.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _colorAnimation.value ?? Colors.transparent,
                width: 2,
              ),
            ) : null,
            child: widget.child,
          ),
        );
      },
    );
  }
}

// Ripple effect for interactive elements
class RippleEffect extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color rippleColor;
  final Duration duration;

  const RippleEffect({
    super.key,
    required this.child,
    this.onTap,
    this.rippleColor = Colors.blue,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  State<RippleEffect> createState() => _RippleEffectState();
}

class _RippleEffectState extends State<RippleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Offset? _tapPosition;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap(TapDownDetails details) {
    setState(() {
      _tapPosition = details.localPosition;
    });
    
    _controller.forward().then((_) {
      _controller.reset();
      widget.onTap?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: RipplePainter(
              animation: _animation.value,
              center: _tapPosition,
              color: widget.rippleColor,
            ),
            child: widget.child,
          );
        },
      ),
    );
  }
}

class RipplePainter extends CustomPainter {
  final double animation;
  final Offset? center;
  final Color color;

  RipplePainter({
    required this.animation,
    required this.center,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (center == null || animation == 0) return;

    final paint = Paint()
      ..color = color.withValues(alpha: (1 - animation) * 0.3)
      ..style = PaintingStyle.fill;

    final radius = animation * size.width;
    canvas.drawCircle(center!, radius, paint);
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) {
    return oldDelegate.animation != animation ||
           oldDelegate.center != center;
  }
}
