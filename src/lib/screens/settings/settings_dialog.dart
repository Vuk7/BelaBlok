import 'package:flutter/material.dart';
import 'package:bela_blok/themes/app_theme.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppTheme.getCardBackgroundColor(context),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 300, maxWidth: 420, minHeight: 200),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 10),
                  const Text(
                    'Postavke',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Zatvori',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, color: isDark ? Colors.white70 : Colors.black54),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Opcije će uskoro biti dostupne',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7 * 255),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: AppTheme.getInverseTextColor(context),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.check),
                  label: const Text('U REDU'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
