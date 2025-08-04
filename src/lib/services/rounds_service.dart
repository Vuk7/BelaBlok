
import 'package:bela_blok/db/dao/round_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/round_model.dart';
import 'package:bela_blok/common/constants.dart';

class RoundsService {
  int getNextShuffler({
    required int roundCount,
    required int currentlyShuffling,
    required int gameDirection,
    int totalPlayers = 4,
  }) {
    int start = currentlyShuffling - 1;
    int dir = gameDirection == 0 ? 1 : -1;
    int next = (start + dir * roundCount) % totalPlayers;
    if (next < 0) next += totalPlayers;
    return next + 1;
  }
  final AppDatabase database;
  final RoundDao dao;

  RoundsService(this.database) : dao = RoundDao(database);


  Future<List<RoundTableData>> getRoundsForGameSorted(String gameId) async {
    return await dao.getRoundsForGameSorted(gameId);
  }

  Future<int> getRoundsForGameCount(String gameId) async {
    return await dao.getRoundsForGameCount(gameId);
  }

  Future<String> createRound(Round round) async {
    final result = await dao.insertReturning(database.roundTable, round.toCompanion());
    return result.id;
  }

  Future<void> updateRound(Round round) async {
    await dao.update(
      database.roundTable,
      database.roundTable.id,
      round.id!,
      round.toCompanion(),
    );
  }

  
 
  Map<String, int> calculateRoundScores({
    required int teamOneBase,
    required int teamTwoBase,
    required int teamOneCallAmount,
    required int teamTwoCallAmount,
    int? failedTeam,
  }) {
    if (failedTeam == 0) {
      return calculateFallScores(
        failedTeam: 0,
        teamOneBase: teamOneBase,
        teamTwoBase: teamTwoBase,
        teamOneCallAmount: teamOneCallAmount,
        teamTwoCallAmount: teamTwoCallAmount,
      );
    } else if (failedTeam == 1) {
      return calculateFallScores(
        failedTeam: 1,
        teamOneBase: teamOneBase,
        teamTwoBase: teamTwoBase,
        teamOneCallAmount: teamOneCallAmount,
        teamTwoCallAmount: teamTwoCallAmount,
      );
    } else {
      return calculateNormalScores(
        teamOneBase: teamOneBase,
        teamTwoBase: teamTwoBase,
        teamOneCallAmount: teamOneCallAmount,
        teamTwoCallAmount: teamTwoCallAmount,
      );
    }
  }


  Map<String, int> calculateFallScores({
    required int failedTeam,
    required int teamOneBase,
    required int teamTwoBase,
    required int teamOneCallAmount,
    required int teamTwoCallAmount,
  }) {
   
    if (failedTeam == 0) {
      int allCalls = teamOneCallAmount + teamTwoCallAmount;
      return {
        'teamOneTotal': 0,
        'teamTwoTotal': maxScore + allCalls,
        'teamOneBase': 0,
        'teamTwoBase': maxScore,
        'teamOneCallAmount': 0,
        'teamTwoCallAmount': allCalls,
      };
    } else {
      int allCalls = teamOneCallAmount + teamTwoCallAmount;
      return {
        'teamOneTotal': maxScore + allCalls,
        'teamTwoTotal': 0,
        'teamOneBase': maxScore,
        'teamTwoBase': 0,
        'teamOneCallAmount': allCalls,
        'teamTwoCallAmount': 0,
      };
    }
  }

 
  Map<String, int> calculateNormalScores({
    required int teamOneBase,
    required int teamTwoBase,
    required int teamOneCallAmount,
    required int teamTwoCallAmount,
  }) {
    return {
      'teamOneTotal': teamOneBase + teamOneCallAmount,
      'teamTwoTotal': teamTwoBase + teamTwoCallAmount,
      'teamOneBase': teamOneBase,
      'teamTwoBase': teamTwoBase,
      'teamOneCallAmount': teamOneCallAmount,
      'teamTwoCallAmount': teamTwoCallAmount,
    };
  }
}