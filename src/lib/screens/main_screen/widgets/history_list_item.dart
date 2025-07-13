import 'package:flutter/material.dart';

class HistoryListItem extends StatelessWidget {
  final String date, gameID;
  final int teamOneScore, teamTwoScore;
  final Function() onTap;

  const HistoryListItem({
    super.key,
    required this.gameID,
    required this.date,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                date,
                style: const TextStyle(fontSize: 15),
              ),
              const Spacer(),
              Text(
                "$teamOneScore - $teamTwoScore",
                style: const TextStyle(fontSize: 20),
              ),
              const Spacer(),
              const Text(
                ">",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
