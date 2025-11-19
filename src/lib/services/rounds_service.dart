
import 'package:bela_blok/db/dao/round_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/round_model.dart';
import 'package:bela_blok/common/constants.dart';

class RoundsService {
  Future<int> getNextShuffler({
    required String gameId,
    required int currentlyShuffling,
    required int gameDirection,
    int totalPlayers = 4,
  }) async {
    // Compute next shuffler from first shuffler and next round index 
    final roundsCount = await dao.getRoundsForGameCount(gameId);
    // Next round will be at index = roundsCount (0-based), first is 0
    return computeShuffler(
      firstShuffler: currentlyShuffling,
      index: roundsCount,
      gameDirection: gameDirection,
      totalPlayers: totalPlayers,
    );
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

  Future<Round?> getRoundById(String roundId) async {
  final roundData = await dao.getById(database.roundTable, database.roundTable.id, roundId);
    return roundData?.toModel();
  }

  Future<Round?> getFirstRoundForGame(String gameId) async {
    final roundData = await dao.getFirstRoundForGame(gameId);
    return roundData?.toModel();
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

  Future<void> deleteRound(String roundId) async {
    await dao.deleteById(database.roundTable, database.roundTable.id, roundId);
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
    int computeShuffler({
      required int firstShuffler,
      required int index,
      required int gameDirection,
      int totalPlayers = 4,
    }) {
      final zeroBased = firstShuffler - 1;
      int computed;
      if (gameDirection == 0) {
        // clockwise: 1->2->3->4->1
        computed = (zeroBased + index) % totalPlayers;
      } else {
        // counter-clockwise: 1->4->3->2->1
        computed = (zeroBased - index) % totalPlayers;
        if (computed < 0) computed += totalPlayers;
      }
      return computed + 1;
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