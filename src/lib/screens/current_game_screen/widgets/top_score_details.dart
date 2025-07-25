import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/screens/widgets/advanced_effects.dart';
import 'package:bela_blok/screens/widgets/animated_progress_bar.dart';
import 'package:flutter/material.dart';

class TopScoreDetails extends StatelessWidget {
  final int teamOneScore;
  final int teamTwoScore;
  final int scoreDifference;
  final Team teamInLead;
  final int teamOneLeftToWin;
  final int teamTwoLeftToWin;
  final int gameTargetScore; // Dodaj ovo

  const TopScoreDetails({
    super.key,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.scoreDifference,
    required this.teamInLead,
    required this.teamOneLeftToWin,
    required this.teamTwoLeftToWin,
    required this.gameTargetScore, 
  });

  @override
  Widget build(BuildContext context) {
    final hasWinner = teamOneScore >= gameTargetScore || teamTwoScore >= gameTargetScore;
    final winnerColor = teamOneScore >= gameTargetScore ? Colors.orange : Colors.blue;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GlowEffect(
        isActive: hasWinner,
        glowColor: winnerColor,
        glowRadius: 30.0,
        child: AnimatedProgressBar(
          teamOneProgress: teamOneScore / gameTargetScore,
          teamTwoProgress: teamTwoScore / gameTargetScore,
          teamOneColor: Colors.orange,
          teamTwoColor: Colors.blue,
          teamOneScore: teamOneScore,
          teamTwoScore: teamTwoScore,
        ),
      ),
    );
  }
}
