import 'package:flutter/material.dart';
import 'package:bela_blok/screens/main_screen/widgets/history_list_item.dart';
import '../../../themes/app_theme.dart';

class AnimatedHistoryListItem extends StatefulWidget {
  final String date, gameID;
  final int teamOneScore, teamTwoScore;
  final Function() onTap;
  final int index;
  final Duration delay;

  const AnimatedHistoryListItem({
    super.key,
    required this.gameID,
    required this.date,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.onTap,
    this.index = 0,
    this.delay = AppTheme.animatedHistoryListItemDefaultDelay,
  });

  @override
  State<AnimatedHistoryListItem> createState() => _AnimatedHistoryListItemState();
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
      duration: AppTheme.animatedHistoryListItemScaleDuration,
      vsync: this,
    );
    
    // Slide-in animation for staggered entry
    _slideController = AnimationController(
      duration: AppTheme.animatedHistoryListItemSlideDuration,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: AppTheme.animatedHistoryListItemScaleBegin,
      end: AppTheme.animatedHistoryListItemScaleEnd,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: AppTheme.animatedHistoryListItemScaleCurve,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: AppTheme.animatedHistoryListItemSlideBegin,
      end: AppTheme.animatedHistoryListItemSlideEnd,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: AppTheme.animatedHistoryListItemSlideCurve,
    ));
    
    _fadeAnimation = Tween<double>(
      begin: AppTheme.animatedHistoryListItemFadeBegin,
      end: AppTheme.animatedHistoryListItemFadeEnd,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve:   const Interval(
        AppTheme.animatedHistoryListItemFadeIntervalStart, 
        AppTheme.animatedHistoryListItemFadeIntervalEnd, 
        curve: AppTheme.animatedHistoryListItemFadeCurve,
      ),
    ));

    // Start staggered animation after delay
    Future.delayed(Duration(milliseconds: widget.index * AppTheme.animatedHistoryListItemStaggerDelayMultiplier), () {
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
      animation: Listenable.merge([_scaleAnimation, _slideAnimation, _fadeAnimation]),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
