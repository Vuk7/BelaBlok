
import 'package:bela_blok/db/dao/round_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/round_model.dart';

class RoundsService {
  final AppDatabase database;
  final RoundDao dao;

  RoundsService(this.database) : dao = RoundDao(database);

  Future<List<RoundTableData>> getRoundsForGameSorted(String gameId) async {
    return await dao.getRoundsForGameSorted(gameId);
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
      
      return {
        'teamOneTotal': 0,
        'teamTwoTotal': teamTwoBase + teamTwoCallAmount + teamOneCallAmount,
        'teamOneBase': teamOneBase,
        'teamTwoBase': teamTwoBase,
        'teamOneCallAmount': teamOneCallAmount,
        'teamTwoCallAmount': teamTwoCallAmount + teamOneCallAmount,
      };
    } else if (failedTeam == 1) {
      
      return {
        'teamOneTotal': teamOneBase + teamOneCallAmount + teamTwoCallAmount,
        'teamTwoTotal': 0,
        'teamOneBase': teamOneBase,
        'teamTwoBase': teamTwoBase,
        'teamOneCallAmount': teamOneCallAmount + teamTwoCallAmount,
        'teamTwoCallAmount': teamTwoCallAmount,
      };
    } else {
      
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
}