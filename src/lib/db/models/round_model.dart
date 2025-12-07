import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/base_model.dart';
import 'package:drift/drift.dart';


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
  
  int? mi20;
  int? mi50;
  int? mi100;
  int? mi150;
  int? mi200;
  
  int? vi20;
  int? vi50;
  int? vi100;
  int? vi150;
  int? vi200;
  

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
    this.mi20,
    this.mi50,
    this.mi100,
    this.mi150,
    this.mi200,
    this.vi20,
    this.vi50,
    this.vi100,
    this.vi150,
    this.vi200,
    
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
      mi20: mi20,
      mi50: mi50,
      mi100: mi100,
      mi150: mi150,
      mi200: mi200,
      vi20: vi20,
      vi50: vi50,
      vi100: vi100,
      vi150: vi150,
      vi200: vi200,
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
      mi20: Value(mi20),
      mi50: Value(mi50),
      mi100: Value(mi100),
      mi150: Value(mi150),
      mi200: Value(mi200),
      vi20: Value(vi20),
      vi50: Value(vi50),
      vi100: Value(vi100),
      vi150: Value(vi150),
      vi200: Value(vi200),
    );
  }
}
