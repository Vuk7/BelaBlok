import 'package:flutter/material.dart';

class StihakIcon extends StatefulWidget {
  final bool animateOnce;
  final Color color;
  const StihakIcon({super.key, this.animateOnce = true, this.color = Colors.green});

  @override
  State<StihakIcon> createState() => _StihakIconState();
}

class _StihakIconState extends State<StihakIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).chain(CurveTween(curve: Curves.elasticOut)).animate(_controller);
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
    // Provjera da li je boja narančasta (primary - AppTheme.primary)
    final bool isPrimary = widget.color == const Color(0xFFFF6B35);
    
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: isPrimary 
        ? Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.star,
                color: widget.color,
                size: 28,
              ),
             const Icon(
                Icons.star,
                color: Colors.black,
                size: 18,
              ),
            ],
          )
        : Icon(
            Icons.stars,
            color: widget.color,
            size: 28,
          ),
    );
  }
}
