import 'dart:math';
import 'package:bela_blok/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfettiAnimation extends StatefulWidget {
  final bool isActive;
  final Color primaryColor;
  final Color secondaryColor;

  const ConfettiAnimation({
    super.key,
    required this.isActive,
    this.primaryColor = Colors.amber,
    this.secondaryColor = Colors.orange,
  });

  @override
  State<ConfettiAnimation> createState() => _ConfettiAnimationState();
}

class _ConfettiAnimationState extends State<ConfettiAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final List<ConfettiParticle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _generateParticles();
  }

  @override
  void didUpdateWidget(ConfettiAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isActive && !oldWidget.isActive) {
      _generateParticles();
      _controller.reset();
      _controller.forward();
    } else if (!widget.isActive && oldWidget.isActive) {
      _controller.stop();
    }
  }

  void _generateParticles() {
    _particles.clear();
    for (int i = 0; i < 50; i++) {
      _particles.add(ConfettiParticle(
        x: _random.nextDouble(),
        y: _random.nextDouble() * 0.3,
        color: _random.nextBool() ? widget.primaryColor : widget.secondaryColor,
        size: _random.nextDouble() * 8 + 4,
        speedX: (_random.nextDouble() - 0.5) * 2,
        speedY: _random.nextDouble() * 3 + 1,
        rotation: _random.nextDouble() * 2 * pi,
        rotationSpeed: (_random.nextDouble() - 0.5) * 4,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ecoMode = context.watch<EcoModeNotifier>().isEcoMode;
    if (!widget.isActive || ecoMode) return const SizedBox.shrink();

    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: ConfettiPainter(
                particles: _particles,
                progress: _controller.value,
              ),
              size: Size.infinite,
            );
          },
        ),
      ),
    );
  }
}

class ConfettiParticle {
  double x, y;
  final Color color;
  final double size;
  final double speedX, speedY;
  double rotation;
  final double rotationSpeed;

  ConfettiParticle({
    required this.x,
    required this.y,
    required this.color,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.rotation,
    required this.rotationSpeed,
  });
}

class ConfettiPainter extends CustomPainter {
  final List<ConfettiParticle> particles;
  final double progress;

  ConfettiPainter({
    required this.particles,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final particle in particles) {
      // Update particle position based on progress
      final currentX = particle.x * size.width + particle.speedX * progress * size.width * 0.1;
      final currentY = particle.y * size.height + particle.speedY * progress * size.height;
      final currentRotation = particle.rotation + particle.rotationSpeed * progress * 4;

      // Fade out towards the end
      final alpha = progress < 0.8 ? 1.0 : (1.0 - (progress - 0.8) / 0.2);
      paint.color = particle.color.withValues(alpha: alpha);

      canvas.save();
      canvas.translate(currentX, currentY);
      canvas.rotate(currentRotation);

      // Draw different shapes
      if (particle.size > 6) {
        // Square confetti
        canvas.drawRect(
          Rect.fromCenter(center: Offset.zero, width: particle.size, height: particle.size),
          paint,
        );
      } else {
        // Circle confetti
        canvas.drawCircle(Offset.zero, particle.size / 2, paint);
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(ConfettiPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
