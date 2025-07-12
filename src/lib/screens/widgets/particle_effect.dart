import 'dart:math';
import 'package:flutter/material.dart';

class ParticleEffect extends StatefulWidget {
  final bool isActive;
  final ParticleConfig config;

  const ParticleEffect({
    super.key,
    required this.isActive,
    this.config = const ParticleConfig(),
  });

  @override
  State<ParticleEffect> createState() => _ParticleEffectState();
}

class _ParticleEffectState extends State<ParticleEffect>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.config.duration,
      vsync: this,
    );

    _generateParticles();

    _controller.addListener(() {
      setState(() {
        _updateParticles();
      });
    });
  }

  @override
  void didUpdateWidget(ParticleEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isActive && !oldWidget.isActive) {
      _generateParticles();
      _controller.repeat();
    } else if (!widget.isActive && oldWidget.isActive) {
      _controller.stop();
    }
  }

  void _generateParticles() {
    _particles.clear();
    for (int i = 0; i < widget.config.particleCount; i++) {
      _particles.add(_createParticle());
    }
  }

  Particle _createParticle() {
    return Particle(
      x: _random.nextDouble(),
      y: _random.nextDouble(),
      size: _random.nextDouble() * widget.config.maxSize + widget.config.minSize,
      color: widget.config.colors[_random.nextInt(widget.config.colors.length)],
      speedX: (_random.nextDouble() - 0.5) * widget.config.speed,
      speedY: (_random.nextDouble() - 0.5) * widget.config.speed,
      life: 1.0,
      decay: widget.config.decay,
    );
  }

  void _updateParticles() {
    for (var particle in _particles) {
      particle.update();
      
      // Reset particle if it's dead
      if (particle.life <= 0) {
        final newParticle = _createParticle();
        particle.x = newParticle.x;
        particle.y = newParticle.y;
        particle.life = 1.0;
        particle.speedX = newParticle.speedX;
        particle.speedY = newParticle.speedY;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isActive) return const SizedBox.shrink();

    return Positioned.fill(
      child: IgnorePointer(
        child: CustomPaint(
          painter: ParticlePainter(particles: _particles),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class ParticleConfig {
  final int particleCount;
  final double minSize;
  final double maxSize;
  final double speed;
  final double decay;
  final Duration duration;
  final List<Color> colors;

  const ParticleConfig({
    this.particleCount = 50,
    this.minSize = 2.0,
    this.maxSize = 6.0,
    this.speed = 2.0,
    this.decay = 0.02,
    this.duration = const Duration(seconds: 5),
    this.colors = const [
      Colors.blue,
      Colors.purple,
      Colors.pink,
      Colors.cyan,
    ],
  });
}

class Particle {
  double x, y;
  double size;
  Color color;
  double speedX, speedY;
  double life;
  double decay;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.speedX,
    required this.speedY,
    required this.life,
    required this.decay,
  });

  void update() {
    x += speedX * 0.01;
    y += speedY * 0.01;
    life -= decay;
    
    // Wrap around screen edges
    if (x < 0) x = 1.0;
    if (x > 1) x = 0.0;
    if (y < 0) y = 1.0;
    if (y > 1) y = 0.0;
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      if (particle.life > 0) {
        final paint = Paint()
          ..color = particle.color.withOpacity(particle.life)
          ..style = PaintingStyle.fill;

        canvas.drawCircle(
          Offset(
            particle.x * size.width,
            particle.y * size.height,
          ),
          particle.size,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) {
    return true;
  }
}

// Floating particles widget for background effects
class FloatingParticles extends StatefulWidget {
  final Color color;
  final int count;
  final double speed;

  const FloatingParticles({
    super.key,
    this.color = Colors.white24,
    this.count = 20,
    this.speed = 0.5,
  });

  @override
  State<FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<FloatingParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<FloatingParticle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    _generateFloatingParticles();
    _controller.repeat();
  }

  void _generateFloatingParticles() {
    _particles.clear();
    for (int i = 0; i < widget.count; i++) {
      _particles.add(FloatingParticle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 4 + 2,
        speedY: _random.nextDouble() * widget.speed + 0.1,
        opacity: _random.nextDouble() * 0.5 + 0.1,
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
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: FloatingParticlePainter(
                particles: _particles,
                animation: _controller.value,
                color: widget.color,
              ),
              size: Size.infinite,
            );
          },
        ),
      ),
    );
  }
}

class FloatingParticle {
  double x, y;
  double size;
  double speedY;
  double opacity;

  FloatingParticle({
    required this.x,
    required this.y,
    required this.size,
    required this.speedY,
    required this.opacity,
  });
}

class FloatingParticlePainter extends CustomPainter {
  final List<FloatingParticle> particles;
  final double animation;
  final Color color;

  FloatingParticlePainter({
    required this.particles,
    required this.animation,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final y = (particle.y + animation * particle.speedY) % 1.0;
      
      final paint = Paint()
        ..color = color.withOpacity(particle.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(
          particle.x * size.width,
          y * size.height,
        ),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(FloatingParticlePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
