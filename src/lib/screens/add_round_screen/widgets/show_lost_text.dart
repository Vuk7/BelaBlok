import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ShowLostText extends StatelessWidget {
  final bool show;
  final Team teamLost;
  final bool isStihak;
  const ShowLostText({
    super.key,
    required this.show,
    required this.teamLost,
    this.isStihak = false,
  });

  @override
  Widget build(BuildContext context) {
    return (show)
        ? Row(children: [
            const Spacer(),
            (teamLost == Team.teamOne)
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isStihak ? AppTheme.green : AppTheme.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isStihak ? Icons.stars : Icons.trending_down,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isStihak ? "ŠTIHAK" : "PAD",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(width: isStihak ? 100 : 80),
            const Spacer(),
            const SizedBox(width: 20),
            const Spacer(),
            (teamLost == Team.teamTwo)
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isStihak ? AppTheme.primary : AppTheme.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isStihak ? Icons.stars : Icons.trending_down,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isStihak ? "ŠTIHAK" : "PAD",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(width: isStihak ? 100 : 80),
            const Spacer(),
          ])
        : const SizedBox(height: 50);
  }
}
