
import 'package:bela_blok/db/dao/round_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/round_model.dart';
import 'package:bela_blok/services/calculators/round_calculator.dart';

class RoundsService {
  final AppDatabase database;
  final RoundDao dao;
  final RoundCalculator calculator;

  RoundsService(this.database, {RoundCalculator? calculator}) 
      : dao = RoundDao(database),
        calculator = calculator ?? RoundCalculator();

  Future<int> getNextShuffler({
    required String gameId,
    required int currentlyShuffling,
    required int gameDirection,
    int totalPlayers = 4,
  }) async {
    // Compute next shuffler from first shuffler and next round index 
    final roundsCount = await dao.getRoundsForGameCount(gameId);
    // Next round will be at index = roundsCount (0-based), first is 0
    return calculator.computeShuffler(
      firstShuffler: currentlyShuffling,
      roundIndex: roundsCount,
      gameDirection: gameDirection,
      totalPlayers: totalPlayers,
    );
  }


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

  /// Računa rezultate runde delegirajući na RoundCalculator.
  /// Ova metoda služi kao wrapper za lakšu upotrebu iz ostatka aplikacije.
  Map<String, int> calculateRoundScores({
    required int teamOneBase,
    required int teamTwoBase,
    required int teamOneCallAmount,
    required int teamTwoCallAmount,
    int? failedTeam,
  }) {
    return calculator.calculateRoundScores(
      teamOneBase: teamOneBase,
      teamTwoBase: teamTwoBase,
      teamOneCallAmount: teamOneCallAmount,
      teamTwoCallAmount: teamTwoCallAmount,
      failedTeam: failedTeam,
    );
  }
}