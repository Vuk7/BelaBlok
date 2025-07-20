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
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFD4B896), // svjetlo smeđa boja
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
              // Lijevi tim (MI)
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
                    Text(
                      "$teamOneScore",
                      style: const TextStyle(
                        color: Color(0xFF2C3E50),
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
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
              // Srednji dio - broj runde i ukupno
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
                    "${(teamOneScore + teamTwoScore)}",
                    style: const TextStyle(
                      color: Color(0xFF2C3E50),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              // Desni tim (VI)
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
                    Text(
                      "$teamTwoScore",
                      style: const TextStyle(
                        color: Color(0xFF2C3E50),
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
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
      ),
    );
  }
}
