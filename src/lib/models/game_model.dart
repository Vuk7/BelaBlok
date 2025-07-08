import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/enums/play_direction_enum.dart';

class GameModel {
  late int _gameID;
  late DateTime _dateTime;
  late int _teamOneScore;
  late int _teamTwoScore;
  late int _gameType;
  late PlayDirection _gameDirection;
  late int _currentlyShuffling;
  late Team _winner;
  late bool _finished;

  GameModel(
      this._gameID,
      this._dateTime,
      this._teamOneScore,
      this._teamTwoScore,
      this._gameType,
      this._gameDirection,
      this._currentlyShuffling,
      this._winner,
      this._finished);

  int get gameID => _gameID;
  DateTime get dateTime => _dateTime;
  int get teamOneScore => _teamOneScore;
  int get teamTwoScore => _teamTwoScore;
  int get gameType => _gameType;
  PlayDirection get gameDirection => _gameDirection;
  int get currentlyShuffling => _currentlyShuffling;
  Team get winner => _winner;
  bool get finished => _finished;

  Map<String, dynamic> toMap() {
    return {
      'gameID': _gameID,
      'dateTime': _dateTime,
      'teamOneScore': _teamOneScore,
      'teamTwoScore': _teamTwoScore,
      'gameType': _gameType,
      'gameDirection': _gameDirection.index,
      'currentlyShuffling': _currentlyShuffling,
      'winner': _winner.index,
      'finished': _finished,
    };
  }

  GameModel.fromMap(Map<String, dynamic> map) {
    _gameID = map['gameID'];
    _dateTime = map['dateTime'];
    _teamOneScore = map['teamOneScore'];
    _teamTwoScore = map['teamTwoScore'];
    _gameType = map['gameType'];
    _gameDirection = PlayDirection.values[map['gameDirection']];
    _currentlyShuffling = map['currentlyShuffling'];
    _winner = Team.values[map['winner']];
    _finished = map['finished'];
  }
}
