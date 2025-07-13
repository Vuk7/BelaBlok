import 'package:flutter/material.dart';

class CalculatedScoreShow extends StatelessWidget {
  final int teamOneScore;
  final int teamTwoScore;
  const CalculatedScoreShow(
      {super.key, required this.teamOneScore, required this.teamTwoScore});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text("MI: $teamOneScore",
          style: TextStyle(
              fontSize: 30, color: Theme.of(context).colorScheme.secondary)),
      Text("VI: $teamTwoScore",
          style: TextStyle(
              fontSize: 30, color: Theme.of(context).colorScheme.secondary))
    ]);
  }
}
