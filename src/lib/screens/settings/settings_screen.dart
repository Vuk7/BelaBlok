import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bela_blok/main.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:bela_blok/providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Postavke'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Tema aplikacije', style: AppTheme.sectionHeaderTextStyle.copyWith(color: Theme.of(context).colorScheme.onSurface)),
          const SizedBox(height: 4),
          const _ThemeToggle(),
          const SizedBox(height: 24),
          const SizedBox(height: 24),
          Text('Pravila', style: AppTheme.sectionHeaderTextStyle.copyWith(color: Theme.of(context).colorScheme.onSurface)),
          const SizedBox(height: 4),
          Consumer<SettingsProvider>(
            builder: (context, settings, _) => SwitchListTile(
              title: const Text('Prikaži pravila igre '),
              value: settings.showRules,
              onChanged: (val) => settings.toggleShowRules(val),
              secondary: const Icon(Icons.menu_book),
            ),
          ),
          const SizedBox(height: 24),
          Text('Help dijalog', style: AppTheme.sectionHeaderTextStyle.copyWith(color: Theme.of(context).colorScheme.onSurface)),
          const SizedBox(height: 4),
          Consumer<SettingsProvider>(
            builder: (context, settings, _) => SwitchListTile(
              title: const Text('Prikaži pomoći zvanja'),
              value: settings.showHelpDialog,
              onChanged: (val) => settings.toggleShowHelpDialog(val),
              secondary: const Icon(Icons.quiz),
            ),
          ),
          const SizedBox(height: 32),
          Card(
            color: AppTheme.getCardBackgroundColor(context),
            child: const ListTile(
              title: Text('Više opcija uskoro...'),
              leading: Icon(Icons.tune),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  const _ThemeToggle();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        final isDark = themeNotifier.themeMode == ThemeMode.dark;
        final colorScheme = Theme.of(context).colorScheme;
        return Semantics(
          label: 'Odabir teme. Trenutno ${isDark ? 'tamna' : 'svijetla'}',
          toggled: isDark,
          child: GestureDetector(
            onTap: () => themeNotifier.setThemeMode(isDark ? ThemeMode.light : ThemeMode.dark),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.getCardBackgroundColor(context),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: colorScheme.primary.withValues(alpha: 0.4), width: 2),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _ThemeOption(
                    label: 'Svijetla',
                    icon: Icons.wb_sunny,
                    selected: !isDark,
                    onTap: () => themeNotifier.setThemeMode(ThemeMode.light),
                    highlightColor: colorScheme.primary,
                  ),
                  _ThemeOption(
                    label: 'Tamna',
                    icon: Icons.nightlight_round,
                    selected: isDark,
                    onTap: () => themeNotifier.setThemeMode(ThemeMode.dark),
                    highlightColor: colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final Color highlightColor;

  const _ThemeOption({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    final baseTextColor = Theme.of(context).colorScheme.onSurface;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: InkWell(
          borderRadius: BorderRadius.circular(26),
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: selected ? highlightColor : Colors.transparent,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 22,
                    color: selected ? AppTheme.getInverseTextColor(context) : baseTextColor.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: selected ? AppTheme.getInverseTextColor(context) : baseTextColor.withValues(alpha: 0.85),
                    ),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}
