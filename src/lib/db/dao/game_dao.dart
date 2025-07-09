import 'package:drift/drift.dart';
import '../database.dart';
import '../../enums/team_enum.dart';
import '../../enums/play_direction_enum.dart';

class GameDao {
  final AppDatabase _db;
  
  GameDao(this._db);

  // Dohvati sve igre
  Future<List<Game>> getAllGames() => 
      (_db.select(_db.games)).get();

  // Dohvati igru po ID-u
  Future<Game?> getGameById(int id) =>
      (_db.select(_db.games)..where((g) => g.id.equals(id))).getSingleOrNull();

  // Dohvati aktivnu igru (nedovršenu)
  Future<Game?> getActiveGame() =>
      (_db.select(_db.games)..where((g) => g.finished.equals(false)))
          .getSingleOrNull();

  // Dohvati sve dovršene igre
  Future<List<Game>> getFinishedGames() =>
      (_db.select(_db.games)..where((g) => g.finished.equals(true))).get();

  // Dohvati igre sortirane po datumu (najnovije prvo)
  Future<List<Game>> getGamesSortedByDate() =>
      (_db.select(_db.games)..orderBy([(g) => OrderingTerm.desc(g.gameDateTime)])).get();

  // Stvori novu igru
  Future<int> createGame({
    required int gameType,
    required PlayDirection gameDirection,
    required int currentlyShuffling,
  }) {
    return _db.into(_db.games).insert(
      GamesCompanion(
        gameDateTime: Value(DateTime.now()),
        gameType: Value(gameType),
        gameDirection: Value(gameDirection.index),
        currentlyShuffling: Value(currentlyShuffling),
      ),
    );
  }

  // Ažuriraj rezultat igre
  Future<bool> updateGameScore({
    required int gameId,
    required int teamOneScore,
    required int teamTwoScore,
  }) async {
    final rowsAffected = await (_db.update(_db.games)
          ..where((g) => g.id.equals(gameId)))
          .write(
            GamesCompanion(
              teamOneScore: Value(teamOneScore),
              teamTwoScore: Value(teamTwoScore),
              updatedAt: Value(DateTime.now()),
            ),
          );
    return rowsAffected > 0;
  }

  // Završi igru
  Future<bool> finishGame({
    required int gameId,
    required Team winner,
  }) async {
    final rowsAffected = await (_db.update(_db.games)
          ..where((g) => g.id.equals(gameId)))
          .write(
            GamesCompanion(
              winner: Value(winner.index),
              finished: const Value(true),
              updatedAt: Value(DateTime.now()),
            ),
          );
    return rowsAffected > 0;
  }

  // Ažuriraj koji igrač dijeli
  Future<bool> updateCurrentlyShuffling({
    required int gameId,
    required int currentlyShuffling,
  }) async {
    final rowsAffected = await (_db.update(_db.games)
          ..where((g) => g.id.equals(gameId)))
          .write(
            GamesCompanion(
              currentlyShuffling: Value(currentlyShuffling),
              updatedAt: Value(DateTime.now()),
            ),
          );
    return rowsAffected > 0;
  }

  // Obriši igru
  Future<int> deleteGame(int gameId) =>
      (_db.delete(_db.games)..where((g) => g.id.equals(gameId))).go();

  // Dohvati statistike
  Future<Map<String, dynamic>> getGameStatistics() async {
    final allGames = await getAllGames();
    final finishedGames = allGames.where((g) => g.finished).toList();

    int teamOneWins = 0;
    int teamTwoWins = 0;

    for (final game in finishedGames) {
      if (game.winner != null) {
        final winner = Team.values[game.winner!];
        if (winner == Team.teamOne) {
          teamOneWins++;
        } else if (winner == Team.teamTwo) {
          teamTwoWins++;
        }
      }
    }

    return {
      'totalGames': allGames.length,
      'finishedGames': finishedGames.length,
      'activeGames': allGames.length - finishedGames.length,
      'teamOneWins': teamOneWins,
      'teamTwoWins': teamTwoWins,
    };
  }
}
