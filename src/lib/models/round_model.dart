import 'package:bela_blok/enums/team_enum.dart';

class RoundModel {
  late int _roundID;
  late Team _teamCalled;
  late int _teamOneScore;
  late int _teamTwoScore;
  late int _teamOneCallAmount;
  late int _teamTwoCallAmount;

  RoundModel(
    this._roundID,
    this._teamCalled,
    this._teamOneScore,
    this._teamTwoScore,
    this._teamOneCallAmount,
    this._teamTwoCallAmount,
  );

  int get roundID => _roundID;
  Team get teamCalled => _teamCalled;
  int get teamOneScore => _teamOneScore;
  int get teamTwoScore => _teamTwoScore;
  int get teamOneCallAmount => _teamOneCallAmount;
  int get teamTwoCallAmount => _teamTwoCallAmount;

  Map<String, dynamic> toMap() {
    return {
      'roundID': _roundID,
      'teamCalled': _teamCalled.index,
      'teamOneScore': _teamOneScore,
      'teamTwoScore': _teamTwoScore,
      'teamOneCallAmount': _teamOneCallAmount,
      'teamTwoCallAmount': _teamTwoCallAmount,
    };
  }

  RoundModel.fromMap(Map<String, dynamic> map) {
    _roundID = map['roundID'];
    _teamCalled = Team.values[map['teamCalled']];
    _teamOneScore = map['teamOneScore'];
    _teamTwoScore = map['teamTwoScore'];
    _teamOneCallAmount = map['teamOneCallAmount'];
    _teamTwoCallAmount = map['teamTwoCallAmount'];
  }
}
