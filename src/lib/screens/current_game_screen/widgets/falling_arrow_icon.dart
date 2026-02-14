import 'package:bela_blok/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      duration: const Duration(milliseconds: 600),
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 12).chain(CurveTween(curve: Curves.elasticIn)).animate(_controller);
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
    final ecoMode = context.watch<EcoModeNotifier>().isEcoMode;
    if (ecoMode) {
      return const Icon(
        Icons.arrow_downward,
        color: Colors.red,
        size: 28,
      );
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeAnimation.value * (_controller.status == AnimationStatus.reverse ? -1 : 1), 0),
          child: child,
        );
      },
      child: const Icon(
        Icons.arrow_downward,
        color: Colors.red,
        size: 28,
      ),
    );
  }
}
