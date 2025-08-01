import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/db/models/round_model.dart';

class GameStatsModel {
  final int teamOneDeclarations;
  final int teamOneDeclarationsSum;
  final int teamOneFails;
  final int teamTwoDeclarations;
  final int teamTwoDeclarationsSum;
  final int teamTwoFails;

  GameStatsModel({
    required this.teamOneDeclarations,
    required this.teamOneDeclarationsSum,
    required this.teamOneFails,
    required this.teamTwoDeclarations,
    required this.teamTwoDeclarationsSum,
    required this.teamTwoFails,
  });

  static Future<GameStatsModel> calculate(
    Game game,
    List<Round> rounds,
    AppDatabase db,
  ) async {
    int teamOneDeclarations = 0;
    int teamOneDeclarationsSum = 0;
    int teamOneFails = 0;
    int teamTwoDeclarations = 0;
    int teamTwoDeclarationsSum = 0;
    int teamTwoFails = 0;

    for (final round in rounds) {
      if ((round.teamOneCallAmount ?? 0) > 0) teamOneDeclarations++;
      if ((round.teamTwoCallAmount ?? 0) > 0) teamTwoDeclarations++;

      teamOneDeclarationsSum += round.teamOneCallAmount ?? 0;
      teamTwoDeclarationsSum += round.teamTwoCallAmount ?? 0;

      if (round.id != null) {
        final calculatorResult = await (db.select(db.calculatorResultTable)
          ..where((tbl) => tbl.roundId.equals(round.id!)))
          .getSingleOrNull();

        if (calculatorResult != null) {
          teamOneFails += calculatorResult.teamOneFails;
          teamTwoFails += calculatorResult.teamTwoFails;
        }
      }
    }

    return GameStatsModel(
      teamOneDeclarations: teamOneDeclarations,
      teamOneDeclarationsSum: teamOneDeclarationsSum,
      teamOneFails: teamOneFails,
      teamTwoDeclarations: teamTwoDeclarations,
      teamTwoDeclarationsSum: teamTwoDeclarationsSum,
      teamTwoFails: teamTwoFails,
    );
  }
}