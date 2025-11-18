import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  final double teamOneProgress; // 0.0 to 1.0
  final double teamTwoProgress; // 0.0 to 1.0
  final Color teamOneColor;
  final Color teamTwoColor;
  final int teamOneScore;
  final int teamTwoScore;
  final int gameTargetScore;

  const AnimatedProgressBar({
    super.key,
    required this.teamOneProgress,
    required this.teamTwoProgress,
    required this.teamOneColor,
    required this.teamTwoColor,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.gameTargetScore,
  });

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation1;
  late Animation<double> _progressAnimation2;
  double _previousProgress1 = 0.0;
  double _previousProgress2 = 0.0;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _progressAnimation1 = Tween<double>(
      begin: 0.0,
      end: widget.teamOneProgress,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    
    _progressAnimation2 = Tween<double>(
      begin: 0.0,
      end: widget.teamTwoProgress,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (oldWidget.teamOneProgress != widget.teamOneProgress ||
        oldWidget.teamTwoProgress != widget.teamTwoProgress) {
      _previousProgress1 = oldWidget.teamOneProgress;
      _previousProgress2 = oldWidget.teamTwoProgress;
      
      _progressAnimation1 = Tween<double>(
        begin: _previousProgress1,
        end: widget.teamOneProgress,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ));
      
      _progressAnimation2 = Tween<double>(
        begin: _previousProgress2,
        end: widget.teamTwoProgress,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ));
      
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: Colors.amber.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: widget.teamOneColor,
                    size: 32,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'MI',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: widget.teamOneColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.flag,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.gameTargetScore}', 
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    'VI',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: widget.teamTwoColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.person,
                    color: widget.teamTwoColor,
                    size: 32,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.teamOneScore}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: widget.teamOneColor,
                ),
              ),
              Text(
                '${widget.teamTwoScore}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: widget.teamTwoColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Progress bar - veći i ljepši
          LayoutBuilder(
            builder: (context, constraints) {
              final availableWidth = constraints.maxWidth;
              
              return Stack(
                children: [
                  // Background
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[700] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  // Team One Progress
                  AnimatedBuilder(
                    animation: _progressAnimation1,
                    builder: (context, child) {
                      return Container(
                        height: 30,
                        width: availableWidth * _progressAnimation1.value,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              widget.teamOneColor.withValues(alpha: 0.8),
                              widget.teamOneColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: widget.teamOneColor.withValues(alpha: 0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Team Two Progress (from right)
                  Positioned(
                    right: 0,
                    child: AnimatedBuilder(
                      animation: _progressAnimation2,
                      builder: (context, child) {
                        return Container(
                          height: 30,
                          width: availableWidth * _progressAnimation2.value,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                widget.teamTwoColor,
                                widget.teamTwoColor.withValues(alpha: 0.8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: widget.teamTwoColor.withValues(alpha: 0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
               
                  Positioned(
                    left: availableWidth * 0.5 - 1,
                    child: Container(
                      height: 30,
                      width: 2,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withValues(alpha: 0.5),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 12),
          
          Text(
            '${widget.gameTargetScore}', 
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${((widget.teamOneProgress * 100).round())}%',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: widget.teamOneColor,
                    ),
                  ),
                  Text(
                    'Ostalo: ${widget.gameTargetScore - widget.teamOneScore}',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${((widget.teamTwoProgress * 100).round())}%',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: widget.teamTwoColor,
                    ),
                  ),
                  Text(
                    'Ostalo: ${widget.gameTargetScore - widget.teamTwoScore}',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
