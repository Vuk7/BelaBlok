import '../services/database_service.dart';
import '../db/database.dart';
import '../enums/play_direction_enum.dart';

/// Repository klasa za igre - wrapper oko DatabaseService-a
/// NAPOMENA: Ova klasa je zastarjela, koristite direktno DatabaseService ili DAO klase
@Deprecated('Koristite DatabaseService ili direktno GameDao umjesto ovog repository-ja')
class GameRepository {
  final DatabaseService _databaseService = DatabaseService();

  /// Stvori novu igru
  Future<int> createGame({
    required int gameType,
    required PlayDirection gameDirection,
    required int currentlyShuffling,
  }) async {
    return await _databaseService.createNewGame(
      gameType: gameType,
      gameDirection: gameDirection,
      currentlyShuffling: currentlyShuffling,
    );
  }

  /// Dohvati sve igre
  Future<List<Game>> getAllGames() async {
    return await _databaseService.getAllGames();
  }

  /// Dohvati aktivnu igru
  Future<Game?> getActiveGame() async {
    return await _databaseService.getActiveGame();
  }
}
