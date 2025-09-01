import 'package:flutter/material.dart';
import '../../../themes/app_theme.dart';

enum CallType { z20, z50, z100 }
enum SpecialCall { belot }

class CallEntry {
  final dynamic type; // CallType ili SpecialCall
  int count;
  CallEntry(this.type, [this.count = 1]);
}

class CallShowWidget extends StatefulWidget {
  final String teamLabel;
  final Color color;
  final void Function(List<CallEntry>) onChanged;
  final List<CallEntry>? initialCalls;
  final int gameType;
  const CallShowWidget({super.key, required this.teamLabel, required this.color, required this.onChanged, this.initialCalls, required this.gameType});

  @override
  State<CallShowWidget> createState() => _CallShowWidgetState();
}

class _CallShowWidgetState extends State<CallShowWidget> {
  late List<CallEntry> _calls;
  @override
  void initState() {
    super.initState();
    _calls = widget.initialCalls != null ? List<CallEntry>.from(widget.initialCalls!) : [];
  }

  int get sum => _calls.fold(0, (prev, c) => prev + _callValue(c.type) * c.count);

  int get belotPoints => _calls.any((c) => c.type == SpecialCall.belot) ? widget.gameType : 0;

  int get totalPoints => sum + belotPoints;

  bool get hasBelot => _calls.any((c) => c.type == SpecialCall.belot);

  int _callValue(dynamic t) {
    if (t is CallType) {
      switch (t) {
        case CallType.z20: return 20;
        case CallType.z50: return 50;
        case CallType.z100: return 100;
      }
    }
    // Belot nema vrijednost ovdje, rješava se vani
    return 0;
  }

  String _callLabel(dynamic t) {
    if (t is CallType) {
      switch (t) {
        case CallType.z20: return '20';
        case CallType.z50: return '50';
        case CallType.z100: return '100';
      }
    }
    if (t == SpecialCall.belot) return 'Belot';
    return '';
  }

  void _addCall(CallType type) {
    setState(() {
      final idx = _calls.indexWhere((c) => c.type == type);
      if (idx >= 0) {
        _calls[idx].count++;
      } else {
        _calls.add(CallEntry(type));
      }
      widget.onChanged(_calls);
    });
  }

  void _removeCall(int idx) {
    setState(() {
      if (_calls[idx].count > 1) {
        _calls[idx].count--;
      } else {
        _calls.removeAt(idx);
      }
      widget.onChanged(_calls);
    });
  }

  void _clearAll() {
    setState(() {
      _calls.clear();
      widget.onChanged(_calls);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Zvanja: $sum${belotPoints > 0 ? ' +$belotPoints' : ''}', style: AppTheme.callShowHeaderTextStyle.copyWith(fontSize: AppTheme.callShowHeaderFontSize, color: widget.color)),
            TextButton(
              onPressed: _clearAll,
              style: TextButton.styleFrom(
                foregroundColor: widget.color,
                side: BorderSide(color: widget.color),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTheme.callShowBorderRadius)),
                padding: AppTheme.callShowClearButtonPadding,
                minimumSize: AppTheme.callShowClearButtonMinimumSize,
              ),
              child:const  Text('Obriši', style: AppTheme.callShowClearButtonTextStyle),
            ),
          ],
        ),
         const SizedBox(height: AppTheme.callShowVerticalSpacing),
        ..._calls.asMap().entries.map((entry) {
          final idx = entry.key;
          final c = entry.value;
          if (c.type == SpecialCall.belot) {
            return Padding(
              padding:  AppTheme.callShowListItemPadding,
              child: Row(
                children: [
                  IconButton(
                    icon:const Icon(Icons.delete_outline, size: AppTheme.callShowDeleteIconSize),
                    color: widget.color,
                    padding: EdgeInsets.zero,
                    constraints: AppTheme.callShowDeleteButtonConstraints,
                    onPressed: () => _removeCall(idx),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: AppTheme.callShowContainerPadding,
                      decoration: BoxDecoration(
                        border: Border.all(color: widget.color, width: AppTheme.callShowBorderWidth),
                        borderRadius: BorderRadius.circular(AppTheme.callShowBorderRadius),
                      ),
                      child: Text('Belot', style: AppTheme.callShowCallLabelTextStyle.copyWith(color: widget.color)),
                    ),
                  ),
                  Padding(
                    padding: AppTheme.callShowCountPadding,
                    child: Text('+${widget.gameType}', style: AppTheme.callShowCountTextStyle.copyWith(color: widget.color)),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: AppTheme.callShowListItemPadding,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: AppTheme.callShowDeleteIconSize),
                  color: widget.color,
                  padding: EdgeInsets.zero,
                  constraints: AppTheme.callShowDeleteButtonConstraints,
                  onPressed: () => _removeCall(idx),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: AppTheme.callShowContainerPadding,
                    decoration: BoxDecoration(
                      border: Border.all(color: widget.color, width: AppTheme.callShowBorderWidth),
                      borderRadius: BorderRadius.circular(AppTheme.callShowBorderRadius),
                    ),
                    child: Text(_callLabel(c.type), style: AppTheme.callShowCallLabelTextStyle.copyWith(color: widget.color)),
                  ),
                ),
                if (c.count > 1)
                  Padding(
                    padding: AppTheme.callShowCountPadding,
                    child: Text('x${c.count}', style: AppTheme.callShowCountTextStyle.copyWith(color: widget.color)),
                  ),
              ],
            ),
          );
        }),
        const SizedBox(height: AppTheme.callShowVerticalSpacing),
        Wrap(
          spacing: AppTheme.callShowWrapSpacing,
          runSpacing: AppTheme.callShowWrapRunSpacing,
          children: [
            _callButton(CallType.z20),
            _callButton(CallType.z50),
            _callButton(CallType.z100),
            _belotButton(),
          ],
        ),
      ],
    );
  }

  Widget _callButton(CallType type) {
    return SizedBox(
      width: AppTheme.callShowButtonWidth,
      child: ElevatedButton(
        onPressed: () => _addCall(type),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.callShowButtonBackgroundColor,
          foregroundColor: widget.color,
          side: BorderSide(color: widget.color, width: AppTheme.callShowBorderWidth),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTheme.callShowBorderRadius)),
          elevation: 0,
          padding: AppTheme.callShowContainerPadding,
          minimumSize: AppTheme.callShowButtonMinimumSize,
        ),
        child: Text(_callLabel(type), style: AppTheme.callShowButtonTextStyle.copyWith(color: widget.color)),
      ),
    );
  }

  Widget _belotButton() {
    final already = hasBelot;
    return SizedBox(
      width: AppTheme.callShowButtonWidth,
      child: ElevatedButton(
        onPressed: already
            ? null
            : () {
                setState(() {
                  _calls.removeWhere((c) => c.type == SpecialCall.belot);
                  _calls.add(CallEntry(SpecialCall.belot, 1));
                  widget.onChanged(_calls);
                });
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: already ? AppTheme.callShowDisabledBackgroundColor : AppTheme.callShowButtonBackgroundColor,
          foregroundColor: widget.color,
          side: BorderSide(color: widget.color, width: AppTheme.callShowBorderWidth),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTheme.callShowBorderRadius)),
          elevation: 0,
          padding: AppTheme.callShowContainerPadding,
          minimumSize: AppTheme.callShowButtonMinimumSize,
        ),
        child: Text('Belot', style: AppTheme.callShowButtonTextStyle.copyWith(color: widget.color)),
      ),
    );
  }
}
