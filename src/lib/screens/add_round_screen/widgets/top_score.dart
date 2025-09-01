import 'package:flutter/material.dart';
import '../../../themes/app_theme.dart';

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
            style: AppTheme.topScoreTeamLabelTextStyle.copyWith(
                color: Theme.of(context).colorScheme.primary),
          ),
          const Spacer(),
         const SizedBox(
            width: AppTheme.topScoreHorizontalSpacing,
          ),
          const Spacer(),
          Text(
            "VI",
            style: AppTheme.topScoreTeamLabelTextStyle.copyWith(
                color: Theme.of(context).colorScheme.secondary),
          ),
          const Spacer(),
        ],
      ),
    const  SizedBox(
        height: AppTheme.topScoreVerticalSpacing,
      ),
      Row(
        children: [
          const Spacer(),
          Text(
            "$teamOneScore",
            style: AppTheme.topScoreTeamScoreTextStyle.copyWith(
                color: Theme.of(context).colorScheme.secondary),
          ),
          const Spacer(),
        const  SizedBox(
            width: AppTheme.topScoreHorizontalSpacing,
          ),
          const Spacer(),
          Text(
            "$teamTwoScore",
            style: AppTheme.topScoreTeamScoreTextStyle.copyWith(
                color: Theme.of(context).colorScheme.secondary),
          ),
          const Spacer(),
        ],
      ),
    ]);
  }
}
