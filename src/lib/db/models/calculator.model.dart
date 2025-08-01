import 'package:bela_blok/db/models/base_model.dart';

class CalculatorResult extends BaseModel {
  final String roundId; 
  final int teamOneDeclarations;
  final int teamOneDeclarationsSum;
  final int teamOneFails;
  final int teamTwoDeclarations;
  final int teamTwoDeclarationsSum;
  final int teamTwoFails;

  CalculatorResult({
    required this.roundId,
    required this.teamOneDeclarations,
    required this.teamOneDeclarationsSum,
    required this.teamOneFails,
    required this.teamTwoDeclarations,
    required this.teamTwoDeclarationsSum,
    required this.teamTwoFails,
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });
}