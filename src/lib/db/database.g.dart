// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GameTableTable extends GameTable
    with TableInfo<$GameTableTable, GameTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
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
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _teamOneScoreMeta =
      const VerificationMeta('teamOneScore');
  @override
  late final GeneratedColumn<int> teamOneScore = GeneratedColumn<int>(
      'team_one_score', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _teamTwoScoreMeta =
      const VerificationMeta('teamTwoScore');
  @override
  late final GeneratedColumn<int> teamTwoScore = GeneratedColumn<int>(
      'team_two_score', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _gameTypeMeta =
      const VerificationMeta('gameType');
  @override
  late final GeneratedColumn<int> gameType = GeneratedColumn<int>(
      'game_type', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _gameDirectionMeta =
      const VerificationMeta('gameDirection');
  @override
  late final GeneratedColumn<int> gameDirection = GeneratedColumn<int>(
      'game_direction', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _currentlyShufflingMeta =
      const VerificationMeta('currentlyShuffling');
  @override
  late final GeneratedColumn<int> currentlyShuffling = GeneratedColumn<int>(
      'currently_shuffling', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _winnerMeta = const VerificationMeta('winner');
  @override
  late final GeneratedColumn<int> winner = GeneratedColumn<int>(
      'winner', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _finishedMeta =
      const VerificationMeta('finished');
  @override
  late final GeneratedColumn<bool> finished = GeneratedColumn<bool>(
      'finished', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("finished" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        deletedAt,
        teamOneScore,
        teamTwoScore,
        gameType,
        gameDirection,
        currentlyShuffling,
        winner,
        finished
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'games';
  @override
  VerificationContext validateIntegrity(Insertable<GameTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
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
    }
    if (data.containsKey('game_direction')) {
      context.handle(
          _gameDirectionMeta,
          gameDirection.isAcceptableOrUnknown(
              data['game_direction']!, _gameDirectionMeta));
    }
    if (data.containsKey('currently_shuffling')) {
      context.handle(
          _currentlyShufflingMeta,
          currentlyShuffling.isAcceptableOrUnknown(
              data['currently_shuffling']!, _currentlyShufflingMeta));
    }
    if (data.containsKey('winner')) {
      context.handle(_winnerMeta,
          winner.isAcceptableOrUnknown(data['winner']!, _winnerMeta));
    }
    if (data.containsKey('finished')) {
      context.handle(_finishedMeta,
          finished.isAcceptableOrUnknown(data['finished']!, _finishedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      teamOneScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_one_score']),
      teamTwoScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_two_score']),
      gameType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_type']),
      gameDirection: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_direction']),
      currentlyShuffling: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}currently_shuffling']),
      winner: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}winner']),
      finished: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}finished']),
    );
  }

  @override
  $GameTableTable createAlias(String alias) {
    return $GameTableTable(attachedDatabase, alias);
  }
}

class GameTableData extends DataClass implements Insertable<GameTableData> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int? teamOneScore;
  final int? teamTwoScore;
  final int? gameType;
  final int? gameDirection;
  final int? currentlyShuffling;
  final int? winner;
  final bool? finished;
  const GameTableData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      this.teamOneScore,
      this.teamTwoScore,
      this.gameType,
      this.gameDirection,
      this.currentlyShuffling,
      this.winner,
      this.finished});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || teamOneScore != null) {
      map['team_one_score'] = Variable<int>(teamOneScore);
    }
    if (!nullToAbsent || teamTwoScore != null) {
      map['team_two_score'] = Variable<int>(teamTwoScore);
    }
    if (!nullToAbsent || gameType != null) {
      map['game_type'] = Variable<int>(gameType);
    }
    if (!nullToAbsent || gameDirection != null) {
      map['game_direction'] = Variable<int>(gameDirection);
    }
    if (!nullToAbsent || currentlyShuffling != null) {
      map['currently_shuffling'] = Variable<int>(currentlyShuffling);
    }
    if (!nullToAbsent || winner != null) {
      map['winner'] = Variable<int>(winner);
    }
    if (!nullToAbsent || finished != null) {
      map['finished'] = Variable<bool>(finished);
    }
    return map;
  }

  GameTableCompanion toCompanion(bool nullToAbsent) {
    return GameTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      teamOneScore: teamOneScore == null && nullToAbsent
          ? const Value.absent()
          : Value(teamOneScore),
      teamTwoScore: teamTwoScore == null && nullToAbsent
          ? const Value.absent()
          : Value(teamTwoScore),
      gameType: gameType == null && nullToAbsent
          ? const Value.absent()
          : Value(gameType),
      gameDirection: gameDirection == null && nullToAbsent
          ? const Value.absent()
          : Value(gameDirection),
      currentlyShuffling: currentlyShuffling == null && nullToAbsent
          ? const Value.absent()
          : Value(currentlyShuffling),
      winner:
          winner == null && nullToAbsent ? const Value.absent() : Value(winner),
      finished: finished == null && nullToAbsent
          ? const Value.absent()
          : Value(finished),
    );
  }

  factory GameTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameTableData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      teamOneScore: serializer.fromJson<int?>(json['teamOneScore']),
      teamTwoScore: serializer.fromJson<int?>(json['teamTwoScore']),
      gameType: serializer.fromJson<int?>(json['gameType']),
      gameDirection: serializer.fromJson<int?>(json['gameDirection']),
      currentlyShuffling: serializer.fromJson<int?>(json['currentlyShuffling']),
      winner: serializer.fromJson<int?>(json['winner']),
      finished: serializer.fromJson<bool?>(json['finished']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'teamOneScore': serializer.toJson<int?>(teamOneScore),
      'teamTwoScore': serializer.toJson<int?>(teamTwoScore),
      'gameType': serializer.toJson<int?>(gameType),
      'gameDirection': serializer.toJson<int?>(gameDirection),
      'currentlyShuffling': serializer.toJson<int?>(currentlyShuffling),
      'winner': serializer.toJson<int?>(winner),
      'finished': serializer.toJson<bool?>(finished),
    };
  }

  GameTableData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          Value<int?> teamOneScore = const Value.absent(),
          Value<int?> teamTwoScore = const Value.absent(),
          Value<int?> gameType = const Value.absent(),
          Value<int?> gameDirection = const Value.absent(),
          Value<int?> currentlyShuffling = const Value.absent(),
          Value<int?> winner = const Value.absent(),
          Value<bool?> finished = const Value.absent()}) =>
      GameTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        teamOneScore:
            teamOneScore.present ? teamOneScore.value : this.teamOneScore,
        teamTwoScore:
            teamTwoScore.present ? teamTwoScore.value : this.teamTwoScore,
        gameType: gameType.present ? gameType.value : this.gameType,
        gameDirection:
            gameDirection.present ? gameDirection.value : this.gameDirection,
        currentlyShuffling: currentlyShuffling.present
            ? currentlyShuffling.value
            : this.currentlyShuffling,
        winner: winner.present ? winner.value : this.winner,
        finished: finished.present ? finished.value : this.finished,
      );
  GameTableData copyWithCompanion(GameTableCompanion data) {
    return GameTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
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
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('teamOneScore: $teamOneScore, ')
          ..write('teamTwoScore: $teamTwoScore, ')
          ..write('gameType: $gameType, ')
          ..write('gameDirection: $gameDirection, ')
          ..write('currentlyShuffling: $currentlyShuffling, ')
          ..write('winner: $winner, ')
          ..write('finished: $finished')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      deletedAt,
      teamOneScore,
      teamTwoScore,
      gameType,
      gameDirection,
      currentlyShuffling,
      winner,
      finished);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.teamOneScore == this.teamOneScore &&
          other.teamTwoScore == this.teamTwoScore &&
          other.gameType == this.gameType &&
          other.gameDirection == this.gameDirection &&
          other.currentlyShuffling == this.currentlyShuffling &&
          other.winner == this.winner &&
          other.finished == this.finished);
}

class GameTableCompanion extends UpdateCompanion<GameTableData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int?> teamOneScore;
  final Value<int?> teamTwoScore;
  final Value<int?> gameType;
  final Value<int?> gameDirection;
  final Value<int?> currentlyShuffling;
  final Value<int?> winner;
  final Value<bool?> finished;
  final Value<int> rowid;
  const GameTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.teamOneScore = const Value.absent(),
    this.teamTwoScore = const Value.absent(),
    this.gameType = const Value.absent(),
    this.gameDirection = const Value.absent(),
    this.currentlyShuffling = const Value.absent(),
    this.winner = const Value.absent(),
    this.finished = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GameTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.teamOneScore = const Value.absent(),
    this.teamTwoScore = const Value.absent(),
    this.gameType = const Value.absent(),
    this.gameDirection = const Value.absent(),
    this.currentlyShuffling = const Value.absent(),
    this.winner = const Value.absent(),
    this.finished = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<GameTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? teamOneScore,
    Expression<int>? teamTwoScore,
    Expression<int>? gameType,
    Expression<int>? gameDirection,
    Expression<int>? currentlyShuffling,
    Expression<int>? winner,
    Expression<bool>? finished,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (teamOneScore != null) 'team_one_score': teamOneScore,
      if (teamTwoScore != null) 'team_two_score': teamTwoScore,
      if (gameType != null) 'game_type': gameType,
      if (gameDirection != null) 'game_direction': gameDirection,
      if (currentlyShuffling != null) 'currently_shuffling': currentlyShuffling,
      if (winner != null) 'winner': winner,
      if (finished != null) 'finished': finished,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GameTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int?>? teamOneScore,
      Value<int?>? teamTwoScore,
      Value<int?>? gameType,
      Value<int?>? gameDirection,
      Value<int?>? currentlyShuffling,
      Value<int?>? winner,
      Value<bool?>? finished,
      Value<int>? rowid}) {
    return GameTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      teamOneScore: teamOneScore ?? this.teamOneScore,
      teamTwoScore: teamTwoScore ?? this.teamTwoScore,
      gameType: gameType ?? this.gameType,
      gameDirection: gameDirection ?? this.gameDirection,
      currentlyShuffling: currentlyShuffling ?? this.currentlyShuffling,
      winner: winner ?? this.winner,
      finished: finished ?? this.finished,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('teamOneScore: $teamOneScore, ')
          ..write('teamTwoScore: $teamTwoScore, ')
          ..write('gameType: $gameType, ')
          ..write('gameDirection: $gameDirection, ')
          ..write('currentlyShuffling: $currentlyShuffling, ')
          ..write('winner: $winner, ')
          ..write('finished: $finished, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoundTableTable extends RoundTable
    with TableInfo<$RoundTableTable, RoundTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoundTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
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
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<String> gameId = GeneratedColumn<String>(
      'game_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES games (id)'));
  static const VerificationMeta _teamCalledMeta =
      const VerificationMeta('teamCalled');
  @override
  late final GeneratedColumn<int> teamCalled = GeneratedColumn<int>(
      'team_called', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _teamOneScoreMeta =
      const VerificationMeta('teamOneScore');
  @override
  late final GeneratedColumn<int> teamOneScore = GeneratedColumn<int>(
      'team_one_score', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _teamTwoScoreMeta =
      const VerificationMeta('teamTwoScore');
  @override
  late final GeneratedColumn<int> teamTwoScore = GeneratedColumn<int>(
      'team_two_score', aliasedName, true,
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
  static const VerificationMeta _teamFailedMeta =
      const VerificationMeta('teamFailed');
  @override
  late final GeneratedColumn<bool> teamFailed = GeneratedColumn<bool>(
      'team_failed', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("team_failed" IN (0, 1))'));
  static const VerificationMeta _calculatorResultMeta =
      const VerificationMeta('calculatorResult');
  @override
  late final GeneratedColumn<String> calculatorResult = GeneratedColumn<String>(
      'calculator_result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        deletedAt,
        gameId,
        teamCalled,
        teamOneScore,
        teamTwoScore,
        teamOneCallAmount,
        teamTwoCallAmount,
        isTeamOneCallSuccessful,
        isTeamTwoCallSuccessful,
        teamFailed,
        calculatorResult
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rounds';
  @override
  VerificationContext validateIntegrity(Insertable<RoundTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
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
    if (data.containsKey('team_failed')) {
      context.handle(
          _teamFailedMeta,
          teamFailed.isAcceptableOrUnknown(
              data['team_failed']!, _teamFailedMeta));
    }
    if (data.containsKey('calculator_result')) {
      context.handle(
          _calculatorResultMeta,
          calculatorResult.isAcceptableOrUnknown(
              data['calculator_result']!, _calculatorResultMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoundTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoundTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      gameId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}game_id'])!,
      teamCalled: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_called']),
      teamOneScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_one_score']),
      teamTwoScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_two_score']),
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
      teamFailed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}team_failed']),
      calculatorResult: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}calculator_result']),
    );
  }

  @override
  $RoundTableTable createAlias(String alias) {
    return $RoundTableTable(attachedDatabase, alias);
  }
}

class RoundTableData extends DataClass implements Insertable<RoundTableData> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String gameId;
  final int? teamCalled;
  final int? teamOneScore;
  final int? teamTwoScore;
  final int? teamOneCallAmount;
  final int? teamTwoCallAmount;
  final bool? isTeamOneCallSuccessful;
  final bool? isTeamTwoCallSuccessful;
  final bool? teamFailed;
  final String? calculatorResult;
  const RoundTableData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.gameId,
      this.teamCalled,
      this.teamOneScore,
      this.teamTwoScore,
      this.teamOneCallAmount,
      this.teamTwoCallAmount,
      this.isTeamOneCallSuccessful,
      this.isTeamTwoCallSuccessful,
      this.teamFailed,
      this.calculatorResult});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['game_id'] = Variable<String>(gameId);
    if (!nullToAbsent || teamCalled != null) {
      map['team_called'] = Variable<int>(teamCalled);
    }
    if (!nullToAbsent || teamOneScore != null) {
      map['team_one_score'] = Variable<int>(teamOneScore);
    }
    if (!nullToAbsent || teamTwoScore != null) {
      map['team_two_score'] = Variable<int>(teamTwoScore);
    }
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
    if (!nullToAbsent || teamFailed != null) {
      map['team_failed'] = Variable<bool>(teamFailed);
    }
    if (!nullToAbsent || calculatorResult != null) {
      map['calculator_result'] = Variable<String>(calculatorResult);
    }
    return map;
  }

  RoundTableCompanion toCompanion(bool nullToAbsent) {
    return RoundTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      gameId: Value(gameId),
      teamCalled: teamCalled == null && nullToAbsent
          ? const Value.absent()
          : Value(teamCalled),
      teamOneScore: teamOneScore == null && nullToAbsent
          ? const Value.absent()
          : Value(teamOneScore),
      teamTwoScore: teamTwoScore == null && nullToAbsent
          ? const Value.absent()
          : Value(teamTwoScore),
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
      teamFailed: teamFailed == null && nullToAbsent
          ? const Value.absent()
          : Value(teamFailed),
      calculatorResult: calculatorResult == null && nullToAbsent
          ? const Value.absent()
          : Value(calculatorResult),
    );
  }

  factory RoundTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoundTableData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      gameId: serializer.fromJson<String>(json['gameId']),
      teamCalled: serializer.fromJson<int?>(json['teamCalled']),
      teamOneScore: serializer.fromJson<int?>(json['teamOneScore']),
      teamTwoScore: serializer.fromJson<int?>(json['teamTwoScore']),
      teamOneCallAmount: serializer.fromJson<int?>(json['teamOneCallAmount']),
      teamTwoCallAmount: serializer.fromJson<int?>(json['teamTwoCallAmount']),
      isTeamOneCallSuccessful:
          serializer.fromJson<bool?>(json['isTeamOneCallSuccessful']),
      isTeamTwoCallSuccessful:
          serializer.fromJson<bool?>(json['isTeamTwoCallSuccessful']),
      teamFailed: serializer.fromJson<bool?>(json['teamFailed']),
      calculatorResult: serializer.fromJson<String?>(json['calculatorResult']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'gameId': serializer.toJson<String>(gameId),
      'teamCalled': serializer.toJson<int?>(teamCalled),
      'teamOneScore': serializer.toJson<int?>(teamOneScore),
      'teamTwoScore': serializer.toJson<int?>(teamTwoScore),
      'teamOneCallAmount': serializer.toJson<int?>(teamOneCallAmount),
      'teamTwoCallAmount': serializer.toJson<int?>(teamTwoCallAmount),
      'isTeamOneCallSuccessful':
          serializer.toJson<bool?>(isTeamOneCallSuccessful),
      'isTeamTwoCallSuccessful':
          serializer.toJson<bool?>(isTeamTwoCallSuccessful),
      'teamFailed': serializer.toJson<bool?>(teamFailed),
      'calculatorResult': serializer.toJson<String?>(calculatorResult),
    };
  }

  RoundTableData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? gameId,
          Value<int?> teamCalled = const Value.absent(),
          Value<int?> teamOneScore = const Value.absent(),
          Value<int?> teamTwoScore = const Value.absent(),
          Value<int?> teamOneCallAmount = const Value.absent(),
          Value<int?> teamTwoCallAmount = const Value.absent(),
          Value<bool?> isTeamOneCallSuccessful = const Value.absent(),
          Value<bool?> isTeamTwoCallSuccessful = const Value.absent(),
          Value<bool?> teamFailed = const Value.absent(),
          Value<String?> calculatorResult = const Value.absent()}) =>
      RoundTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        gameId: gameId ?? this.gameId,
        teamCalled: teamCalled.present ? teamCalled.value : this.teamCalled,
        teamOneScore:
            teamOneScore.present ? teamOneScore.value : this.teamOneScore,
        teamTwoScore:
            teamTwoScore.present ? teamTwoScore.value : this.teamTwoScore,
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
        teamFailed: teamFailed.present ? teamFailed.value : this.teamFailed,
        calculatorResult: calculatorResult.present
            ? calculatorResult.value
            : this.calculatorResult,
      );
  RoundTableData copyWithCompanion(RoundTableCompanion data) {
    return RoundTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
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
      teamFailed:
          data.teamFailed.present ? data.teamFailed.value : this.teamFailed,
      calculatorResult: data.calculatorResult.present
          ? data.calculatorResult.value
          : this.calculatorResult,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoundTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('gameId: $gameId, ')
          ..write('teamCalled: $teamCalled, ')
          ..write('teamOneScore: $teamOneScore, ')
          ..write('teamTwoScore: $teamTwoScore, ')
          ..write('teamOneCallAmount: $teamOneCallAmount, ')
          ..write('teamTwoCallAmount: $teamTwoCallAmount, ')
          ..write('isTeamOneCallSuccessful: $isTeamOneCallSuccessful, ')
          ..write('isTeamTwoCallSuccessful: $isTeamTwoCallSuccessful, ')
          ..write('teamFailed: $teamFailed, ')
          ..write('calculatorResult: $calculatorResult')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      deletedAt,
      gameId,
      teamCalled,
      teamOneScore,
      teamTwoScore,
      teamOneCallAmount,
      teamTwoCallAmount,
      isTeamOneCallSuccessful,
      isTeamTwoCallSuccessful,
      teamFailed,
      calculatorResult);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoundTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.gameId == this.gameId &&
          other.teamCalled == this.teamCalled &&
          other.teamOneScore == this.teamOneScore &&
          other.teamTwoScore == this.teamTwoScore &&
          other.teamOneCallAmount == this.teamOneCallAmount &&
          other.teamTwoCallAmount == this.teamTwoCallAmount &&
          other.isTeamOneCallSuccessful == this.isTeamOneCallSuccessful &&
          other.isTeamTwoCallSuccessful == this.isTeamTwoCallSuccessful &&
          other.teamFailed == this.teamFailed &&
          other.calculatorResult == this.calculatorResult);
}

class RoundTableCompanion extends UpdateCompanion<RoundTableData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> gameId;
  final Value<int?> teamCalled;
  final Value<int?> teamOneScore;
  final Value<int?> teamTwoScore;
  final Value<int?> teamOneCallAmount;
  final Value<int?> teamTwoCallAmount;
  final Value<bool?> isTeamOneCallSuccessful;
  final Value<bool?> isTeamTwoCallSuccessful;
  final Value<bool?> teamFailed;
  final Value<String?> calculatorResult;
  final Value<int> rowid;
  const RoundTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.gameId = const Value.absent(),
    this.teamCalled = const Value.absent(),
    this.teamOneScore = const Value.absent(),
    this.teamTwoScore = const Value.absent(),
    this.teamOneCallAmount = const Value.absent(),
    this.teamTwoCallAmount = const Value.absent(),
    this.isTeamOneCallSuccessful = const Value.absent(),
    this.isTeamTwoCallSuccessful = const Value.absent(),
    this.teamFailed = const Value.absent(),
    this.calculatorResult = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoundTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String gameId,
    this.teamCalled = const Value.absent(),
    this.teamOneScore = const Value.absent(),
    this.teamTwoScore = const Value.absent(),
    this.teamOneCallAmount = const Value.absent(),
    this.teamTwoCallAmount = const Value.absent(),
    this.isTeamOneCallSuccessful = const Value.absent(),
    this.isTeamTwoCallSuccessful = const Value.absent(),
    this.teamFailed = const Value.absent(),
    this.calculatorResult = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : gameId = Value(gameId);
  static Insertable<RoundTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? gameId,
    Expression<int>? teamCalled,
    Expression<int>? teamOneScore,
    Expression<int>? teamTwoScore,
    Expression<int>? teamOneCallAmount,
    Expression<int>? teamTwoCallAmount,
    Expression<bool>? isTeamOneCallSuccessful,
    Expression<bool>? isTeamTwoCallSuccessful,
    Expression<bool>? teamFailed,
    Expression<String>? calculatorResult,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
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
      if (teamFailed != null) 'team_failed': teamFailed,
      if (calculatorResult != null) 'calculator_result': calculatorResult,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoundTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<String>? gameId,
      Value<int?>? teamCalled,
      Value<int?>? teamOneScore,
      Value<int?>? teamTwoScore,
      Value<int?>? teamOneCallAmount,
      Value<int?>? teamTwoCallAmount,
      Value<bool?>? isTeamOneCallSuccessful,
      Value<bool?>? isTeamTwoCallSuccessful,
      Value<bool?>? teamFailed,
      Value<String?>? calculatorResult,
      Value<int>? rowid}) {
    return RoundTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
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
      teamFailed: teamFailed ?? this.teamFailed,
      calculatorResult: calculatorResult ?? this.calculatorResult,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<String>(gameId.value);
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
    if (teamFailed.present) {
      map['team_failed'] = Variable<bool>(teamFailed.value);
    }
    if (calculatorResult.present) {
      map['calculator_result'] = Variable<String>(calculatorResult.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoundTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('gameId: $gameId, ')
          ..write('teamCalled: $teamCalled, ')
          ..write('teamOneScore: $teamOneScore, ')
          ..write('teamTwoScore: $teamTwoScore, ')
          ..write('teamOneCallAmount: $teamOneCallAmount, ')
          ..write('teamTwoCallAmount: $teamTwoCallAmount, ')
          ..write('isTeamOneCallSuccessful: $isTeamOneCallSuccessful, ')
          ..write('isTeamTwoCallSuccessful: $isTeamTwoCallSuccessful, ')
          ..write('teamFailed: $teamFailed, ')
          ..write('calculatorResult: $calculatorResult, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GameTableTable gameTable = $GameTableTable(this);
  late final $RoundTableTable roundTable = $RoundTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gameTable, roundTable];
}

typedef $$GameTableTableCreateCompanionBuilder = GameTableCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int?> teamOneScore,
  Value<int?> teamTwoScore,
  Value<int?> gameType,
  Value<int?> gameDirection,
  Value<int?> currentlyShuffling,
  Value<int?> winner,
  Value<bool?> finished,
  Value<int> rowid,
});
typedef $$GameTableTableUpdateCompanionBuilder = GameTableCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int?> teamOneScore,
  Value<int?> teamTwoScore,
  Value<int?> gameType,
  Value<int?> gameDirection,
  Value<int?> currentlyShuffling,
  Value<int?> winner,
  Value<bool?> finished,
  Value<int> rowid,
});

final class $$GameTableTableReferences
    extends BaseReferences<_$AppDatabase, $GameTableTable, GameTableData> {
  $$GameTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoundTableTable, List<RoundTableData>>
      _roundTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roundTable,
              aliasName:
                  $_aliasNameGenerator(db.gameTable.id, db.roundTable.gameId));

  $$RoundTableTableProcessedTableManager get roundTableRefs {
    final manager = $$RoundTableTableTableManager($_db, $_db.roundTable)
        .filter((f) => f.gameId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_roundTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GameTableTableFilterComposer
    extends Composer<_$AppDatabase, $GameTableTable> {
  $$GameTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

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

  Expression<bool> roundTableRefs(
      Expression<bool> Function($$RoundTableTableFilterComposer f) f) {
    final $$RoundTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roundTable,
        getReferencedColumn: (t) => t.gameId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoundTableTableFilterComposer(
              $db: $db,
              $table: $db.roundTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GameTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GameTableTable> {
  $$GameTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

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
}

class $$GameTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameTableTable> {
  $$GameTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

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

  Expression<T> roundTableRefs<T extends Object>(
      Expression<T> Function($$RoundTableTableAnnotationComposer a) f) {
    final $$RoundTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roundTable,
        getReferencedColumn: (t) => t.gameId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoundTableTableAnnotationComposer(
              $db: $db,
              $table: $db.roundTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GameTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GameTableTable,
    GameTableData,
    $$GameTableTableFilterComposer,
    $$GameTableTableOrderingComposer,
    $$GameTableTableAnnotationComposer,
    $$GameTableTableCreateCompanionBuilder,
    $$GameTableTableUpdateCompanionBuilder,
    (GameTableData, $$GameTableTableReferences),
    GameTableData,
    PrefetchHooks Function({bool roundTableRefs})> {
  $$GameTableTableTableManager(_$AppDatabase db, $GameTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int?> teamOneScore = const Value.absent(),
            Value<int?> teamTwoScore = const Value.absent(),
            Value<int?> gameType = const Value.absent(),
            Value<int?> gameDirection = const Value.absent(),
            Value<int?> currentlyShuffling = const Value.absent(),
            Value<int?> winner = const Value.absent(),
            Value<bool?> finished = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GameTableCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            teamOneScore: teamOneScore,
            teamTwoScore: teamTwoScore,
            gameType: gameType,
            gameDirection: gameDirection,
            currentlyShuffling: currentlyShuffling,
            winner: winner,
            finished: finished,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int?> teamOneScore = const Value.absent(),
            Value<int?> teamTwoScore = const Value.absent(),
            Value<int?> gameType = const Value.absent(),
            Value<int?> gameDirection = const Value.absent(),
            Value<int?> currentlyShuffling = const Value.absent(),
            Value<int?> winner = const Value.absent(),
            Value<bool?> finished = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GameTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            teamOneScore: teamOneScore,
            teamTwoScore: teamTwoScore,
            gameType: gameType,
            gameDirection: gameDirection,
            currentlyShuffling: currentlyShuffling,
            winner: winner,
            finished: finished,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GameTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({roundTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (roundTableRefs) db.roundTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roundTableRefs)
                    await $_getPrefetchedData<GameTableData, $GameTableTable,
                            RoundTableData>(
                        currentTable: table,
                        referencedTable:
                            $$GameTableTableReferences._roundTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GameTableTableReferences(db, table, p0)
                                .roundTableRefs,
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

typedef $$GameTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GameTableTable,
    GameTableData,
    $$GameTableTableFilterComposer,
    $$GameTableTableOrderingComposer,
    $$GameTableTableAnnotationComposer,
    $$GameTableTableCreateCompanionBuilder,
    $$GameTableTableUpdateCompanionBuilder,
    (GameTableData, $$GameTableTableReferences),
    GameTableData,
    PrefetchHooks Function({bool roundTableRefs})>;
typedef $$RoundTableTableCreateCompanionBuilder = RoundTableCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  required String gameId,
  Value<int?> teamCalled,
  Value<int?> teamOneScore,
  Value<int?> teamTwoScore,
  Value<int?> teamOneCallAmount,
  Value<int?> teamTwoCallAmount,
  Value<bool?> isTeamOneCallSuccessful,
  Value<bool?> isTeamTwoCallSuccessful,
  Value<bool?> teamFailed,
  Value<String?> calculatorResult,
  Value<int> rowid,
});
typedef $$RoundTableTableUpdateCompanionBuilder = RoundTableCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> gameId,
  Value<int?> teamCalled,
  Value<int?> teamOneScore,
  Value<int?> teamTwoScore,
  Value<int?> teamOneCallAmount,
  Value<int?> teamTwoCallAmount,
  Value<bool?> isTeamOneCallSuccessful,
  Value<bool?> isTeamTwoCallSuccessful,
  Value<bool?> teamFailed,
  Value<String?> calculatorResult,
  Value<int> rowid,
});

final class $$RoundTableTableReferences
    extends BaseReferences<_$AppDatabase, $RoundTableTable, RoundTableData> {
  $$RoundTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GameTableTable _gameIdTable(_$AppDatabase db) => db.gameTable
      .createAlias($_aliasNameGenerator(db.roundTable.gameId, db.gameTable.id));

  $$GameTableTableProcessedTableManager get gameId {
    final $_column = $_itemColumn<String>('game_id')!;

    final manager = $$GameTableTableTableManager($_db, $_db.gameTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoundTableTableFilterComposer
    extends Composer<_$AppDatabase, $RoundTableTable> {
  $$RoundTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

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

  ColumnFilters<bool> get teamFailed => $composableBuilder(
      column: $table.teamFailed, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get calculatorResult => $composableBuilder(
      column: $table.calculatorResult,
      builder: (column) => ColumnFilters(column));

  $$GameTableTableFilterComposer get gameId {
    final $$GameTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameId,
        referencedTable: $db.gameTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameTableTableFilterComposer(
              $db: $db,
              $table: $db.gameTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoundTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RoundTableTable> {
  $$RoundTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<bool> get teamFailed => $composableBuilder(
      column: $table.teamFailed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get calculatorResult => $composableBuilder(
      column: $table.calculatorResult,
      builder: (column) => ColumnOrderings(column));

  $$GameTableTableOrderingComposer get gameId {
    final $$GameTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameId,
        referencedTable: $db.gameTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameTableTableOrderingComposer(
              $db: $db,
              $table: $db.gameTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoundTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoundTableTable> {
  $$RoundTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

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

  GeneratedColumn<bool> get teamFailed => $composableBuilder(
      column: $table.teamFailed, builder: (column) => column);

  GeneratedColumn<String> get calculatorResult => $composableBuilder(
      column: $table.calculatorResult, builder: (column) => column);

  $$GameTableTableAnnotationComposer get gameId {
    final $$GameTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameId,
        referencedTable: $db.gameTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameTableTableAnnotationComposer(
              $db: $db,
              $table: $db.gameTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoundTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoundTableTable,
    RoundTableData,
    $$RoundTableTableFilterComposer,
    $$RoundTableTableOrderingComposer,
    $$RoundTableTableAnnotationComposer,
    $$RoundTableTableCreateCompanionBuilder,
    $$RoundTableTableUpdateCompanionBuilder,
    (RoundTableData, $$RoundTableTableReferences),
    RoundTableData,
    PrefetchHooks Function({bool gameId})> {
  $$RoundTableTableTableManager(_$AppDatabase db, $RoundTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoundTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoundTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoundTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> gameId = const Value.absent(),
            Value<int?> teamCalled = const Value.absent(),
            Value<int?> teamOneScore = const Value.absent(),
            Value<int?> teamTwoScore = const Value.absent(),
            Value<int?> teamOneCallAmount = const Value.absent(),
            Value<int?> teamTwoCallAmount = const Value.absent(),
            Value<bool?> isTeamOneCallSuccessful = const Value.absent(),
            Value<bool?> isTeamTwoCallSuccessful = const Value.absent(),
            Value<bool?> teamFailed = const Value.absent(),
            Value<String?> calculatorResult = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RoundTableCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            gameId: gameId,
            teamCalled: teamCalled,
            teamOneScore: teamOneScore,
            teamTwoScore: teamTwoScore,
            teamOneCallAmount: teamOneCallAmount,
            teamTwoCallAmount: teamTwoCallAmount,
            isTeamOneCallSuccessful: isTeamOneCallSuccessful,
            isTeamTwoCallSuccessful: isTeamTwoCallSuccessful,
            teamFailed: teamFailed,
            calculatorResult: calculatorResult,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required String gameId,
            Value<int?> teamCalled = const Value.absent(),
            Value<int?> teamOneScore = const Value.absent(),
            Value<int?> teamTwoScore = const Value.absent(),
            Value<int?> teamOneCallAmount = const Value.absent(),
            Value<int?> teamTwoCallAmount = const Value.absent(),
            Value<bool?> isTeamOneCallSuccessful = const Value.absent(),
            Value<bool?> isTeamTwoCallSuccessful = const Value.absent(),
            Value<bool?> teamFailed = const Value.absent(),
            Value<String?> calculatorResult = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RoundTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            gameId: gameId,
            teamCalled: teamCalled,
            teamOneScore: teamOneScore,
            teamTwoScore: teamTwoScore,
            teamOneCallAmount: teamOneCallAmount,
            teamTwoCallAmount: teamTwoCallAmount,
            isTeamOneCallSuccessful: isTeamOneCallSuccessful,
            isTeamTwoCallSuccessful: isTeamTwoCallSuccessful,
            teamFailed: teamFailed,
            calculatorResult: calculatorResult,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoundTableTableReferences(db, table, e)
                  ))
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
                    referencedTable:
                        $$RoundTableTableReferences._gameIdTable(db),
                    referencedColumn:
                        $$RoundTableTableReferences._gameIdTable(db).id,
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

typedef $$RoundTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoundTableTable,
    RoundTableData,
    $$RoundTableTableFilterComposer,
    $$RoundTableTableOrderingComposer,
    $$RoundTableTableAnnotationComposer,
    $$RoundTableTableCreateCompanionBuilder,
    $$RoundTableTableUpdateCompanionBuilder,
    (RoundTableData, $$RoundTableTableReferences),
    RoundTableData,
    PrefetchHooks Function({bool gameId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GameTableTableTableManager get gameTable =>
      $$GameTableTableTableManager(_db, _db.gameTable);
  $$RoundTableTableTableManager get roundTable =>
      $$RoundTableTableTableManager(_db, _db.roundTable);
}
