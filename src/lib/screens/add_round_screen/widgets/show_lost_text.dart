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
                ? const Text("PAD",
                    style: TextStyle(fontSize: 36, color: AppTheme.red))
                : const SizedBox(
                    width: 60,
                  ),
            const Spacer(),
            const SizedBox(
              width: 20,
            ),
            const Spacer(),
            (teamLost == Team.teamTwo)
                ? const Text("PAD",
                    style: TextStyle(fontSize: 36, color: AppTheme.red))
                : const SizedBox(
                    width: 36,
                  ),
            const Spacer(),
          ])
        : const SizedBox(
            height: 36,
          );
  }
}
