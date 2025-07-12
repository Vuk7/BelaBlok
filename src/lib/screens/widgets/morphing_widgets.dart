import 'package:flutter/material.dart';

class MorphingContainer extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool morphOnChange;

  const MorphingContainer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.morphOnChange = true,
  });

  @override
  State<MorphingContainer> createState() => _MorphingContainerState();
}

class _MorphingContainerState extends State<MorphingContainer>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _colorController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;
  
  Widget? _previousChild;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    
    _scaleController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _colorController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));
    
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.amber.withOpacity(0.3),
    ).animate(CurvedAnimation(
      parent: _colorController,
      curve: Curves.easeInOut,
    ));
    
    _previousChild = widget.child;
  }

  @override
  void didUpdateWidget(MorphingContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.morphOnChange && oldWidget.child != widget.child && !_isAnimating) {
      _performMorph();
    }
  }

  void _performMorph() {
    setState(() {
      _isAnimating = true;
    });
    
    _scaleController.forward().then((_) {
      _scaleController.reverse().then((_) {
        setState(() {
          _previousChild = widget.child;
          _isAnimating = false;
        });
      });
    });
    
    _colorController.forward().then((_) {
      _colorController.reverse();
    });
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
          scale: _scaleAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              color: _colorAnimation.value,
              borderRadius: BorderRadius.circular(8),
            ),
            child: _isAnimating ? _previousChild : widget.child,
          ),
        );
      },
    );
  }
}

// Wobble effect for interactive elements
class WobbleWidget extends StatefulWidget {
  final Widget child;
  final bool triggerWobble;
  final Duration duration;

  const WobbleWidget({
    super.key,
    required this.child,
    this.triggerWobble = false,
    this.duration = const Duration(milliseconds: 400),
  });

  @override
  State<WobbleWidget> createState() => _WobbleWidgetState();
}

class _WobbleWidgetState extends State<WobbleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    ));
  }

  @override
  void didUpdateWidget(WobbleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.triggerWobble && !oldWidget.triggerWobble) {
      _controller.forward().then((_) {
        _controller.reset();
      });
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
      animation: _rotationAnimation,
      builder: (context, child) {
        double rotation = 0.0;
        if (_rotationAnimation.value < 0.25) {
          rotation = _rotationAnimation.value * 4 * 0.1; // 0 to 0.1
        } else if (_rotationAnimation.value < 0.5) {
          rotation = 0.1 - (_rotationAnimation.value - 0.25) * 4 * 0.2; // 0.1 to -0.1
        } else if (_rotationAnimation.value < 0.75) {
          rotation = -0.1 + (_rotationAnimation.value - 0.5) * 4 * 0.15; // -0.1 to 0.05
        } else {
          rotation = 0.05 - (_rotationAnimation.value - 0.75) * 4 * 0.05; // 0.05 to 0
        }
        
        return Transform.rotate(
          angle: rotation,
          child: widget.child,
        );
      },
    );
  }
}
