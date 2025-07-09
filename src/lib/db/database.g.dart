// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GamesTable extends Games with TableInfo<$GamesTable, Game> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _gameDateTimeMeta =
      const VerificationMeta('gameDateTime');
  @override
  late final GeneratedColumn<DateTime> gameDateTime = GeneratedColumn<DateTime>(
      'game_date_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _teamOneScoreMeta =
      const VerificationMeta('teamOneScore');
  @override
  late final GeneratedColumn<int> teamOneScore = GeneratedColumn<int>(
      'team_one_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _teamTwoScoreMeta =
      const VerificationMeta('teamTwoScore');
  @override
  late final GeneratedColumn<int> teamTwoScore = GeneratedColumn<int>(
      'team_two_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _gameTypeMeta =
      const VerificationMeta('gameType');
  @override
  late final GeneratedColumn<int> gameType = GeneratedColumn<int>(
      'game_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _gameDirectionMeta =
      const VerificationMeta('gameDirection');
  @override
  late final GeneratedColumn<int> gameDirection = GeneratedColumn<int>(
      'game_direction', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentlyShufflingMeta =
      const VerificationMeta('currentlyShuffling');
  @override
  late final GeneratedColumn<int> currentlyShuffling = GeneratedColumn<int>(
      'currently_shuffling', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _winnerMeta = const VerificationMeta('winner');
  @override
  late final GeneratedColumn<int> winner = GeneratedColumn<int>(
      'winner', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _finishedMeta =
      const VerificationMeta('finished');
  @override
  late final GeneratedColumn<bool> finished = GeneratedColumn<bool>(
      'finished', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("finished" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        gameDateTime,
        teamOneScore,
        teamTwoScore,
        gameType,
        gameDirection,
        currentlyShuffling,
        winner,
        finished,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'games';
  @override
  VerificationContext validateIntegrity(Insertable<Game> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_date_time')) {
      context.handle(
          _gameDateTimeMeta,
          gameDateTime.isAcceptableOrUnknown(
              data['game_date_time']!, _gameDateTimeMeta));
    } else if (isInserting) {
      context.missing(_gameDateTimeMeta);
    }
    if (data.containsKey('team_one_score')) {
      context.handle(
          _teamOneScoreMeta,
          teamOneScore.isAcceptableOrUnknown(
              data['team_one_score']!, _teamOneScoreMeta));
    }
    if (data.containsKey('team_two_score')) {
      context.handle(
          _teamTwoScoreMeta,
          teamTwoScore.isAcceptableOrUnknown(
              data['team_two_score']!, _teamTwoScoreMeta));
    }
    if (data.containsKey('game_type')) {
      context.handle(_gameTypeMeta,
          gameType.isAcceptableOrUnknown(data['game_type']!, _gameTypeMeta));
    } else if (isInserting) {
      context.missing(_gameTypeMeta);
    }
    if (data.containsKey('game_direction')) {
      context.handle(
          _gameDirectionMeta,
          gameDirection.isAcceptableOrUnknown(
              data['game_direction']!, _gameDirectionMeta));
    } else if (isInserting) {
      context.missing(_gameDirectionMeta);
    }
    if (data.containsKey('currently_shuffling')) {
      context.handle(
          _currentlyShufflingMeta,
          currentlyShuffling.isAcceptableOrUnknown(
              data['currently_shuffling']!, _currentlyShufflingMeta));
    } else if (isInserting) {
      context.missing(_currentlyShufflingMeta);
    }
    if (data.containsKey('winner')) {
      context.handle(_winnerMeta,
          winner.isAcceptableOrUnknown(data['winner']!, _winnerMeta));
    }
    if (data.containsKey('finished')) {
      context.handle(_finishedMeta,
          finished.isAcceptableOrUnknown(data['finished']!, _finishedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Game map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Game(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gameDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}game_date_time'])!,
      teamOneScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_one_score'])!,
      teamTwoScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_two_score'])!,
      gameType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_type'])!,
      gameDirection: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_direction'])!,
      currentlyShuffling: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}currently_shuffling'])!,
      winner: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}winner']),
      finished: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}finished'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $GamesTable createAlias(String alias) {
    return $GamesTable(attachedDatabase, alias);
  }
}

class Game extends DataClass implements Insertable<Game> {
  final int id;
  final DateTime gameDateTime;
  final int teamOneScore;
  final int teamTwoScore;
  final int gameType;
  final int gameDirection;
  final int currentlyShuffling;
  final int? winner;
  final bool finished;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Game(
      {required this.id,
      required this.gameDateTime,
      required this.teamOneScore,
      required this.teamTwoScore,
      required this.gameType,
      required this.gameDirection,
      required this.currentlyShuffling,
      this.winner,
      required this.finished,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_date_time'] = Variable<DateTime>(gameDateTime);
    map['team_one_score'] = Variable<int>(teamOneScore);
    map['team_two_score'] = Variable<int>(teamTwoScore);
    map['game_type'] = Variable<int>(gameType);
    map['game_direction'] = Variable<int>(gameDirection);
    map['currently_shuffling'] = Variable<int>(currentlyShuffling);
    if (!nullToAbsent || winner != null) {
      map['winner'] = Variable<int>(winner);
    }
    map['finished'] = Variable<bool>(finished);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GamesCompanion toCompanion(bool nullToAbsent) {
    return GamesCompanion(
      id: Value(id),
      gameDateTime: Value(gameDateTime),
      teamOneScore: Value(teamOneScore),
      teamTwoScore: Value(teamTwoScore),
      gameType: Value(gameType),
      gameDirection: Value(gameDirection),
      currentlyShuffling: Value(currentlyShuffling),
      winner:
          winner == null && nullToAbsent ? const Value.absent() : Value(winner),
      finished: Value(finished),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Game.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Game(
      id: serializer.fromJson<int>(json['id']),
      gameDateTime: serializer.fromJson<DateTime>(json['gameDateTime']),
      teamOneScore: serializer.fromJson<int>(json['teamOneScore']),
      teamTwoScore: serializer.fromJson<int>(json['teamTwoScore']),
      gameType: serializer.fromJson<int>(json['gameType']),
      gameDirection: serializer.fromJson<int>(json['gameDirection']),
      currentlyShuffling: serializer.fromJson<int>(json['currentlyShuffling']),
      winner: serializer.fromJson<int?>(json['winner']),
      finished: serializer.fromJson<bool>(json['finished']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameDateTime': serializer.toJson<DateTime>(gameDateTime),
      'teamOneScore': serializer.toJson<int>(teamOneScore),
      'teamTwoScore': serializer.toJson<int>(teamTwoScore),
      'gameType': serializer.toJson<int>(gameType),
      'gameDirection': serializer.toJson<int>(gameDirection),
      'currentlyShuffling': serializer.toJson<int>(currentlyShuffling),
      'winner': serializer.toJson<int?>(winner),
      'finished': serializer.toJson<bool>(finished),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Game copyWith(
          {int? id,
          DateTime? gameDateTime,
          int? teamOneScore,
          int? teamTwoScore,
          int? gameType,
          int? gameDirection,
          int? currentlyShuffling,
          Value<int?> winner = const Value.absent(),
          bool? finished,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Game(
        id: id ?? this.id,
        gameDateTime: gameDateTime ?? this.gameDateTime,
        teamOneScore: teamOneScore ?? this.teamOneScore,
        teamTwoScore: teamTwoScore ?? this.teamTwoScore,
        gameType: gameType ?? this.gameType,
        gameDirection: gameDirection ?? this.gameDirection,
        currentlyShuffling: currentlyShuffling ?? this.currentlyShuffling,
        winner: winner.present ? winner.value : this.winner,
        finished: finished ?? this.finished,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Game copyWithCompanion(GamesCompanion data) {
    return Game(
      id: data.id.present ? data.id.value : this.id,
      gameDateTime: data.gameDateTime.present
          ? data.gameDateTime.value
          : this.gameDateTime,
      teamOneScore: data.teamOneScore.present
          ? data.teamOneScore.value
          : this.teamOneScore,
      teamTwoScore: data.teamTwoScore.present
          ? data.teamTwoScore.value
          : this.teamTwoScore,
      gameType: data.gameType.present ? data.gameType.value : this.gameType,
      gameDirection: data.gameDirection.present
          ? data.gameDirection.value
          : this.gameDirection,
      currentlyShuffling: data.currentlyShuffling.present
          ? data.currentlyShuffling.value
          : this.currentlyShuffling,
      winner: data.winner.present ? data.winner.value : this.winner,
      finished: data.finished.present ? data.finished.value : this.finished,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Game(')
          ..write('id: $id, ')
          ..write('gameDateTime: $gameDateTime, ')
          ..write('teamOneScore: $teamOneScore, ')
          ..write('teamTwoScore: $teamTwoScore, ')
          ..write('gameType: $gameType, ')
          ..write('gameDirection: $gameDirection, ')
          ..write('currentlyShuffling: $currentlyShuffling, ')
          ..write('winner: $winner, ')
          ..write('finished: $finished, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      gameDateTime,
      teamOneScore,
      teamTwoScore,
      gameType,
      gameDirection,
      currentlyShuffling,
      winner,
      finished,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Game &&
          other.id == this.id &&
          other.gameDateTime == this.gameDateTime &&
          other.teamOneScore == this.teamOneScore &&
          other.teamTwoScore == this.teamTwoScore &&
          other.gameType == this.gameType &&
          other.gameDirection == this.gameDirection &&
          other.currentlyShuffling == this.currentlyShuffling &&
          other.winner == this.winner &&
          other.finished == this.finished &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GamesCompanion extends UpdateCompanion<Game> {
  final Value<int> id;
  final Value<DateTime> gameDateTime;
  final Value<int> teamOneScore;
  final Value<int> teamTwoScore;
  final Value<int> gameType;
  final Value<int> gameDirection;
  final Value<int> currentlyShuffling;
  final Value<int?> winner;
  final Value<bool> finished;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const GamesCompanion({
    this.id = const Value.absent(),
    this.gameDateTime = const Value.absent(),
    this.teamOneScore = const Value.absent(),
    this.teamTwoScore = const Value.absent(),
    this.gameType = const Value.absent(),
    this.gameDirection = const Value.absent(),
    this.currentlyShuffling = const Value.absent(),
    this.winner = const Value.absent(),
    this.finished = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GamesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime gameDateTime,
    this.teamOneScore = const Value.absent(),
    this.teamTwoScore = const Value.absent(),
    required int gameType,
    required int gameDirection,
    required int currentlyShuffling,
    this.winner = const Value.absent(),
    this.finished = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : gameDateTime = Value(gameDateTime),
        gameType = Value(gameType),
        gameDirection = Value(gameDirection),
        currentlyShuffling = Value(currentlyShuffling);
  static Insertable<Game> custom({
    Expression<int>? id,
    Expression<DateTime>? gameDateTime,
    Expression<int>? teamOneScore,
    Expression<int>? teamTwoScore,
    Expression<int>? gameType,
    Expression<int>? gameDirection,
    Expression<int>? currentlyShuffling,
    Expression<int>? winner,
    Expression<bool>? finished,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameDateTime != null) 'game_date_time': gameDateTime,
      if (teamOneScore != null) 'team_one_score': teamOneScore,
      if (teamTwoScore != null) 'team_two_score': teamTwoScore,
      if (gameType != null) 'game_type': gameType,
      if (gameDirection != null) 'game_direction': gameDirection,
      if (currentlyShuffling != null) 'currently_shuffling': currentlyShuffling,
      if (winner != null) 'winner': winner,
      if (finished != null) 'finished': finished,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GamesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? gameDateTime,
      Value<int>? teamOneScore,
      Value<int>? teamTwoScore,
      Value<int>? gameType,
      Value<int>? gameDirection,
      Value<int>? currentlyShuffling,
      Value<int?>? winner,
      Value<bool>? finished,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return GamesCompanion(
      id: id ?? this.id,
      gameDateTime: gameDateTime ?? this.gameDateTime,
      teamOneScore: teamOneScore ?? this.teamOneScore,
      teamTwoScore: teamTwoScore ?? this.teamTwoScore,
      gameType: gameType ?? this.gameType,
      gameDirection: gameDirection ?? this.gameDirection,
      currentlyShuffling: currentlyShuffling ?? this.currentlyShuffling,
      winner: winner ?? this.winner,
      finished: finished ?? this.finished,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameDateTime.present) {
      map['game_date_time'] = Variable<DateTime>(gameDateTime.value);
    }
    if (teamOneScore.present) {
      map['team_one_score'] = Variable<int>(teamOneScore.value);
    }
    if (teamTwoScore.present) {
      map['team_two_score'] = Variable<int>(teamTwoScore.value);
    }
    if (gameType.present) {
      map['game_type'] = Variable<int>(gameType.value);
    }
    if (gameDirection.present) {
      map['game_direction'] = Variable<int>(gameDirection.value);
    }
    if (currentlyShuffling.present) {
      map['currently_shuffling'] = Variable<int>(currentlyShuffling.value);
    }
    if (winner.present) {
      map['winner'] = Variable<int>(winner.value);
    }
    if (finished.present) {
      map['finished'] = Variable<bool>(finished.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GamesCompanion(')
          ..write('id: $id, ')
          ..write('gameDateTime: $gameDateTime, ')
          ..write('teamOneScore: $teamOneScore, ')
          ..write('teamTwoScore: $teamTwoScore, ')
          ..write('gameType: $gameType, ')
          ..write('gameDirection: $gameDirection, ')
          ..write('currentlyShuffling: $currentlyShuffling, ')
          ..write('winner: $winner, ')
          ..write('finished: $finished, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RoundsTable extends Rounds with TableInfo<$RoundsTable, Round> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoundsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
      'game_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES games (id)'));
  static const VerificationMeta _teamCalledMeta =
      const VerificationMeta('teamCalled');
  @override
  late final GeneratedColumn<int> teamCalled = GeneratedColumn<int>(
      'team_called', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _teamOneScoreMeta =
      const VerificationMeta('teamOneScore');
  @override
  late final GeneratedColumn<int> teamOneScore = GeneratedColumn<int>(
      'team_one_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _teamTwoScoreMeta =
      const VerificationMeta('teamTwoScore');
  @override
  late final GeneratedColumn<int> teamTwoScore = GeneratedColumn<int>(
      'team_two_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _teamOneCallAmountMeta =
      const VerificationMeta('teamOneCallAmount');
  @override
  late final GeneratedColumn<int> teamOneCallAmount = GeneratedColumn<int>(
      'team_one_call_amount', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _teamTwoCallAmountMeta =
      const VerificationMeta('teamTwoCallAmount');
  @override
  late final GeneratedColumn<int> teamTwoCallAmount = GeneratedColumn<int>(
      'team_two_call_amount', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isTeamOneCallSuccessfulMeta =
      const VerificationMeta('isTeamOneCallSuccessful');
  @override
  late final GeneratedColumn<bool> isTeamOneCallSuccessful =
      GeneratedColumn<bool>('is_team_one_call_successful', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_team_one_call_successful" IN (0, 1))'));
  static const VerificationMeta _isTeamTwoCallSuccessfulMeta =
      const VerificationMeta('isTeamTwoCallSuccessful');
  @override
  late final GeneratedColumn<bool> isTeamTwoCallSuccessful =
      GeneratedColumn<bool>('is_team_two_call_successful', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_team_two_call_successful" IN (0, 1))'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        gameId,
        teamCalled,
        teamOneScore,
        teamTwoScore,
        teamOneCallAmount,
        teamTwoCallAmount,
        isTeamOneCallSuccessful,
        isTeamTwoCallSuccessful,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rounds';
  @override
  VerificationContext validateIntegrity(Insertable<Round> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(_gameIdMeta,
          gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta));
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('team_called')) {
      context.handle(
          _teamCalledMeta,
          teamCalled.isAcceptableOrUnknown(
              data['team_called']!, _teamCalledMeta));
    } else if (isInserting) {
      context.missing(_teamCalledMeta);
    }
    if (data.containsKey('team_one_score')) {
      context.handle(
          _teamOneScoreMeta,
          teamOneScore.isAcceptableOrUnknown(
              data['team_one_score']!, _teamOneScoreMeta));
    }
    if (data.containsKey('team_two_score')) {
      context.handle(
          _teamTwoScoreMeta,
          teamTwoScore.isAcceptableOrUnknown(
              data['team_two_score']!, _teamTwoScoreMeta));
    }
    if (data.containsKey('team_one_call_amount')) {
      context.handle(
          _teamOneCallAmountMeta,
          teamOneCallAmount.isAcceptableOrUnknown(
              data['team_one_call_amount']!, _teamOneCallAmountMeta));
    }
    if (data.containsKey('team_two_call_amount')) {
      context.handle(
          _teamTwoCallAmountMeta,
          teamTwoCallAmount.isAcceptableOrUnknown(
              data['team_two_call_amount']!, _teamTwoCallAmountMeta));
    }
    if (data.containsKey('is_team_one_call_successful')) {
      context.handle(
          _isTeamOneCallSuccessfulMeta,
          isTeamOneCallSuccessful.isAcceptableOrUnknown(
              data['is_team_one_call_successful']!,
              _isTeamOneCallSuccessfulMeta));
    }
    if (data.containsKey('is_team_two_call_successful')) {
      context.handle(
          _isTeamTwoCallSuccessfulMeta,
          isTeamTwoCallSuccessful.isAcceptableOrUnknown(
              data['is_team_two_call_successful']!,
              _isTeamTwoCallSuccessfulMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Round map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Round(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gameId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_id'])!,
      teamCalled: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_called'])!,
      teamOneScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_one_score'])!,
      teamTwoScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_two_score'])!,
      teamOneCallAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}team_one_call_amount']),
      teamTwoCallAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}team_two_call_amount']),
      isTeamOneCallSuccessful: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_team_one_call_successful']),
      isTeamTwoCallSuccessful: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_team_two_call_successful']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $RoundsTable createAlias(String alias) {
    return $RoundsTable(attachedDatabase, alias);
  }
}

class Round extends DataClass implements Insertable<Round> {
  final int id;
  final int gameId;
  final int teamCalled;
  final int teamOneScore;
  final int teamTwoScore;
  final int? teamOneCallAmount;
  final int? teamTwoCallAmount;
  final bool? isTeamOneCallSuccessful;
  final bool? isTeamTwoCallSuccessful;
  final DateTime createdAt;
  const Round(
      {required this.id,
      required this.gameId,
      required this.teamCalled,
      required this.teamOneScore,
      required this.teamTwoScore,
      this.teamOneCallAmount,
      this.teamTwoCallAmount,
      this.isTeamOneCallSuccessful,
      this.isTeamTwoCallSuccessful,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    map['team_called'] = Variable<int>(teamCalled);
    map['team_one_score'] = Variable<int>(teamOneScore);
    map['team_two_score'] = Variable<int>(teamTwoScore);
    if (!nullToAbsent || teamOneCallAmount != null) {
      map['team_one_call_amount'] = Variable<int>(teamOneCallAmount);
    }
    if (!nullToAbsent || teamTwoCallAmount != null) {
      map['team_two_call_amount'] = Variable<int>(teamTwoCallAmount);
    }
    if (!nullToAbsent || isTeamOneCallSuccessful != null) {
      map['is_team_one_call_successful'] =
          Variable<bool>(isTeamOneCallSuccessful);
    }
    if (!nullToAbsent || isTeamTwoCallSuccessful != null) {
      map['is_team_two_call_successful'] =
          Variable<bool>(isTeamTwoCallSuccessful);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RoundsCompanion toCompanion(bool nullToAbsent) {
    return RoundsCompanion(
      id: Value(id),
      gameId: Value(gameId),
      teamCalled: Value(teamCalled),
      teamOneScore: Value(teamOneScore),
      teamTwoScore: Value(teamTwoScore),
      teamOneCallAmount: teamOneCallAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(teamOneCallAmount),
      teamTwoCallAmount: teamTwoCallAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(teamTwoCallAmount),
      isTeamOneCallSuccessful: isTeamOneCallSuccessful == null && nullToAbsent
          ? const Value.absent()
          : Value(isTeamOneCallSuccessful),
      isTeamTwoCallSuccessful: isTeamTwoCallSuccessful == null && nullToAbsent
          ? const Value.absent()
          : Value(isTeamTwoCallSuccessful),
      createdAt: Value(createdAt),
    );
  }

  factory Round.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Round(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      teamCalled: serializer.fromJson<int>(json['teamCalled']),
      teamOneScore: serializer.fromJson<int>(json['teamOneScore']),
      teamTwoScore: serializer.fromJson<int>(json['teamTwoScore']),
      teamOneCallAmount: serializer.fromJson<int?>(json['teamOneCallAmount']),
      teamTwoCallAmount: serializer.fromJson<int?>(json['teamTwoCallAmount']),
      isTeamOneCallSuccessful:
          serializer.fromJson<bool?>(json['isTeamOneCallSuccessful']),
      isTeamTwoCallSuccessful:
          serializer.fromJson<bool?>(json['isTeamTwoCallSuccessful']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'teamCalled': serializer.toJson<int>(teamCalled),
      'teamOneScore': serializer.toJson<int>(teamOneScore),
      'teamTwoScore': serializer.toJson<int>(teamTwoScore),
      'teamOneCallAmount': serializer.toJson<int?>(teamOneCallAmount),
      'teamTwoCallAmount': serializer.toJson<int?>(teamTwoCallAmount),
      'isTeamOneCallSuccessful':
          serializer.toJson<bool?>(isTeamOneCallSuccessful),
      'isTeamTwoCallSuccessful':
          serializer.toJson<bool?>(isTeamTwoCallSuccessful),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Round copyWith(
          {int? id,
          int? gameId,
          int? teamCalled,
          int? teamOneScore,
          int? teamTwoScore,
          Value<int?> teamOneCallAmount = const Value.absent(),
          Value<int?> teamTwoCallAmount = const Value.absent(),
          Value<bool?> isTeamOneCallSuccessful = const Value.absent(),
          Value<bool?> isTeamTwoCallSuccessful = const Value.absent(),
          DateTime? createdAt}) =>
      Round(
        id: id ?? this.id,
        gameId: gameId ?? this.gameId,
        teamCalled: teamCalled ?? this.teamCalled,
        teamOneScore: teamOneScore ?? this.teamOneScore,
        teamTwoScore: teamTwoScore ?? this.teamTwoScore,
        teamOneCallAmount: teamOneCallAmount.present
            ? teamOneCallAmount.value
            : this.teamOneCallAmount,
        teamTwoCallAmount: teamTwoCallAmount.present
            ? teamTwoCallAmount.value
            : this.teamTwoCallAmount,
        isTeamOneCallSuccessful: isTeamOneCallSuccessful.present
            ? isTeamOneCallSuccessful.value
            : this.isTeamOneCallSuccessful,
        isTeamTwoCallSuccessful: isTeamTwoCallSuccessful.present
            ? isTeamTwoCallSuccessful.value
            : this.isTeamTwoCallSuccessful,
        createdAt: createdAt ?? this.createdAt,
      );
  Round copyWithCompanion(RoundsCompanion data) {
    return Round(
      id: data.id.present ? data.id.value : this.id,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      teamCalled:
          data.teamCalled.present ? data.teamCalled.value : this.teamCalled,
      teamOneScore: data.teamOneScore.present
          ? data.teamOneScore.value
          : this.teamOneScore,
      teamTwoScore: data.teamTwoScore.present
          ? data.teamTwoScore.value
          : this.teamTwoScore,
      teamOneCallAmount: data.teamOneCallAmount.present
          ? data.teamOneCallAmount.value
          : this.teamOneCallAmount,
      teamTwoCallAmount: data.teamTwoCallAmount.present
          ? data.teamTwoCallAmount.value
          : this.teamTwoCallAmount,
      isTeamOneCallSuccessful: data.isTeamOneCallSuccessful.present
          ? data.isTeamOneCallSuccessful.value
          : this.isTeamOneCallSuccessful,
      isTeamTwoCallSuccessful: data.isTeamTwoCallSuccessful.present
          ? data.isTeamTwoCallSuccessful.value
          : this.isTeamTwoCallSuccessful,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Round(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('teamCalled: $teamCalled, ')
          ..write('teamOneScore: $teamOneScore, ')
          ..write('teamTwoScore: $teamTwoScore, ')
          ..write('teamOneCallAmount: $teamOneCallAmount, ')
          ..write('teamTwoCallAmount: $teamTwoCallAmount, ')
          ..write('isTeamOneCallSuccessful: $isTeamOneCallSuccessful, ')
          ..write('isTeamTwoCallSuccessful: $isTeamTwoCallSuccessful, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      gameId,
      teamCalled,
      teamOneScore,
      teamTwoScore,
      teamOneCallAmount,
      teamTwoCallAmount,
      isTeamOneCallSuccessful,
      isTeamTwoCallSuccessful,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Round &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.teamCalled == this.teamCalled &&
          other.teamOneScore == this.teamOneScore &&
          other.teamTwoScore == this.teamTwoScore &&
          other.teamOneCallAmount == this.teamOneCallAmount &&
          other.teamTwoCallAmount == this.teamTwoCallAmount &&
          other.isTeamOneCallSuccessful == this.isTeamOneCallSuccessful &&
          other.isTeamTwoCallSuccessful == this.isTeamTwoCallSuccessful &&
          other.createdAt == this.createdAt);
}

class RoundsCompanion extends UpdateCompanion<Round> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<int> teamCalled;
  final Value<int> teamOneScore;
  final Value<int> teamTwoScore;
  final Value<int?> teamOneCallAmount;
  final Value<int?> teamTwoCallAmount;
  final Value<bool?> isTeamOneCallSuccessful;
  final Value<bool?> isTeamTwoCallSuccessful;
  final Value<DateTime> createdAt;
  const RoundsCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.teamCalled = const Value.absent(),
    this.teamOneScore = const Value.absent(),
    this.teamTwoScore = const Value.absent(),
    this.teamOneCallAmount = const Value.absent(),
    this.teamTwoCallAmount = const Value.absent(),
    this.isTeamOneCallSuccessful = const Value.absent(),
    this.isTeamTwoCallSuccessful = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RoundsCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required int teamCalled,
    this.teamOneScore = const Value.absent(),
    this.teamTwoScore = const Value.absent(),
    this.teamOneCallAmount = const Value.absent(),
    this.teamTwoCallAmount = const Value.absent(),
    this.isTeamOneCallSuccessful = const Value.absent(),
    this.isTeamTwoCallSuccessful = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : gameId = Value(gameId),
        teamCalled = Value(teamCalled);
  static Insertable<Round> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<int>? teamCalled,
    Expression<int>? teamOneScore,
    Expression<int>? teamTwoScore,
    Expression<int>? teamOneCallAmount,
    Expression<int>? teamTwoCallAmount,
    Expression<bool>? isTeamOneCallSuccessful,
    Expression<bool>? isTeamTwoCallSuccessful,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (teamCalled != null) 'team_called': teamCalled,
      if (teamOneScore != null) 'team_one_score': teamOneScore,
      if (teamTwoScore != null) 'team_two_score': teamTwoScore,
      if (teamOneCallAmount != null) 'team_one_call_amount': teamOneCallAmount,
      if (teamTwoCallAmount != null) 'team_two_call_amount': teamTwoCallAmount,
      if (isTeamOneCallSuccessful != null)
        'is_team_one_call_successful': isTeamOneCallSuccessful,
      if (isTeamTwoCallSuccessful != null)
        'is_team_two_call_successful': isTeamTwoCallSuccessful,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RoundsCompanion copyWith(
      {Value<int>? id,
      Value<int>? gameId,
      Value<int>? teamCalled,
      Value<int>? teamOneScore,
      Value<int>? teamTwoScore,
      Value<int?>? teamOneCallAmount,
      Value<int?>? teamTwoCallAmount,
      Value<bool?>? isTeamOneCallSuccessful,
      Value<bool?>? isTeamTwoCallSuccessful,
      Value<DateTime>? createdAt}) {
    return RoundsCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      teamCalled: teamCalled ?? this.teamCalled,
      teamOneScore: teamOneScore ?? this.teamOneScore,
      teamTwoScore: teamTwoScore ?? this.teamTwoScore,
      teamOneCallAmount: teamOneCallAmount ?? this.teamOneCallAmount,
      teamTwoCallAmount: teamTwoCallAmount ?? this.teamTwoCallAmount,
      isTeamOneCallSuccessful:
          isTeamOneCallSuccessful ?? this.isTeamOneCallSuccessful,
      isTeamTwoCallSuccessful:
          isTeamTwoCallSuccessful ?? this.isTeamTwoCallSuccessful,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (teamCalled.present) {
      map['team_called'] = Variable<int>(teamCalled.value);
    }
    if (teamOneScore.present) {
      map['team_one_score'] = Variable<int>(teamOneScore.value);
    }
    if (teamTwoScore.present) {
      map['team_two_score'] = Variable<int>(teamTwoScore.value);
    }
    if (teamOneCallAmount.present) {
      map['team_one_call_amount'] = Variable<int>(teamOneCallAmount.value);
    }
    if (teamTwoCallAmount.present) {
      map['team_two_call_amount'] = Variable<int>(teamTwoCallAmount.value);
    }
    if (isTeamOneCallSuccessful.present) {
      map['is_team_one_call_successful'] =
          Variable<bool>(isTeamOneCallSuccessful.value);
    }
    if (isTeamTwoCallSuccessful.present) {
      map['is_team_two_call_successful'] =
          Variable<bool>(isTeamTwoCallSuccessful.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoundsCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('teamCalled: $teamCalled, ')
          ..write('teamOneScore: $teamOneScore, ')
          ..write('teamTwoScore: $teamTwoScore, ')
          ..write('teamOneCallAmount: $teamOneCallAmount, ')
          ..write('teamTwoCallAmount: $teamTwoCallAmount, ')
          ..write('isTeamOneCallSuccessful: $isTeamOneCallSuccessful, ')
          ..write('isTeamTwoCallSuccessful: $isTeamTwoCallSuccessful, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GamesTable games = $GamesTable(this);
  late final $RoundsTable rounds = $RoundsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [games, rounds];
}

typedef $$GamesTableCreateCompanionBuilder = GamesCompanion Function({
  Value<int> id,
  required DateTime gameDateTime,
  Value<int> teamOneScore,
  Value<int> teamTwoScore,
  required int gameType,
  required int gameDirection,
  required int currentlyShuffling,
  Value<int?> winner,
  Value<bool> finished,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$GamesTableUpdateCompanionBuilder = GamesCompanion Function({
  Value<int> id,
  Value<DateTime> gameDateTime,
  Value<int> teamOneScore,
  Value<int> teamTwoScore,
  Value<int> gameType,
  Value<int> gameDirection,
  Value<int> currentlyShuffling,
  Value<int?> winner,
  Value<bool> finished,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$GamesTableReferences
    extends BaseReferences<_$AppDatabase, $GamesTable, Game> {
  $$GamesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoundsTable, List<Round>> _roundsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.rounds,
          aliasName: $_aliasNameGenerator(db.games.id, db.rounds.gameId));

  $$RoundsTableProcessedTableManager get roundsRefs {
    final manager = $$RoundsTableTableManager($_db, $_db.rounds)
        .filter((f) => f.gameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_roundsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GamesTableFilterComposer extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get gameDateTime => $composableBuilder(
      column: $table.gameDateTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamOneScore => $composableBuilder(
      column: $table.teamOneScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamTwoScore => $composableBuilder(
      column: $table.teamTwoScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get gameType => $composableBuilder(
      column: $table.gameType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get gameDirection => $composableBuilder(
      column: $table.gameDirection, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentlyShuffling => $composableBuilder(
      column: $table.currentlyShuffling,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get winner => $composableBuilder(
      column: $table.winner, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get finished => $composableBuilder(
      column: $table.finished, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> roundsRefs(
      Expression<bool> Function($$RoundsTableFilterComposer f) f) {
    final $$RoundsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rounds,
        getReferencedColumn: (t) => t.gameId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoundsTableFilterComposer(
              $db: $db,
              $table: $db.rounds,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GamesTableOrderingComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get gameDateTime => $composableBuilder(
      column: $table.gameDateTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamOneScore => $composableBuilder(
      column: $table.teamOneScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamTwoScore => $composableBuilder(
      column: $table.teamTwoScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get gameType => $composableBuilder(
      column: $table.gameType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get gameDirection => $composableBuilder(
      column: $table.gameDirection,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentlyShuffling => $composableBuilder(
      column: $table.currentlyShuffling,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get winner => $composableBuilder(
      column: $table.winner, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get finished => $composableBuilder(
      column: $table.finished, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$GamesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get gameDateTime => $composableBuilder(
      column: $table.gameDateTime, builder: (column) => column);

  GeneratedColumn<int> get teamOneScore => $composableBuilder(
      column: $table.teamOneScore, builder: (column) => column);

  GeneratedColumn<int> get teamTwoScore => $composableBuilder(
      column: $table.teamTwoScore, builder: (column) => column);

  GeneratedColumn<int> get gameType =>
      $composableBuilder(column: $table.gameType, builder: (column) => column);

  GeneratedColumn<int> get gameDirection => $composableBuilder(
      column: $table.gameDirection, builder: (column) => column);

  GeneratedColumn<int> get currentlyShuffling => $composableBuilder(
      column: $table.currentlyShuffling, builder: (column) => column);

  GeneratedColumn<int> get winner =>
      $composableBuilder(column: $table.winner, builder: (column) => column);

  GeneratedColumn<bool> get finished =>
      $composableBuilder(column: $table.finished, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> roundsRefs<T extends Object>(
      Expression<T> Function($$RoundsTableAnnotationComposer a) f) {
    final $$RoundsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rounds,
        getReferencedColumn: (t) => t.gameId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoundsTableAnnotationComposer(
              $db: $db,
              $table: $db.rounds,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GamesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GamesTable,
    Game,
    $$GamesTableFilterComposer,
    $$GamesTableOrderingComposer,
    $$GamesTableAnnotationComposer,
    $$GamesTableCreateCompanionBuilder,
    $$GamesTableUpdateCompanionBuilder,
    (Game, $$GamesTableReferences),
    Game,
    PrefetchHooks Function({bool roundsRefs})> {
  $$GamesTableTableManager(_$AppDatabase db, $GamesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> gameDateTime = const Value.absent(),
            Value<int> teamOneScore = const Value.absent(),
            Value<int> teamTwoScore = const Value.absent(),
            Value<int> gameType = const Value.absent(),
            Value<int> gameDirection = const Value.absent(),
            Value<int> currentlyShuffling = const Value.absent(),
            Value<int?> winner = const Value.absent(),
            Value<bool> finished = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              GamesCompanion(
            id: id,
            gameDateTime: gameDateTime,
            teamOneScore: teamOneScore,
            teamTwoScore: teamTwoScore,
            gameType: gameType,
            gameDirection: gameDirection,
            currentlyShuffling: currentlyShuffling,
            winner: winner,
            finished: finished,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime gameDateTime,
            Value<int> teamOneScore = const Value.absent(),
            Value<int> teamTwoScore = const Value.absent(),
            required int gameType,
            required int gameDirection,
            required int currentlyShuffling,
            Value<int?> winner = const Value.absent(),
            Value<bool> finished = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              GamesCompanion.insert(
            id: id,
            gameDateTime: gameDateTime,
            teamOneScore: teamOneScore,
            teamTwoScore: teamTwoScore,
            gameType: gameType,
            gameDirection: gameDirection,
            currentlyShuffling: currentlyShuffling,
            winner: winner,
            finished: finished,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GamesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({roundsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (roundsRefs) db.rounds],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roundsRefs)
                    await $_getPrefetchedData<Game, $GamesTable, Round>(
                        currentTable: table,
                        referencedTable:
                            $$GamesTableReferences._roundsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GamesTableReferences(db, table, p0).roundsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.gameId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GamesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GamesTable,
    Game,
    $$GamesTableFilterComposer,
    $$GamesTableOrderingComposer,
    $$GamesTableAnnotationComposer,
    $$GamesTableCreateCompanionBuilder,
    $$GamesTableUpdateCompanionBuilder,
    (Game, $$GamesTableReferences),
    Game,
    PrefetchHooks Function({bool roundsRefs})>;
typedef $$RoundsTableCreateCompanionBuilder = RoundsCompanion Function({
  Value<int> id,
  required int gameId,
  required int teamCalled,
  Value<int> teamOneScore,
  Value<int> teamTwoScore,
  Value<int?> teamOneCallAmount,
  Value<int?> teamTwoCallAmount,
  Value<bool?> isTeamOneCallSuccessful,
  Value<bool?> isTeamTwoCallSuccessful,
  Value<DateTime> createdAt,
});
typedef $$RoundsTableUpdateCompanionBuilder = RoundsCompanion Function({
  Value<int> id,
  Value<int> gameId,
  Value<int> teamCalled,
  Value<int> teamOneScore,
  Value<int> teamTwoScore,
  Value<int?> teamOneCallAmount,
  Value<int?> teamTwoCallAmount,
  Value<bool?> isTeamOneCallSuccessful,
  Value<bool?> isTeamTwoCallSuccessful,
  Value<DateTime> createdAt,
});

final class $$RoundsTableReferences
    extends BaseReferences<_$AppDatabase, $RoundsTable, Round> {
  $$RoundsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GamesTable _gameIdTable(_$AppDatabase db) =>
      db.games.createAlias($_aliasNameGenerator(db.rounds.gameId, db.games.id));

  $$GamesTableProcessedTableManager get gameId {
    final $_column = $_itemColumn<int>('game_id')!;

    final manager = $$GamesTableTableManager($_db, $_db.games)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoundsTableFilterComposer
    extends Composer<_$AppDatabase, $RoundsTable> {
  $$RoundsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamCalled => $composableBuilder(
      column: $table.teamCalled, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamOneScore => $composableBuilder(
      column: $table.teamOneScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamTwoScore => $composableBuilder(
      column: $table.teamTwoScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamOneCallAmount => $composableBuilder(
      column: $table.teamOneCallAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamTwoCallAmount => $composableBuilder(
      column: $table.teamTwoCallAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isTeamOneCallSuccessful => $composableBuilder(
      column: $table.isTeamOneCallSuccessful,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isTeamTwoCallSuccessful => $composableBuilder(
      column: $table.isTeamTwoCallSuccessful,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$GamesTableFilterComposer get gameId {
    final $$GamesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameId,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableFilterComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoundsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoundsTable> {
  $$RoundsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamCalled => $composableBuilder(
      column: $table.teamCalled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamOneScore => $composableBuilder(
      column: $table.teamOneScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamTwoScore => $composableBuilder(
      column: $table.teamTwoScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamOneCallAmount => $composableBuilder(
      column: $table.teamOneCallAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamTwoCallAmount => $composableBuilder(
      column: $table.teamTwoCallAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isTeamOneCallSuccessful => $composableBuilder(
      column: $table.isTeamOneCallSuccessful,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isTeamTwoCallSuccessful => $composableBuilder(
      column: $table.isTeamTwoCallSuccessful,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$GamesTableOrderingComposer get gameId {
    final $$GamesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameId,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableOrderingComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoundsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoundsTable> {
  $$RoundsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get teamCalled => $composableBuilder(
      column: $table.teamCalled, builder: (column) => column);

  GeneratedColumn<int> get teamOneScore => $composableBuilder(
      column: $table.teamOneScore, builder: (column) => column);

  GeneratedColumn<int> get teamTwoScore => $composableBuilder(
      column: $table.teamTwoScore, builder: (column) => column);

  GeneratedColumn<int> get teamOneCallAmount => $composableBuilder(
      column: $table.teamOneCallAmount, builder: (column) => column);

  GeneratedColumn<int> get teamTwoCallAmount => $composableBuilder(
      column: $table.teamTwoCallAmount, builder: (column) => column);

  GeneratedColumn<bool> get isTeamOneCallSuccessful => $composableBuilder(
      column: $table.isTeamOneCallSuccessful, builder: (column) => column);

  GeneratedColumn<bool> get isTeamTwoCallSuccessful => $composableBuilder(
      column: $table.isTeamTwoCallSuccessful, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$GamesTableAnnotationComposer get gameId {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameId,
        referencedTable: $db.games,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GamesTableAnnotationComposer(
              $db: $db,
              $table: $db.games,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoundsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoundsTable,
    Round,
    $$RoundsTableFilterComposer,
    $$RoundsTableOrderingComposer,
    $$RoundsTableAnnotationComposer,
    $$RoundsTableCreateCompanionBuilder,
    $$RoundsTableUpdateCompanionBuilder,
    (Round, $$RoundsTableReferences),
    Round,
    PrefetchHooks Function({bool gameId})> {
  $$RoundsTableTableManager(_$AppDatabase db, $RoundsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoundsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoundsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoundsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> gameId = const Value.absent(),
            Value<int> teamCalled = const Value.absent(),
            Value<int> teamOneScore = const Value.absent(),
            Value<int> teamTwoScore = const Value.absent(),
            Value<int?> teamOneCallAmount = const Value.absent(),
            Value<int?> teamTwoCallAmount = const Value.absent(),
            Value<bool?> isTeamOneCallSuccessful = const Value.absent(),
            Value<bool?> isTeamTwoCallSuccessful = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              RoundsCompanion(
            id: id,
            gameId: gameId,
            teamCalled: teamCalled,
            teamOneScore: teamOneScore,
            teamTwoScore: teamTwoScore,
            teamOneCallAmount: teamOneCallAmount,
            teamTwoCallAmount: teamTwoCallAmount,
            isTeamOneCallSuccessful: isTeamOneCallSuccessful,
            isTeamTwoCallSuccessful: isTeamTwoCallSuccessful,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int gameId,
            required int teamCalled,
            Value<int> teamOneScore = const Value.absent(),
            Value<int> teamTwoScore = const Value.absent(),
            Value<int?> teamOneCallAmount = const Value.absent(),
            Value<int?> teamTwoCallAmount = const Value.absent(),
            Value<bool?> isTeamOneCallSuccessful = const Value.absent(),
            Value<bool?> isTeamTwoCallSuccessful = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              RoundsCompanion.insert(
            id: id,
            gameId: gameId,
            teamCalled: teamCalled,
            teamOneScore: teamOneScore,
            teamTwoScore: teamTwoScore,
            teamOneCallAmount: teamOneCallAmount,
            teamTwoCallAmount: teamTwoCallAmount,
            isTeamOneCallSuccessful: isTeamOneCallSuccessful,
            isTeamTwoCallSuccessful: isTeamTwoCallSuccessful,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RoundsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({gameId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (gameId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gameId,
                    referencedTable: $$RoundsTableReferences._gameIdTable(db),
                    referencedColumn:
                        $$RoundsTableReferences._gameIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RoundsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoundsTable,
    Round,
    $$RoundsTableFilterComposer,
    $$RoundsTableOrderingComposer,
    $$RoundsTableAnnotationComposer,
    $$RoundsTableCreateCompanionBuilder,
    $$RoundsTableUpdateCompanionBuilder,
    (Round, $$RoundsTableReferences),
    Round,
    PrefetchHooks Function({bool gameId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GamesTableTableManager get games =>
      $$GamesTableTableManager(_db, _db.games);
  $$RoundsTableTableManager get rounds =>
      $$RoundsTableTableManager(_db, _db.rounds);
}
