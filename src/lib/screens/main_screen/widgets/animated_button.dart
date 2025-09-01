import 'package:flutter/material.dart';
import '../../../themes/app_theme.dart';

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
    this.textPadding = AppTheme.animatedButtonDefaultTextPadding,
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
      _scale = AppTheme.animatedButtonScale;
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
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _scale,
        duration: AppTheme.animatedButtonAnimationDuration,
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: EdgeInsets.symmetric(vertical: widget.textPadding),
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(AppTheme.animatedButtonBorderRadius),
            boxShadow: [
              BoxShadow(
                color: widget.bgColor.withValues(alpha: AppTheme.animatedButtonShadowOpacity),
                blurRadius: AppTheme.animatedButtonShadowBlurRadius,
                offset: AppTheme.animatedButtonShadowOffset,
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
                 const SizedBox(width: AppTheme.animatedButtonIconSpacing),
                  Icon(
                    widget.icon,
                    color: widget.textStyle.color,
                    size: widget.textStyle.fontSize! * AppTheme.animatedButtonIconSizeMultiplier,
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