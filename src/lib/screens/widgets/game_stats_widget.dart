import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GameStatsWidget extends StatefulWidget {
  final Map<String, dynamic> gameStats;

  const GameStatsWidget({
    super.key,
    required this.gameStats,
  });

  @override
  State<GameStatsWidget> createState() => _GameStatsWidgetState();
}

class _GameStatsWidgetState extends State<GameStatsWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppTheme.green.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          // Header - uvijek vidljiv
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(
                    Icons.analytics,
                    color: AppTheme.green,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'STATISTIKE IGRE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.green,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.emoji_events,
                    color: Colors.amber,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.expand_more,
                      color: AppTheme.green,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Expandable content
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isExpanded ? null : 0,
            child: isExpanded ? Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  
                  // Statistike u grid formatu
                  Row(
                    children: [
                      // MI tim statistike
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'MI',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildStatItem(
                              'Pozivi',
                              widget.gameStats['teamOneCalls'].toString(),
                              Icons.phone_callback,
                              Colors.blue,
                              isDark,
                            ),
                            _buildStatItem(
                              'Padovi',
                              widget.gameStats['teamOneFails'].toString(),
                              Icons.trending_down,
                              Colors.red,
                              isDark,
                            ),
                            _buildStatItem(
                              'Zvanja',
                              widget.gameStats['teamOneDeclarations'].toString(),
                              Icons.star,
                              Colors.amber,
                              isDark,
                            ),
                          ],
                        ),
                      ),
                      
                      // Separator
                      Container(
                        width: 2,
                        height: 120,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                      ),
                      
                      // VI tim statistike
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'VI',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.green,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildStatItem(
                              'Pozivi',
                              widget.gameStats['teamTwoCalls'].toString(),
                              Icons.phone_callback,
                              Colors.blue,
                              isDark,
                            ),
                            _buildStatItem(
                              'Padovi',
                              widget.gameStats['teamTwoFails'].toString(),
                              Icons.trending_down,
                              Colors.red,
                              isDark,
                            ),
                            _buildStatItem(
                              'Zvanja',
                              widget.gameStats['teamTwoDeclarations'].toString(),
                              Icons.star,
                              Colors.amber,
                              isDark,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Dodatne statistike
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: (isDark ? Colors.grey[700] : Colors.grey[100]),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMiniStat(
                          'Uspješnost MI',
                          '${_calculateSuccessRate(widget.gameStats['teamOneCalls'], widget.gameStats['teamOneFails'])}%',
                          isDark,
                        ),
                        _buildMiniStat(
                          'Uspješnost VI',
                          '${_calculateSuccessRate(widget.gameStats['teamTwoCalls'], widget.gameStats['teamTwoFails'])}%',
                          isDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ) : null,
          ),
        ],
      ),
    );
  }
  
  Widget _buildStatItem(String label, String value, IconData icon, Color color, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.grey[300] : Colors.grey[700],
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMiniStat(String label, String value, bool isDark) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  int _calculateSuccessRate(int calls, int fails) {
    if (calls == 0) return 0;
    return (((calls - fails) / calls) * 100).round();
  }
}
