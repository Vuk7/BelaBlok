import 'package:flutter/material.dart';

class AnimatedPlayDirectionChoice extends StatefulWidget {
  final int selectedChoice;
  final Color selectedColor;
  final Color notSelectedColor;
  final Function(int id) onTap;
  
  const AnimatedPlayDirectionChoice({
    super.key,
    required this.selectedChoice,
    required this.selectedColor,
    required this.notSelectedColor,
    required this.onTap,
  });

  @override
  State<AnimatedPlayDirectionChoice> createState() => _AnimatedPlayDirectionChoiceState();
}

class _AnimatedPlayDirectionChoiceState extends State<AnimatedPlayDirectionChoice>
    with TickerProviderStateMixin {
  late AnimationController _clockwiseController;
  late AnimationController _counterClockwiseController;
  late Animation<double> _clockwiseAnimation;
  late Animation<double> _counterClockwiseAnimation;

  @override
  void initState() {
    super.initState();
    
    _clockwiseController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _counterClockwiseController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _clockwiseAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0, // 360 degrees
    ).animate(CurvedAnimation(
      parent: _clockwiseController,
      curve: Curves.easeInOut,
    ));
    
    _counterClockwiseAnimation = Tween<double>(
      begin: 0.0,
      end: -1.0, // -360 degrees (counterclockwise)
    ).animate(CurvedAnimation(
      parent: _counterClockwiseController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _clockwiseController.dispose();
    _counterClockwiseController.dispose();
    super.dispose();
  }

  void _animateClockwise() {
    _clockwiseController.forward().then((_) {
      _clockwiseController.reverse();
    });
  }

  void _animateCounterClockwise() {
    _counterClockwiseController.forward().then((_) {
      _counterClockwiseController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Clockwise option
        GestureDetector(
          onTap: () {
            _animateClockwise();
            // Small delay to let animation start
            Future.delayed(const Duration(milliseconds: 50), () {
              widget.onTap(0);
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: (widget.selectedChoice == 0) 
                    ? widget.selectedColor 
                    : widget.notSelectedColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: AnimatedBuilder(
                  animation: _clockwiseAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _clockwiseAnimation.value * 2 * 3.14159, // Full rotation
                      child: const Icon(
                        Icons.rotate_right,
                        color: Colors.white,
                        size: 20,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "U SMJERU KAZALJKE NA SATU",
                style: TextStyle(
                  color: (widget.selectedChoice == 0)
                    ? widget.selectedColor
                    : widget.notSelectedColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Counter-clockwise option
        GestureDetector(
          onTap: () {
            _animateCounterClockwise();
            // Small delay to let animation start
            Future.delayed(const Duration(milliseconds: 50), () {
              widget.onTap(1);
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: (widget.selectedChoice == 1) 
                    ? widget.selectedColor 
                    : widget.notSelectedColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: AnimatedBuilder(
                  animation: _counterClockwiseAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _counterClockwiseAnimation.value * 2 * 3.14159, // Full rotation counterclockwise
                      child: const Icon(
                        Icons.rotate_left,
                        color: Colors.white,
                        size: 20,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "SUPROTNO OD KAZALJKE NA SATU",
                style: TextStyle(
                  color: (widget.selectedChoice == 1)
                    ? widget.selectedColor
                    : widget.notSelectedColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
