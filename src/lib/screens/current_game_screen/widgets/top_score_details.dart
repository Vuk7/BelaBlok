import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/screens/widgets/animated_progress_bar.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: AnimatedProgressBar(
        teamOneProgress: teamOneScore / 1001,
        teamTwoProgress: teamTwoScore / 1001,
        teamOneColor: Colors.orange,
        teamTwoColor: Colors.blue,
        teamOneScore: teamOneScore,
        teamTwoScore: teamTwoScore,
      ),
    );
  }
}
