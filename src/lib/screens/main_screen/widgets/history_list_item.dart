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

  void _showTimeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Vrijeme igre'),
        content: Text(date), 
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Zatvori'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // "yyyy-MM-dd HH:mm"
    final dateOnly = date.split(' ').first;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark 
          ? Colors.grey[700] 
          : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => _showTimeDialog(context),
              child: Icon(
                Icons.access_time,
                size: 18,
                color: Theme.of(context).brightness == Brightness.dark 
                  ? Colors.white 
                  : Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 2,
              child: Text(
                dateOnly,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15, 
                  color: Theme.of(context).brightness == Brightness.dark 
                    ? Colors.white 
                    : Colors.black
                ),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.emoji_events,
              size: 20,
              color: Theme.of(context).brightness == Brightness.dark 
                ? Colors.white 
                : Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              "$teamOneScore : $teamTwoScore",
              style: TextStyle(
                fontSize: 20, 
                color: Theme.of(context).brightness == Brightness.dark 
                  ? Colors.white 
                  : Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
