import '../services/database_service.dart';
import '../db/database.dart';
import '../enums/play_direction_enum.dart';


@Deprecated('Koristite DatabaseService ili direktno GameDao umjesto ovog repository-ja')
class GameRepository {
  final DatabaseService _databaseService = DatabaseService();

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

  Future<List<Game>> getAllGames() async {
    return await _databaseService.getAllGames();
  }

  Future<Game?> getActiveGame() async {
    return await _databaseService.getActiveGame();
  }
}
