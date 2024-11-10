import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class RoundScoreListItem extends StatelessWidget {
  final int teamOneCallAmount;
  final int teamTwoCallAmount;
  final int teamOneScore;
  final int teamTwoScore;
  final int roundID;
  final Team teamCalled;
  final Function() onTap;
  const RoundScoreListItem({
    super.key,
    required this.teamOneCallAmount,
    required this.teamTwoCallAmount,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.roundID,
    required this.teamCalled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                const Spacer(),
                Column(
                  children: [
                    (teamCalled == Team.teamOne)
                        ? const Text("ZVAO",
                            style: TextStyle(
                                color: AppTheme.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14))
                        : const SizedBox(
                            height: 14,
                          ),
                    Text("$teamOneScore",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 36)),
                    Text("(+ $teamOneCallAmount)",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text("${(roundID + 1)}.",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    const SizedBox(
                      height: 48,
                    ),
                    Text("${(teamOneScore + teamTwoScore)}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    (teamCalled == Team.teamTwo)
                        ? const Text("ZVAO",
                            style: TextStyle(
                                color: AppTheme.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14))
                        : const SizedBox(
                            height: 14,
                          ),
                    Text("$teamTwoScore",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 36)),
                    Text("(+ $teamTwoCallAmount)",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
                const Spacer(),
              ],
            )),
      ),
    );
  }
}
