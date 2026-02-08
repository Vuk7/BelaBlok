import 'package:bela_blok/db/dao/calculator_dao.dart';
import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/calculator.model.dart';
import 'package:bela_blok/models/calculator_result_state.model.dart';

class CalculatorService {
  final AppDatabase database;
  final CalculatorDao dao;

  CalculatorService(this.database) : dao = CalculatorDao(database);

  Future<CalculatorResult?> getCalculatorResultByRoundId(String roundId) async {
    final data = await dao.getCalculatorResultByRoundId(roundId);
    return data?.toModel();
  }

  Future<void> saveCalculatorResult(CalculatorResult calculatorResult) async {
    await dao.insertCalculatorResult(calculatorResult);
  }

  Future<void> deleteCalculatorResultByRoundId(String roundId) async {
    await dao.deleteById(
      database.calculatorResultTable,
      database.calculatorResultTable.roundId,
      roundId,
    );
  }

  Future<void> updateCalculatorResult(CalculatorResult calculatorResult) async {
    await deleteCalculatorResultByRoundId(calculatorResult.roundId);
    
    await saveCalculatorResult(calculatorResult);
  }

  CalculatorResult createCalculatorResultFromState(
    String roundId,
    CalculatorResultState calculatorResult,
  ) {
    final selectedCardsJson = calculatorResult.cardsList.isNotEmpty
        ? calculatorResult.cardsList.join(',')
        : null;
    final trumpCardsJson = calculatorResult.trumpCardsList.isNotEmpty
        ? calculatorResult.trumpCardsList.join(',')
        : null;

    return CalculatorResult(
      roundId: roundId,
      teamOneDeclarations: calculatorResult.calculatorResult?.teamOneDeclarations,
      teamOneDeclarationsSum: calculatorResult.calculatorResult?.teamOneDeclarationsSum,
      teamOneFails: calculatorResult.calculatorResult?.teamOneFails,
      teamTwoDeclarations: calculatorResult.calculatorResult?.teamTwoDeclarations,
      teamTwoDeclarationsSum: calculatorResult.calculatorResult?.teamTwoDeclarationsSum,
      teamTwoFails: calculatorResult.calculatorResult?.teamTwoFails,
      selectedCards: selectedCardsJson,
      trumpCards: trumpCardsJson,
      team: calculatorResult.calculatorResult?.team,
    );
  }

  Future<void> saveOrUpdateCalculatorResult(
    String roundId,
    CalculatorResultState calculatorResult,
    bool isEditing,
  ) async {
    if (isEditing) {
      await deleteCalculatorResultByRoundId(roundId);
    }

    final resultModel = createCalculatorResultFromState(roundId, calculatorResult);
    await saveCalculatorResult(resultModel);
  }
}