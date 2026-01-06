import 'package:flutter/material.dart';
import 'package:bela_blok/screens/main_screen/widgets/history_list_item.dart';

class AnimatedHistoryListItem extends StatefulWidget {
  final String date, gameID;
  final int teamOneScore, teamTwoScore;
  final Function() onTap;
  final int index;
  final Duration delay;
  final int teamOneWins, teamTwoWins;
  final bool finished;

  const AnimatedHistoryListItem({
    super.key,
    required this.gameID,
    required this.date,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.onTap,
    required this.teamOneWins,
    required this.teamTwoWins,
    required this.finished,
    this.index = 0,
    this.delay = const Duration(milliseconds: 100),
  });

  @override
  State<AnimatedHistoryListItem> createState() =>
      _AnimatedHistoryListItemState();
}

class _AnimatedHistoryListItemState extends State<AnimatedHistoryListItem>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _slideController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Scale animation for tap
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    // Slide-in animation for staggered entry
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
    ));

    // Start staggered animation after delay
    Future.delayed(Duration(milliseconds: widget.index * 150), () {
      if (mounted) {
        _slideController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _handleTapDown() {
    _scaleController.forward();
  }

  void _handleTapUp() {
    _scaleController.reverse();
  }

  void _handleTapCancel() {
    _scaleController.reverse();
  }

  void _handleOnTap() {
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:
          Listenable.merge([_scaleAnimation, _slideAnimation, _fadeAnimation]),
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: GestureDetector(
                onTapDown: (_) => _handleTapDown(),
                onTapUp: (_) => _handleTapUp(),
                onTapCancel: _handleTapCancel,
                child: HistoryListItem(
                  gameID: widget.gameID,
                  date: widget.date,
                  teamOneScore: widget.teamOneScore,
                  teamTwoScore: widget.teamTwoScore,
                  onTap: _handleOnTap,
                  teamOneWins: widget.teamOneWins,
                  teamTwoWins: widget.teamTwoWins,
                  finished: widget.finished,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
