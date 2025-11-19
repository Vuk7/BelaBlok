import 'package:flutter/material.dart';

enum CallType { z20, z50, z100, z150, z200 }
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
        case CallType.z150: return 150;
        case CallType.z200: return 200;
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
        case CallType.z150: return '150';
        case CallType.z200: return '200';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Zvanja: $totalPoints', style: TextStyle(fontSize: 15, color: widget.color, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        ..._calls.asMap().entries.map((entry) {
          final idx = entry.key;
          final c = entry.value;
          if (c.type == SpecialCall.belot) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete_outline, size: 18),
                    color: widget.color,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                    onPressed: () => _removeCall(idx),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        border: Border.all(color: widget.color, width: 1.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Belot', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: widget.color)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text('+${widget.gameType}', style: TextStyle(fontSize: 13, color: widget.color)),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 18),
                  color: widget.color,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                  onPressed: () => _removeCall(idx),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      border: Border.all(color: widget.color, width: 1.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(_callLabel(c.type), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: widget.color)),
                  ),
                ),
                if (c.count > 1)
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text('x${c.count}', style: TextStyle(fontSize: 12, color: widget.color)),
                  ),
              ],
            ),
          );
        }),
        const SizedBox(height: 4),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            _callButton(CallType.z20),
            _callButton(CallType.z50),
            _callButton(CallType.z100),
            _callButton(CallType.z150),
            _callButton(CallType.z200),
            _belotButton(),
          ],
        ),
      ],
    );
  }

  Widget _callButton(CallType type) {
    return SizedBox(
      width: 70,
      child: ElevatedButton(
        onPressed: () => _addCall(type),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: widget.color,
          side: BorderSide(color: widget.color, width: 1.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 7),
          minimumSize: const Size(0, 32),
        ),
        child: Text(_callLabel(type), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: widget.color)),
      ),
    );
  }

  Widget _belotButton() {
    final already = hasBelot;
    return SizedBox(
      width: 70,
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
          backgroundColor: already ? Colors.grey[300] : Colors.transparent,
          foregroundColor: widget.color,
          side: BorderSide(color: widget.color, width: 1.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 7),
          minimumSize: const Size(0, 32),
        ),
        child: Text('Belot', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: widget.color)),
      ),
    );
  }
}
