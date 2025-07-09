import '../db/database.dart';
import '../enums/team_enum.dart';
import '../enums/play_direction_enum.dart';

/// Singleton servis za upravljanje bazom podataka
class DatabaseService {
  static DatabaseService? _instance;
  static AppDatabase? _database;

  DatabaseService._internal();

  factory DatabaseService() {
    _instance ??= DatabaseService._internal();
    return _instance!;
  }

  /// Getter za bazu podataka
  AppDatabase get database {
    _database ??= AppDatabase();
    return _database!;
  }

  /// Inicijalizacija baze (pozovi na početku aplikacije)
  Future<void> initialize() async {
    _database = AppDatabase();
    // Test konekcije
    await _database!.customSelect('SELECT 1').get();
  }

  /// Zatvaranje baze (pozovi pri zatvaranju aplikacije)
  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }

  // --- Metode za igre ---
  
  /// Stvori novu igru
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

  /// Dohvati aktivnu igru
  Future<Game?> getActiveGame() async {
    return await database.gameDao.getActiveGame();
  }

  /// Dohvati sve igre
  Future<List<Game>> getAllGames() async {
    return await database.gameDao.getAllGames();
  }

  /// Dohvati igru po ID-u
  Future<Game?> getGameById(int gameId) async {
    return await database.gameDao.getGameById(gameId);
  }

  /// Ažuriraj rezultat igre
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

  /// Završi igru
  Future<bool> finishGame({
    required int gameId,
    required Team winner,
  }) async {
    return await database.gameDao.finishGame(
      gameId: gameId,
      winner: winner,
    );
  }

  /// Dohvati statistike igara
  Future<Map<String, dynamic>> getGameStatistics() async {
    return await database.gameDao.getGameStatistics();
  }

  // --- Metode za runde ---

  /// Stvori novu rundu
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

  /// Dohvati runde za igru
  Future<List<Round>> getRoundsForGame(int gameId) async {
    return await database.roundDao.getRoundsForGameSorted(gameId);
  }

  /// Dohvati zadnju rundu za igru
  Future<Round?> getLastRoundForGame(int gameId) async {
    return await database.roundDao.getLastRoundForGame(gameId);
  }

  /// Ažuriraj rundu
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

  /// Dohvati statistike rundi za igru
  Future<Map<String, dynamic>> getRoundStatisticsForGame(int gameId) async {
    return await database.roundDao.getRoundStatisticsForGame(gameId);
  }

  /// Obriši igru i sve povezane runde
  Future<bool> deleteGameWithRounds(int gameId) async {
    try {
      // Obriši sve runde za igru
      await database.roundDao.deleteRoundsForGame(gameId);
      // Obriši igru
      final deletedRows = await database.gameDao.deleteGame(gameId);
      return deletedRows > 0;
    } catch (e) {
      return false;
    }
  }

  /// Test konekcije baze
  Future<bool> testConnection() async {
    try {
      await database.customSelect('SELECT 1').get();
      return true;
    } catch (e) {
      return false;
    }
  }
}
