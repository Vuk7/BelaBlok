import 'package:flutter/material.dart';
import 'package:bela_blok/screens/widgets/animated_big_button.dart';
import 'package:bela_blok/themes/app_theme.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SettingsButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'settings_button',
      child: AnimatedBigButton(
        text: 'POSTAVKE',
        icon: Icons.settings,
        iconAnimationType: AnimationType.rotate,
    textStyle: AppTheme.getSettingsButtonTextStyle(context),
    bgColor: AppTheme.getSettingsButtonBackground(context),
        onTap: onTap ?? () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ekran postavki još nije implementiran.')),
          );
        },
      ),
    );
  }
}
