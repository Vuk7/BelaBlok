import 'package:bela_blok/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PulsingFloatingActionButton extends StatefulWidget {
  final VoidCallback? onPressed; 
  final Widget child;
  final Color backgroundColor;
  final String heroTag;
  final bool isPulsing;

  const PulsingFloatingActionButton({
    super.key,
    required this.onPressed, 
    required this.child,
    required this.backgroundColor,
    required this.heroTag,
    this.isPulsing = false,
  });

  @override
  State<PulsingFloatingActionButton> createState() => _PulsingFloatingActionButtonState();
}

class _PulsingFloatingActionButtonState extends State<PulsingFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    
    if (widget.isPulsing) {
      _startPulsing();
    }
  }

  @override
  void didUpdateWidget(PulsingFloatingActionButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (oldWidget.isPulsing != widget.isPulsing) {
      if (widget.isPulsing) {
        _startPulsing();
      } else {
        _stopPulsing();
      }
    }
  }

  void _startPulsing() {
    _controller.repeat(reverse: true);
  }

  void _stopPulsing() {
    _controller.stop();
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ecoMode = context.watch<EcoModeNotifier>().isEcoMode;
    if (ecoMode) {
      return FloatingActionButton(
        heroTag: widget.heroTag,
        onPressed: widget.onPressed,
        backgroundColor: widget.backgroundColor,
        child: widget.child,
      );
    }

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: FloatingActionButton(
            heroTag: widget.heroTag,
            onPressed: widget.onPressed,
            backgroundColor: widget.backgroundColor,
            child: widget.child,
          ),
        );
      },
    );
  }
}
