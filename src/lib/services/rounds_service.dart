
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
    final roundsCount = await dao.getRoundsForGameCount(gameId);
    
    if (roundsCount == 0) {
      return currentlyShuffling;
    }
    
    final lastRound = await dao.getLastRoundForGame(gameId);
    
    int lastShuffler;
    if (lastRound == null || lastRound.shuffler == null) {
      lastShuffler = currentlyShuffling;
    } else {
      lastShuffler = lastRound.shuffler!;
    }
    
    int nextShuffler;
    if (gameDirection == 0) {
      nextShuffler = (lastShuffler % totalPlayers) + 1;
    } else {
      nextShuffler = lastShuffler - 1;
      if (nextShuffler < 1) nextShuffler = totalPlayers;
    }
    
    return nextShuffler;
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
    final roundData = await dao.getRoundById(roundId);
    return roundData?.toModel();
  }

  Future<void> createRound(Round round) async {
    await dao.insert(database.roundTable, round.toCompanion());
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