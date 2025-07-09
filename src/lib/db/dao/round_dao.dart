import 'package:drift/drift.dart';
import '../database.dart';
import '../../enums/team_enum.dart';

class RoundDao {
  final AppDatabase _db;
  
  RoundDao(this._db);

  // Dohvati sve runde
  Future<List<Round>> getAllRounds() => _db.select(_db.rounds).get();

  // Dohvati rundu po ID-u
  Future<Round?> getRoundById(int id) =>
      (_db.select(_db.rounds)..where((r) => r.id.equals(id))).getSingleOrNull();

  // Dohvati sve runde za određenu igru
  Future<List<Round>> getRoundsForGame(int gameId) =>
      (_db.select(_db.rounds)..where((r) => r.gameId.equals(gameId))).get();

  // Dohvati runde za igru sortirane po vremenu stvaranja
  Future<List<Round>> getRoundsForGameSorted(int gameId) =>
      (_db.select(_db.rounds)
        ..where((r) => r.gameId.equals(gameId))
        ..orderBy([(r) => OrderingTerm.asc(r.createdAt)])).get();

  // Dohvati zadnju rundu za igru
  Future<Round?> getLastRoundForGame(int gameId) =>
      (_db.select(_db.rounds)
        ..where((r) => r.gameId.equals(gameId))
        ..orderBy([(r) => OrderingTerm.desc(r.createdAt)])
        ..limit(1)).getSingleOrNull();

  // Stvori novu rundu
  Future<int> createRound({
    required int gameId,
    required Team teamCalled,
    required int teamOneScore,
    required int teamTwoScore,
    int? teamOneCallAmount,
    int? teamTwoCallAmount,
    bool? isTeamOneCallSuccessful,
    bool? isTeamTwoCallSuccessful,
  }) =>
      _db.into(_db.rounds).insert(RoundsCompanion(
        gameId: Value(gameId),
        teamCalled: Value(teamCalled.index),
        teamOneScore: Value(teamOneScore),
        teamTwoScore: Value(teamTwoScore),
        teamOneCallAmount: Value(teamOneCallAmount),
        teamTwoCallAmount: Value(teamTwoCallAmount),
        isTeamOneCallSuccessful: Value(isTeamOneCallSuccessful),
        isTeamTwoCallSuccessful: Value(isTeamTwoCallSuccessful),
      ));

  // Ažuriraj rundu
  Future<bool> updateRound({
    required int roundId,
    int? teamOneScore,
    int? teamTwoScore,
    int? teamOneCallAmount,
    int? teamTwoCallAmount,
    bool? isTeamOneCallSuccessful,
    bool? isTeamTwoCallSuccessful,
  }) async {
    final rowsAffected = await (_db.update(_db.rounds)
          ..where((r) => r.id.equals(roundId)))
          .write(RoundsCompanion(
            teamOneScore: teamOneScore != null ? Value(teamOneScore) : const Value.absent(),
            teamTwoScore: teamTwoScore != null ? Value(teamTwoScore) : const Value.absent(),
            teamOneCallAmount: Value(teamOneCallAmount),
            teamTwoCallAmount: Value(teamTwoCallAmount),
            isTeamOneCallSuccessful: Value(isTeamOneCallSuccessful),
            isTeamTwoCallSuccessful: Value(isTeamTwoCallSuccessful),
          ));
    return rowsAffected > 0;
  }

  // Obriši rundu
  Future<int> deleteRound(int roundId) =>
      (_db.delete(_db.rounds)..where((r) => r.id.equals(roundId))).go();

  // Obriši sve runde za igru
  Future<int> deleteRoundsForGame(int gameId) =>
      (_db.delete(_db.rounds)..where((r) => r.gameId.equals(gameId))).go();

  // Dohvati statistike rundi za igru
  Future<Map<String, dynamic>> getRoundStatisticsForGame(int gameId) async {
    final rounds = await getRoundsForGame(gameId);
    
    int totalTeamOneScore = 0;
    int totalTeamTwoScore = 0;
    int teamOneCallsSuccess = 0;
    int teamTwoCallsSuccess = 0;
    int teamOneTotalCalls = 0;
    int teamTwoTotalCalls = 0;

    for (final round in rounds) {
      totalTeamOneScore += round.teamOneScore;
      totalTeamTwoScore += round.teamTwoScore;
      
      if (round.teamOneCallAmount != null) {
        teamOneTotalCalls++;
        if (round.isTeamOneCallSuccessful == true) {
          teamOneCallsSuccess++;
        }
      }
      
      if (round.teamTwoCallAmount != null) {
        teamTwoTotalCalls++;
        if (round.isTeamTwoCallSuccessful == true) {
          teamTwoCallsSuccess++;
        }
      }
    }

    return {
      'totalRounds': rounds.length,
      'totalTeamOneScore': totalTeamOneScore,
      'totalTeamTwoScore': totalTeamTwoScore,
      'teamOneCallsSuccess': teamOneCallsSuccess,
      'teamTwoCallsSuccess': teamTwoCallsSuccess,
      'teamOneTotalCalls': teamOneTotalCalls,
      'teamTwoTotalCalls': teamTwoTotalCalls,
      'teamOneCallSuccessRate': teamOneTotalCalls > 0 ? (teamOneCallsSuccess / teamOneTotalCalls) * 100 : 0.0,
      'teamTwoCallSuccessRate': teamTwoTotalCalls > 0 ? (teamTwoCallsSuccess / teamTwoTotalCalls) * 100 : 0.0,
    };
  }

  // Join operacija - dohvati runde s podacima o igri
  Future<List<Map<String, dynamic>>> getRoundsWithGameInfo(int gameId) async {
    final query = _db.select(_db.rounds).join([
      leftOuterJoin(_db.games, _db.games.id.equalsExp(_db.rounds.gameId))
    ]);
    query.where(_db.rounds.gameId.equals(gameId));
    
    final results = await query.get();
    return results.map((row) {
      final round = row.readTable(_db.rounds);
      final game = row.readTableOrNull(_db.games);
      
      return {
        'round': round,
        'game': game,
      };
    }).toList();
  }
}
