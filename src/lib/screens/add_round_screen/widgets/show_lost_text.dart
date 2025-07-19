import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ShowLostText extends StatelessWidget {
  final bool show;
  final Team teamLost;
  const ShowLostText({
    super.key,
    required this.show,
    required this.teamLost,
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
                      color: AppTheme.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.trending_down,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "PAD",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(width: 80),
            const Spacer(),
            const SizedBox(width: 20),
            const Spacer(),
            (teamLost == Team.teamTwo)
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.trending_down,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "PAD",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(width: 80),
            const Spacer(),
          ])
        : const SizedBox(height: 50);
  }
}
