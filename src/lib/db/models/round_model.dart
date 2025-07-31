import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/base_model.dart';
import 'package:drift/drift.dart';
import 'dart:convert'; 

class Round extends BaseModel {
  String gameId;
  int? teamCalled;
  int? teamOneScore;
  int? teamTwoScore;
  int? teamOneCallAmount;
  int? teamTwoCallAmount;
  bool? isTeamOneCallSuccessful;
  bool? isTeamTwoCallSuccessful;
  bool? teamFailed;
  Map<String, dynamic>? calculatorResult; 

  Round({
    required this.gameId,
    this.teamCalled,
    this.teamOneScore,
    this.teamTwoScore,
    this.teamOneCallAmount,
    this.teamTwoCallAmount,
    this.isTeamOneCallSuccessful,
    this.isTeamTwoCallSuccessful,
    this.teamFailed,
    this.calculatorResult, 
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });
}

extension RoundMapper on RoundTableData {
  Round toModel() {
    return Round(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      gameId: gameId,
      teamCalled: teamCalled,
      teamOneScore: teamOneScore,
      teamTwoScore: teamTwoScore,
      teamOneCallAmount: teamOneCallAmount,
      teamTwoCallAmount: teamTwoCallAmount,
      isTeamOneCallSuccessful: isTeamOneCallSuccessful,
      isTeamTwoCallSuccessful: isTeamTwoCallSuccessful,


      teamFailed: teamFailed,

      calculatorResult: calculatorResult != null ? jsonDecode(calculatorResult!) : null,

    );
  }
}

extension RoundModelMapper on Round {
  RoundTableCompanion toCompanion() {
    return RoundTableCompanion(
      updatedAt: Value(updatedAt ?? DateTime.now()),
      deletedAt: Value(deletedAt),
      gameId: Value(gameId),
      teamCalled: Value(teamCalled),
      teamOneScore: Value(teamOneScore),
      teamTwoScore: Value(teamTwoScore),
      teamOneCallAmount: Value(teamOneCallAmount),
      teamTwoCallAmount: Value(teamTwoCallAmount),
      isTeamOneCallSuccessful: Value(isTeamOneCallSuccessful),
      isTeamTwoCallSuccessful: Value(isTeamTwoCallSuccessful),
      teamFailed: Value(teamFailed),
      calculatorResult: Value(
        calculatorResult != null ? jsonEncode(calculatorResult) : null,
      ),
    );
  }
}
