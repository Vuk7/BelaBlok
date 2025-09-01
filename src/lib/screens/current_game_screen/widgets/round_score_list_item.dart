import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/common/constants.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'falling_arrow_icon.dart';

class RoundScoreListItem extends StatelessWidget {
  final int teamOneCallAmount;
  final int teamTwoCallAmount;
  final int teamOneScore;
  final int teamTwoScore;
  final int roundID;
  final Team teamCalled;
  final bool teamFailed;
  final Function() onTap;
  const RoundScoreListItem({
    super.key,
    required this.teamOneCallAmount,
    required this.teamTwoCallAmount,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.roundID,
    required this.teamCalled,
    required this.teamFailed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
  
  final bool teamOneFell = teamFailed && teamCalled == Team.teamOne;
  final bool teamTwoFell = teamFailed && teamCalled == Team.teamTwo;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: AppTheme.roundScoreListItemMargin,
        decoration: BoxDecoration(
          color: AppTheme.roundScoreListItemBackgroundColor,
          borderRadius: BorderRadius.circular(AppTheme.roundScoreListItemBorderRadius),
          boxShadow: [
            BoxShadow(
              color: AppTheme.roundScoreListItemShadowColor.withValues(alpha: AppTheme.roundScoreListItemShadowOpacity),
              blurRadius: AppTheme.roundScoreListItemShadowBlurRadius,
              offset: AppTheme.roundScoreListItemShadowOffset,
            ),
          ],
        ),
        child: Padding(
          padding: AppTheme.roundScoreListItemPadding,
          child: Row(
            children: [
              // Lijevi tim (MI)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const SizedBox(height: AppTheme.roundScoreListItemTopSpacing),
                    Row(
                      children: [
                        if (teamCalled == Team.teamOne)
                        const   Icon(
                            Icons.mic,
                            color: AppTheme.red,
                            size: AppTheme.roundScoreListItemIconSize,
                          ),
                        if (teamCalled == Team.teamOne)
                         const SizedBox(width: AppTheme.roundScoreListItemIconTextSpacing),
                        if (teamCalled == Team.teamOne)
                          Text(
                            "ZVAO",
                            style: AppTheme.roundScoreListItemCallTextStyle.copyWith(
                              color: AppTheme.red,
                            ),
                          ),
                        if (teamCalled != Team.teamOne)
                           const Icon(
                            Icons.mic,
                            color: AppTheme.roundScoreListItemInactiveIconColor,
                            size: AppTheme.roundScoreListItemIconSize,
                          ),
                      ],
                    ),
                   const SizedBox(height: AppTheme.roundScoreListItemIconTextSpacing),
                    Row(
                      children: [
                        Text(
                          "${_displayTeamOne()}",
                          style: AppTheme.roundScoreListItemScoreTextStyle.copyWith(
                            color: AppTheme.roundScoreListItemTextColor,
                          ),
                        ),
                        if (teamOneFell) ...[
                       const   SizedBox(width: AppTheme.roundScoreListItemArrowSpacing),
                       const   Tooltip(
                            message: 'Pad',
                            child: FallingArrowIcon(animateOnce: true),
                          ),
                        ],
                      ],
                    ),
                    Text(
                      "(+$teamOneCallAmount)",
                      style: AppTheme.roundScoreListItemCallAmountTextStyle.copyWith(
                        color: AppTheme.roundScoreListItemTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "${(roundID + 1)}.",
                    style: AppTheme.roundScoreListItemRoundNumberTextStyle.copyWith(
                      color: AppTheme.roundScoreListItemTextColor,
                    ),
                  ),
                 const  SizedBox(height: AppTheme.roundScoreListItemCenterSpacing),
                  Text(
                    "${_roundTotal()}",
                    style: AppTheme.roundScoreListItemTotalTextStyle.copyWith(
                      color: AppTheme.roundScoreListItemTextColor,
                    ),
                  ),
                ],
              ),
              // Desni tim (VI)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   const SizedBox(height: AppTheme.roundScoreListItemTopSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (teamCalled == Team.teamTwo)
                          Text(
                            "ZVAO",
                            style: AppTheme.roundScoreListItemCallTextStyle.copyWith(
                              color: AppTheme.red,
                            ),
                          ),
                        if (teamCalled == Team.teamTwo)
                         const SizedBox(width: AppTheme.roundScoreListItemIconTextSpacing),
                        if (teamCalled == Team.teamTwo)
                       const   Icon(
                            Icons.mic,
                            color: AppTheme.red,
                            size: AppTheme.roundScoreListItemIconSize,
                          ),
                        if (teamCalled != Team.teamTwo)
                       const   Icon(
                            Icons.mic,
                            color: AppTheme.roundScoreListItemInactiveIconColor,
                            size: AppTheme.roundScoreListItemIconSize,
                          ),
                      ],
                    ),
                 const   SizedBox(height: AppTheme.roundScoreListItemIconTextSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${_displayTeamTwo()}",
                          style: AppTheme.roundScoreListItemScoreTextStyle.copyWith(
                            color: AppTheme.roundScoreListItemTextColor,
                          ),
                        ),
                        if (teamTwoFell) ...[
                       const   SizedBox(width: AppTheme.roundScoreListItemArrowSpacing),
                       const   Tooltip(
                            message: 'Pad',
                            child: FallingArrowIcon(animateOnce: true),
                          ),
                        ],
                      ],
                    ),
                    Text(
                      "(+$teamTwoCallAmount)",
                      style: AppTheme.roundScoreListItemCallAmountTextStyle.copyWith(
                        color: AppTheme.roundScoreListItemTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _roundTotal() {
    final callsSum = teamOneCallAmount + teamTwoCallAmount;
    if (teamFailed) {
      return maxScore + callsSum;
    }
    return teamOneScore + teamTwoScore + callsSum;
  }

  int _displayTeamOne() {
    final callsSum = teamOneCallAmount + teamTwoCallAmount;
    if (teamFailed && teamCalled == Team.teamOne) return 0;
    if (teamFailed && teamCalled == Team.teamTwo) return maxScore + callsSum;
    return teamOneScore + teamOneCallAmount;
  }

  int _displayTeamTwo() {
    final callsSum = teamOneCallAmount + teamTwoCallAmount;
    if (teamFailed && teamCalled == Team.teamTwo) return 0;
    if (teamFailed && teamCalled == Team.teamOne) return maxScore + callsSum;
    return teamTwoScore + teamTwoCallAmount;
  }
}
