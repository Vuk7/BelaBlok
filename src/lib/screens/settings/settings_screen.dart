import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bela_blok/main.dart';
import 'package:bela_blok/themes/app_theme.dart';

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
          Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, _) {
              final current = themeNotifier.themeMode;
              return Column(
                children: [
                  RadioListTile<ThemeMode>(
                    title: const Text('Svijetla'),
                    value: ThemeMode.light,
                    groupValue: current,
                    onChanged: (val) => themeNotifier.setThemeMode(val!),
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Tamna'),
                    value: ThemeMode.dark,
                    groupValue: current,
                    onChanged: (val) => themeNotifier.setThemeMode(val!),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          Card(
            color: AppTheme.getCardBackgroundColor(context),
            child: const ListTile(
              title: Text('Više opcija uskoro...'),
              leading: Icon(Icons.tune),
            ),
          )
        ],
      ),
    );
  }
}
