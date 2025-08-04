import 'package:bela_blok/db/models/base_model.dart';
import 'package:bela_blok/db/database.dart';
import 'package:drift/drift.dart';

class CalculatorResult extends BaseModel {
  final String roundId; 
  final int? teamOneDeclarations;
  final int? teamOneDeclarationsSum;
  final int? teamOneFails;
  final int? teamTwoDeclarations;
  final int? teamTwoDeclarationsSum;
  final int? teamTwoFails;
  final String? selectedCards;
  final String? trumpCards;
  final String? team;

  CalculatorResult({
    required this.roundId,
    this.teamOneDeclarations,
    this.teamOneDeclarationsSum,
    this.teamOneFails,
    this.teamTwoDeclarations,
    this.teamTwoDeclarationsSum,
    this.teamTwoFails,
    this.selectedCards,
    this.trumpCards,
    this.team,
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });
}

extension CalculatorResultMapper on CalculatorResultTableData {
  CalculatorResult toModel() {
    return CalculatorResult(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      roundId: roundId,
      teamOneDeclarations: teamOneDeclarations,
      teamOneDeclarationsSum: teamOneDeclarationsSum,
      teamOneFails: teamOneFails,
      teamTwoDeclarations: teamTwoDeclarations,
      teamTwoDeclarationsSum: teamTwoDeclarationsSum,
      teamTwoFails: teamTwoFails,
      selectedCards: selectedCards,
      trumpCards: trumpCards,
      team: team,
    );
  }
}

extension CalculatorResultModelMapper on CalculatorResult {
  CalculatorResultTableCompanion toCompanion() {
    return CalculatorResultTableCompanion(
      updatedAt: Value(updatedAt ?? DateTime.now()),
      deletedAt: Value(deletedAt),
      roundId: Value(roundId),
      teamOneDeclarations: teamOneDeclarations != null ? Value(teamOneDeclarations!) : const Value.absent(),
      teamOneDeclarationsSum: teamOneDeclarationsSum != null ? Value(teamOneDeclarationsSum!) : const Value.absent(),
      teamOneFails: teamOneFails != null ? Value(teamOneFails!) : const Value.absent(),
      teamTwoDeclarations: teamTwoDeclarations != null ? Value(teamTwoDeclarations!) : const Value.absent(),
      teamTwoDeclarationsSum: teamTwoDeclarationsSum != null ? Value(teamTwoDeclarationsSum!) : const Value.absent(),
      teamTwoFails: teamTwoFails != null ? Value(teamTwoFails!) : const Value.absent(),
      selectedCards: Value(selectedCards),
      trumpCards: Value(trumpCards),
      team: Value(team),
    );
  }
}