import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/screens/widgets/advanced_effects.dart';
import 'package:bela_blok/screens/widgets/animated_progress_bar.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_theme.dart';

class TopScoreDetails extends StatelessWidget {
  final int teamOneScore;
  final int teamTwoScore;
  final int scoreDifference;
  final Team teamInLead;
  final int teamOneLeftToWin;
  final int teamTwoLeftToWin;
  final int gameTargetScore; 

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
    final winnerColor = teamOneScore >= gameTargetScore 
        ? AppTheme.topScoreDetailsTeamOneColor 
        : AppTheme.topScoreDetailsTeamTwoColor;

    return Container(
      padding: AppTheme.topScoreDetailsPadding,
      child: GlowEffect(
        isActive: hasWinner,
        glowColor: winnerColor,
        glowRadius: AppTheme.topScoreDetailsGlowRadius,
        child: AnimatedProgressBar(
          teamOneProgress: teamOneScore / gameTargetScore,
          teamTwoProgress: teamTwoScore / gameTargetScore,
          teamOneColor: AppTheme.topScoreDetailsTeamOneColor,
          teamTwoColor: AppTheme.topScoreDetailsTeamTwoColor,
          teamOneScore: teamOneScore,
          teamTwoScore: teamTwoScore,
          gameTargetScore: gameTargetScore,
        ),
      ),
    );
  }
}
