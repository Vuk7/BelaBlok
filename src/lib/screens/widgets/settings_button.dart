import 'package:flutter/material.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:go_router/go_router.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SettingsButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bg = AppTheme.getSettingsButtonBackground(context);
    return Semantics(
      label: 'Postavke',
      button: true,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap ?? () => context.pushNamed('settings'),
        child: Ink(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.settings, size: 26, color: Colors.white),
        ),
      ),
    );
  }
}