import 'package:bela_blok/db/models/calculator.model.dart';

class CalculatorResultState {
  final CalculatorResult? calculatorResult;
  final int score;
  final Map<String, int> cardCounts;
  final Map<String, int> trumpCardCounts;

  CalculatorResultState({
    this.calculatorResult,
    required this.score,
    required this.cardCounts,
    required this.trumpCardCounts,
  });

  List<String> get cardsList => _expandCounts(cardCounts);
  List<String> get trumpCardsList => _expandCounts(trumpCardCounts);

  factory CalculatorResultState.fromCalculatorResult(CalculatorResult result) {
    return CalculatorResultState(
      calculatorResult: result,
      score: 0, 
  cardCounts: _countsFromCsv(result.selectedCards),
  trumpCardCounts: _countsFromCsv(result.trumpCards),
    );
  }


  factory CalculatorResultState.fromMap(Map<String, dynamic> map) {
    return CalculatorResultState(
      calculatorResult: null,
      score: map['score'] as int? ?? 0,
      cardCounts: _countsFromList((map['cards'] as List?)?.cast<String>() ?? <String>[]),
      trumpCardCounts: _countsFromList((map['trumpCards'] as List?)?.cast<String>() ?? <String>[]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamOneDeclarations': calculatorResult?.teamOneDeclarations,
      'teamOneDeclarationsSum': calculatorResult?.teamOneDeclarationsSum,
      'teamOneFails': calculatorResult?.teamOneFails,
      'teamTwoDeclarations': calculatorResult?.teamTwoDeclarations,
      'teamTwoDeclarationsSum': calculatorResult?.teamTwoDeclarationsSum,
      'teamTwoFails': calculatorResult?.teamTwoFails,
      'team': calculatorResult?.team,
      'score': score,
      'cards': cardsList,
      'trumpCards': trumpCardsList,
    };
  }

  static Map<String, int> _countsFromCsv(String? csv) {
    if (csv == null || csv.isEmpty) return <String, int>{};
    final parts = csv.split(',');
    return _countsFromList(parts);
  }

  static Map<String, int> _countsFromList(List<String> items) {
    final Map<String, int> counts = {};
    for (final raw in items) {
      final id = raw.trim();
      if (id.isEmpty) continue;
      counts.update(id, (c) => c + 1, ifAbsent: () => 1);
    }
    return counts;
  }

  static List<String> _expandCounts(Map<String, int> counts) {
    final List<String> out = [];
    counts.forEach((id, count) {
      for (int i = 0; i < count; i++) {
        out.add(id);
      }
    });
    return out;
  }
}
