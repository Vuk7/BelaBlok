import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/common/constants.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'falling_arrow_icon.dart';
import 'stihak_icon.dart';

class RoundScoreListItem extends StatelessWidget {
  final int teamOneCallAmount;
  final int teamTwoCallAmount;
  final int teamOneScore;
  final int teamTwoScore;
  final int roundID;
  final Team teamCalled;
  final bool teamFailed;
  final Function() onTap;
  final Function()? onDelete;
  
  final int? mi20;
  final int? mi50;
  final int? mi100;
  final int? mi150;
  final int? mi200;
  
  final int? vi20;
  final int? vi50;
  final int? vi100;
  final int? vi150;
  final int? vi200;
  
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
    this.onDelete,
    this.mi20,
    this.mi50,
    this.mi100,
    this.mi150,
    this.mi200,
    this.vi20,
    this.vi50,
    this.vi100,
    this.vi150,
    this.vi200,
  });

  @override
  Widget build(BuildContext context) {
  
  final bool teamOneFell = teamFailed && teamCalled == Team.teamOne;
  final bool teamTwoFell = teamFailed && teamCalled == Team.teamTwo;
  
  final bool isStihak = teamOneScore == 252 || teamTwoScore == 252;
  final bool teamOneStihak = isStihak && teamOneScore == 252;
  final bool teamTwoStihak = isStihak && teamTwoScore == 252;
    
    final container = Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFD4B896),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (teamCalled == Team.teamOne)
                          const Icon(
                            Icons.mic,
                            color: AppTheme.red,
                            size: 16,
                          ),
                        if (teamCalled == Team.teamOne)
                          const SizedBox(width: 4),
                        if (teamCalled == Team.teamOne)
                          const Text(
                            "ZVAO",
                            style: TextStyle(
                              color: AppTheme.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        if (teamCalled != Team.teamOne)
                          const Icon(
                            Icons.mic,
                            color: Colors.grey,
                            size: 16,
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "${_displayTeamOne()}",
                          style: const TextStyle(
                            color: Color(0xFF2C3E50),
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                        if (teamOneFell) ...[
                          const SizedBox(width: 6),
                       const   Tooltip(
                            message: 'Pad',
                            child: FallingArrowIcon(animateOnce: true),
                          ),
                        ],
                        if (teamOneStihak && !teamOneFell) ...[
                          const SizedBox(width: 6),
                       const   Tooltip(
                            message: 'Štihak',
                            child: StihakIcon(animateOnce: true, color: AppTheme.green),
                          ),
                        ],
                      ],
                    ),
                    Text(
                      "(+$teamOneCallAmount)",
                      style: const TextStyle(
                        color: Color(0xFF2C3E50),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "${(roundID + 1)}.",
                    style: const TextStyle(
                      color: Color(0xFF2C3E50),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${_roundTotal()}",
                    style: const TextStyle(
                      color: Color(0xFF2C3E50),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (teamCalled == Team.teamTwo)
                          const Text(
                            "ZVAO",
                            style: TextStyle(
                              color: AppTheme.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        if (teamCalled == Team.teamTwo)
                          const SizedBox(width: 4),
                        if (teamCalled == Team.teamTwo)
                          const Icon(
                            Icons.mic,
                            color: AppTheme.red,
                            size: 16,
                          ),
                        if (teamCalled != Team.teamTwo)
                          const Icon(
                            Icons.mic,
                            color: Colors.grey,
                            size: 16,
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Spacer(),
                        if (teamTwoStihak && !teamTwoFell) ...[
                       const   Tooltip(
                            message: 'Štihak',
                            child: StihakIcon(animateOnce: true, color: AppTheme.primary),
                          ),
                          const SizedBox(width: 6),
                        ],
                        if (teamTwoFell) ...[
                       const   Tooltip(
                            message: 'Pad',
                            child: FallingArrowIcon(animateOnce: true),
                          ),
                          const SizedBox(width: 6),
                        ],
                        Text(
                          "${_displayTeamTwo()}",
                          style: const TextStyle(
                            color: Color(0xFF2C3E50),
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "(+$teamTwoCallAmount)",
                      style: const TextStyle(
                        color: Color(0xFF2C3E50),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    
    if (onDelete == null) {
      return GestureDetector(
        onTap: onTap,
        child: container,
      );
    }
    
    return Dismissible(
      key: Key('round_$roundID'),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Obriši rundu?'),
              content: Text('Jeste li sigurni da želite obrisati ${roundID + 1}. rundu?'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Odustani'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.red,
                  ),
                  child: const Text('Obriši'),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        onDelete!();
      },
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: AppTheme.red,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 32,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: container,
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
