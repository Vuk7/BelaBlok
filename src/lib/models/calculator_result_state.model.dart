import 'package:bela_blok/db/models/calculator.model.dart';

class CalculatorResultState {
  final CalculatorResult? calculatorResult;
  final int score;
  final List<String> cardsList;
  final List<String> trumpCardsList;

  CalculatorResultState({
    this.calculatorResult,
    required this.score,
    required this.cardsList,
    required this.trumpCardsList,
  });

  factory CalculatorResultState.fromCalculatorResult(CalculatorResult result) {
    return CalculatorResultState(
      calculatorResult: result,
      score: 0, 
      cardsList: result.selectedCards?.split(',') ?? <String>[],
      trumpCardsList: result.trumpCards?.split(',') ?? <String>[],
    );
  }

  factory CalculatorResultState.fromTableData(dynamic tableData) {
    final CalculatorResult result = CalculatorResult(
      id: tableData.id,
      createdAt: tableData.createdAt,
      updatedAt: tableData.updatedAt,
      deletedAt: tableData.deletedAt,
      roundId: tableData.roundId,
      teamOneDeclarations: tableData.teamOneDeclarations,
      teamOneDeclarationsSum: tableData.teamOneDeclarationsSum,
      teamOneFails: tableData.teamOneFails,
      teamTwoDeclarations: tableData.teamTwoDeclarations,
      teamTwoDeclarationsSum: tableData.teamTwoDeclarationsSum,
      teamTwoFails: tableData.teamTwoFails,
      selectedCards: tableData.selectedCards,
      trumpCards: tableData.trumpCards,
      team: tableData.team,
    );
    
    return CalculatorResultState(
      calculatorResult: result,
      score: 0, 
      cardsList: result.selectedCards?.split(',').where((card) => card.isNotEmpty).toList() ?? <String>[],
      trumpCardsList: result.trumpCards?.split(',').where((card) => card.isNotEmpty).toList() ?? <String>[],
    );
  }

  factory CalculatorResultState.fromMap(Map<String, dynamic> map) {
    return CalculatorResultState(
      calculatorResult: null,
      score: map['score'] as int? ?? 0,
      cardsList: (map['cards'] as List?)?.cast<String>() ?? <String>[],
      trumpCardsList: (map['trumpCards'] as List?)?.cast<String>() ?? <String>[],
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
}
