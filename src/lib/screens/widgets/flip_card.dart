import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final bool isFlipped;
  final Duration duration;
  final VoidCallback? onTap;

  const FlipCard({
    super.key,
    required this.front,
    required this.back,
    this.isFlipped = false,
    this.duration = const Duration(milliseconds: 600),
    this.onTap,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showFront = true;

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
      curve: Curves.easeInOut,
    ));

    _animation.addListener(() {
      if (_animation.value >= 0.5) {
        setState(() {
          _showFront = false;
        });
      } else {
        setState(() {
          _showFront = true;
        });
      }
    });

    if (widget.isFlipped) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isFlipped != oldWidget.isFlipped) {
      if (widget.isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void flip() {
    if (_controller.isAnimating) return;
    
    if (_controller.value == 0.0) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? flip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final rotationY = _animation.value * math.pi;
          
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(rotationY),
            child: _showFront 
              ? widget.front 
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(math.pi),
                  child: widget.back,
                ),
          );
        },
      ),
    );
  }
}

// Enhanced Round Score List Item with flip
class FlippableRoundCard extends StatefulWidget {
  final Widget frontContent;
  final Widget backContent;
  final bool autoFlip;
  final Duration flipDelay;

  const FlippableRoundCard({
    super.key,
    required this.frontContent,
    required this.backContent,
    this.autoFlip = false,
    this.flipDelay = const Duration(milliseconds: 500),
  });

  @override
  State<FlippableRoundCard> createState() => _FlippableRoundCardState();
}

class _FlippableRoundCardState extends State<FlippableRoundCard> {
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    
    if (widget.autoFlip) {
      Future.delayed(widget.flipDelay, () {
        if (mounted) {
          setState(() {
            _isFlipped = true;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[300]!, Colors.grey[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[400]!, width: 1),
        ),
        child: Center(
          child: Icon(
            Icons.help_outline,
            size: 48,
            color: Colors.grey[600],
          ),
        ),
      ),
      back: widget.backContent,
      isFlipped: _isFlipped,
      onTap: () {
        setState(() {
          _isFlipped = !_isFlipped;
        });
      },
    );
  }
}
