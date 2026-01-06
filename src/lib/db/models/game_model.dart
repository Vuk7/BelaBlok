import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/base_model.dart';
import 'package:drift/drift.dart';

class Game extends BaseModel {
  int? teamOneScore;
  int? teamTwoScore;
  int? gameType;
  int? gameDirection;
  int? currentlyShuffling;
  int? winner;
  bool? finished;
  int? teamOneWins;
  int? teamTwoWins;

  Game({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    this.teamOneScore,
    this.teamTwoScore,
    this.gameType,
    this.gameDirection,
    this.currentlyShuffling,
    this.winner,
    this.finished,
    this.teamOneWins,
    this.teamTwoWins
  });
}

extension GameMapper on GameTableData {
  Game toModel() {
    return Game(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      teamOneScore: teamOneScore,
      teamTwoScore: teamTwoScore,
      gameType: gameType,
      gameDirection: gameDirection,
      currentlyShuffling: currentlyShuffling,
      winner: winner,
      finished: finished,
      teamOneWins: teamOneWins,
      teamTwoWins: teamTwoWins
    );
  }
}

extension GameModelMapper on Game {
  GameTableCompanion toCompanion() {
    return GameTableCompanion(
      updatedAt: Value(updatedAt ?? DateTime.now()),
      deletedAt: Value(deletedAt),
      teamOneScore: Value(teamOneScore),
      teamTwoScore: Value(teamTwoScore),
      gameType: Value(gameType),
      gameDirection: Value(gameDirection),
      currentlyShuffling: Value(currentlyShuffling),
      winner: Value(winner),
      finished: Value(finished),
      teamOneWins: Value(teamOneWins),
      teamTwoWins: Value(teamTwoWins),
    );
  }
}
