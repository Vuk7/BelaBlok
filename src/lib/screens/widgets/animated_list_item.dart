import 'package:flutter/material.dart';

enum AnimationType { slideUp, slideLeft, slideRight, scale, fade, bounce }

class AnimatedListItem extends StatefulWidget {
  final Widget child;
  final int index;
  final Duration delay;
  final AnimationType animationType;
  final bool autoStart;
  final int? staggerDelay; // New property for enhanced staggering

  const AnimatedListItem({
    super.key,
    required this.child,
    required this.index,
    this.delay = const Duration(milliseconds: 100),
    this.animationType = AnimationType.slideUp,
    this.autoStart = true,
    this.staggerDelay, // milliseconds delay between items
  });

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _setupAnimations();
    
    if (widget.autoStart) {
      // Use staggerDelay if provided, otherwise use the original delay calculation
      final delayDuration = widget.staggerDelay != null 
        ? Duration(milliseconds: widget.staggerDelay! * widget.index)
        : widget.delay * widget.index;
        
      Future.delayed(delayDuration, () {
        if (mounted) {
          _controller.forward();
        }
      });
    } else {
      _controller.value = 1.0;
    }
  }

  void _setupAnimations() {
    Offset slideBegin;
    
    switch (widget.animationType) {
      case AnimationType.slideUp:
        slideBegin = const Offset(0.0, 0.5);
        break;
      case AnimationType.slideLeft:
        slideBegin = const Offset(-0.5, 0.0);
        break;
      case AnimationType.slideRight:
        slideBegin = const Offset(0.5, 0.0);
        break;
      default:
        slideBegin = const Offset(0.0, 0.5);
    }
    
    _slideAnimation = Tween<Offset>(
      begin: slideBegin,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
    ));
    
    _scaleAnimation = Tween<double>(
      begin: widget.animationType == AnimationType.scale ? 0.0 : 1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.animationType == AnimationType.bounce 
        ? Curves.elasticOut 
        : Curves.easeOutBack,
    ));
  }

  void startAnimation() {
    _controller.forward();
  }

  void reverseAnimation() {
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget animatedChild = widget.child;

    switch (widget.animationType) {
      case AnimationType.scale:
        animatedChild = ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: widget.child,
          ),
        );
        break;
      case AnimationType.bounce:
        animatedChild = ScaleTransition(
          scale: _scaleAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: widget.child,
            ),
          ),
        );
        break;
      case AnimationType.fade:
        animatedChild = FadeTransition(
          opacity: _fadeAnimation,
          child: widget.child,
        );
        break;
      default:
        animatedChild = SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: widget.child,
          ),
        );
    }

    return animatedChild;
  }
}
