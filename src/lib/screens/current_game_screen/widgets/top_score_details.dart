import 'package:bela_blok/enums/team_enum.dart';
import 'package:flutter/material.dart';

class TopScoreDetails extends StatelessWidget {
  final int teamOneScore;
  final int teamTwoScore;

  final int scoreDifference;
  final Team teamInLead;

  final int teamOneLeftToWin;
  final int teamTwoLeftToWin;
  const TopScoreDetails({
    super.key,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.scoreDifference,
    required this.teamInLead,
    required this.teamOneLeftToWin,
    required this.teamTwoLeftToWin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Text(
              "MI",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 36),
            ),
            const Spacer(),
            Opacity(
              opacity: 0.0,
              child: Text(
                "( + $scoreDifference )",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24),
              ),
            ),
            const Spacer(),
            Text(
              "VI",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 36),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Spacer(),
            Text(
              "$teamOneScore",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 36),
            ),
            const Spacer(),
            Text(
              "( + $scoreDifference )",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: (teamInLead == Team.teamOne)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                  fontSize: 24),
            ),
            const Spacer(),
            Text(
              "$teamTwoScore",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 36),
            ),
            const Spacer(),
          ],
        ),
        Row(
          children: [
            const Spacer(),
            Text(
              "( $teamOneLeftToWin )",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 15),
            ),
            const Spacer(),
            Opacity(
              opacity: 0.0,
              child: Text(
                "( $scoreDifference )",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24),
              ),
            ),
            const Spacer(),
            Text(
              "( $teamTwoLeftToWin )",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
