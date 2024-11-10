import 'package:flutter/material.dart';

class TopScore extends StatelessWidget {
  final int teamOneScore;
  final int teamTwoScore;

  const TopScore(
      {super.key, required this.teamOneScore, required this.teamTwoScore});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          const SizedBox(
            width: 20,
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
          const SizedBox(
            width: 20,
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
    ]);
  }
}
