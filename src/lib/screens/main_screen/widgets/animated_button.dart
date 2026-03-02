import 'package:bela_blok/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final Color bgColor;
  final TextStyle textStyle;
  final VoidCallback onTap;
  final double textPadding;
  final double? width;
  final double? height;
  final IconData? icon;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.bgColor,
    required this.onTap,
    this.textPadding = 20.0,
    this.width,
    this.height,
    this.icon,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ecoMode = context.watch<EcoModeNotifier>().isEcoMode;

    return GestureDetector(
      onTapDown: ecoMode ? null : _onTapDown,
      onTapUp: ecoMode ? null : _onTapUp,
      onTapCancel: ecoMode ? null : _onTapCancel,
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: ecoMode ? 1.0 : _scale,
        duration: Duration(milliseconds: ecoMode ? 0 : 120),
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: EdgeInsets.symmetric(vertical: widget.textPadding),
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.bgColor.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.text,
                  style: widget.textStyle,
                ),
                if (widget.icon != null) ...[
                  const SizedBox(width: 12),
                  Icon(
                    widget.icon,
                    color: widget.textStyle.color,
                    size: widget.textStyle.fontSize! * 0.8,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}