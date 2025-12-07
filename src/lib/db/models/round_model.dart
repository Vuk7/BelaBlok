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
  
  int? us20;
  int? us50;
  int? us100;
  int? us150;
  int? us200;
  
  int? them20;
  int? them50;
  int? them100;
  int? them150;
  int? them200;
  

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
    this.us20,
    this.us50,
    this.us100,
    this.us150,
    this.us200,
    this.them20,
    this.them50,
    this.them100,
    this.them150,
    this.them200,
    
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
      us20: us20,
      us50: us50,
      us100: us100,
      us150: us150,
      us200: us200,
      them20: them20,
      them50: them50,
      them100: them100,
      them150: them150,
      them200: them200,
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
      us20: Value(us20),
      us50: Value(us50),
      us100: Value(us100),
      us150: Value(us150),
      us200: Value(us200),
      them20: Value(them20),
      them50: Value(them50),
      them100: Value(them100),
      them150: Value(them150),
      them200: Value(them200),
    );
  }
}
