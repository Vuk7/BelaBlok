import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:flutter/material.dart';

class ChooseInputType extends StatefulWidget {
  final int selectedChoice;
  final Color selectedColor;
  final Color notSelectedColor;
  final Function(int id) onTap;
  final double boxWidth;
  
  const ChooseInputType({
    super.key,
    required this.selectedChoice,
    required this.selectedColor,
    required this.notSelectedColor,
    required this.onTap,
    required this.boxWidth,
  });

  @override
  State<ChooseInputType> createState() => _ChooseInputTypeState();
}

class _ChooseInputTypeState extends State<ChooseInputType>
    with TickerProviderStateMixin {
  late AnimationController _scaleController1;
  late AnimationController _scaleController2;
  late Animation<double> _scaleAnimation1;
  late Animation<double> _scaleAnimation2;

  @override
  void initState() {
    super.initState();
    
    _scaleController1 = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleController2 = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    _scaleAnimation1 = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _scaleController1,
      curve: Curves.easeOut,
    ));
    
    _scaleAnimation2 = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _scaleController2,
      curve: Curves.easeOut,
    ));
  }

  @override
  void didUpdateWidget(ChooseInputType oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedChoice != widget.selectedChoice) {
      if (widget.selectedChoice == 0) {
        _scaleController1.forward();
        _scaleController2.reverse();
      } else if (widget.selectedChoice == 1) {
        _scaleController2.forward();
        _scaleController1.reverse();
      }
    }
  }

  @override
  void dispose() {
    _scaleController1.dispose();
    _scaleController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnimatedBuilder(
          animation: _scaleAnimation1,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation1.value,
              child: BigButton(
                text: "IGRA",
                textStyle: TextStyle(
                    color: (widget.selectedChoice == 0) ? Colors.white : Colors.black, 
                    fontSize: 24, 
                    fontWeight: FontWeight.bold),
                bgColor: (widget.selectedChoice == 0) ? const Color(0xFF4CAF50) : widget.notSelectedColor,
                onTap: () => widget.onTap(0),
                textPadding: 4,
                width: widget.boxWidth,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _scaleAnimation2,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation2.value,
              child: BigButton(
                text: "ZVANJE",
                textStyle: TextStyle(
                    color: (widget.selectedChoice == 1) ? Colors.white : Colors.black, 
                    fontSize: 24, 
                    fontWeight: FontWeight.bold),
                bgColor: (widget.selectedChoice == 1) ? Colors.red : widget.notSelectedColor,
                onTap: () => widget.onTap(1),
                textPadding: 4,
                width: widget.boxWidth,
              ),
            );
          },
        ),
      ],
    );
  }
}
