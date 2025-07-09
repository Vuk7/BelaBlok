import '../db/database.dart';
import '../enums/team_enum.dart';
import '../enums/play_direction_enum.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static AppDatabase? _database;

  DatabaseService._internal();

  factory DatabaseService() {
    _instance ??= DatabaseService._internal();
    return _instance!;
  }

  AppDatabase get database {
    _database ??= AppDatabase();
    return _database!;
  }

  Future<void> initialize() async {
    _database = AppDatabase();
    await _database!.customSelect('SELECT 1').get();
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }

  
  Future<int> createNewGame({
    required int gameType,
    required PlayDirection gameDirection,
    required int currentlyShuffling,
  }) async {
    return await database.gameDao.createGame(
      gameType: gameType,
      gameDirection: gameDirection,
      currentlyShuffling: currentlyShuffling,
    );
  }

  Future<Game?> getActiveGame() async {
    return await database.gameDao.getActiveGame();
  }

  Future<List<Game>> getAllGames() async {
    return await database.gameDao.getAllGames();
  }

  Future<Game?> getGameById(int gameId) async {
    return await database.gameDao.getGameById(gameId);
  }

  Future<bool> updateGameScore({
    required int gameId,
    required int teamOneScore,
    required int teamTwoScore,
  }) async {
    return await database.gameDao.updateGameScore(
      gameId: gameId,
      teamOneScore: teamOneScore,
      teamTwoScore: teamTwoScore,
    );
  }

  Future<bool> finishGame({
    required int gameId,
    required Team winner,
  }) async {
    return await database.gameDao.finishGame(
      gameId: gameId,
      winner: winner,
    );
  }

  Future<Map<String, dynamic>> getGameStatistics() async {
    return await database.gameDao.getGameStatistics();
  }


  Future<int> createNewRound({
    required int gameId,
    required Team teamCalled,
    required int teamOneScore,
    required int teamTwoScore,
    int? teamOneCallAmount,
    int? teamTwoCallAmount,
    bool? isTeamOneCallSuccessful,
    bool? isTeamTwoCallSuccessful,
  }) async {
    return await database.roundDao.createRound(
      gameId: gameId,
      teamCalled: teamCalled,
      teamOneScore: teamOneScore,
      teamTwoScore: teamTwoScore,
      teamOneCallAmount: teamOneCallAmount,
      teamTwoCallAmount: teamTwoCallAmount,
      isTeamOneCallSuccessful: isTeamOneCallSuccessful,
      isTeamTwoCallSuccessful: isTeamTwoCallSuccessful,
    );
  }

  Future<List<Round>> getRoundsForGame(int gameId) async {
    return await database.roundDao.getRoundsForGameSorted(gameId);
  }

  Future<Round?> getLastRoundForGame(int gameId) async {
    return await database.roundDao.getLastRoundForGame(gameId);
  }

  Future<bool> updateRound({
    required int roundId,
    int? teamOneScore,
    int? teamTwoScore,
    int? teamOneCallAmount,
    int? teamTwoCallAmount,
    bool? isTeamOneCallSuccessful,
    bool? isTeamTwoCallSuccessful,
  }) async {
    return await database.roundDao.updateRound(
      roundId: roundId,
      teamOneScore: teamOneScore,
      teamTwoScore: teamTwoScore,
      teamOneCallAmount: teamOneCallAmount,
      teamTwoCallAmount: teamTwoCallAmount,
      isTeamOneCallSuccessful: isTeamOneCallSuccessful,
      isTeamTwoCallSuccessful: isTeamTwoCallSuccessful,
    );
  }

  Future<Map<String, dynamic>> getRoundStatisticsForGame(int gameId) async {
    return await database.roundDao.getRoundStatisticsForGame(gameId);
  }

  Future<bool> deleteGameWithRounds(int gameId) async {
    try {
      await database.roundDao.deleteRoundsForGame(gameId);
      final deletedRows = await database.gameDao.deleteGame(gameId);
      return deletedRows > 0;
    } catch (e) {
      return false;
    }
  }

  Future<bool> testConnection() async {
    try {
      await database.customSelect('SELECT 1').get();
      return true;
    } catch (e) {
      return false;
    }
  }
}
