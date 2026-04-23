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
  static const VerificationMeta _teamOneWinsMeta =
      const VerificationMeta('teamOneWins');
  @override
  late final GeneratedColumn<int> teamOneWins = GeneratedColumn<int>(
      'team_one_wins', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _teamTwoWinsMeta =
      const VerificationMeta('teamTwoWins');
  @override
  late final GeneratedColumn<int> teamTwoWins = GeneratedColumn<int>(
      'team_two_wins', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
        finished,
        teamOneWins,
        teamTwoWins
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
    if (data.containsKey('team_one_wins')) {
      context.handle(
          _teamOneWinsMeta,
          teamOneWins.isAcceptableOrUnknown(
              data['team_one_wins']!, _teamOneWinsMeta));
    }
    if (data.containsKey('team_two_wins')) {
      context.handle(
          _teamTwoWinsMeta,
          teamTwoWins.isAcceptableOrUnknown(
              data['team_two_wins']!, _teamTwoWinsMeta));
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
      teamOneWins: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_one_wins']),
      teamTwoWins: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_two_wins']),
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
  final int? teamOneWins;
  final int? teamTwoWins;
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
      this.finished,
      this.teamOneWins,
      this.teamTwoWins});
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
    if (!nullToAbsent || teamOneWins != null) {
      map['team_one_wins'] = Variable<int>(teamOneWins);
    }
    if (!nullToAbsent || teamTwoWins != null) {
      map['team_two_wins'] = Variable<int>(teamTwoWins);
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
      teamOneWins: teamOneWins == null && nullToAbsent
          ? const Value.absent()
          : Value(teamOneWins),
      teamTwoWins: teamTwoWins == null && nullToAbsent
          ? const Value.absent()
          : Value(teamTwoWins),
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
      teamOneWins: serializer.fromJson<int?>(json['teamOneWins']),
      teamTwoWins: serializer.fromJson<int?>(json['teamTwoWins']),
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
      'teamOneWins': serializer.toJson<int?>(teamOneWins),
      'teamTwoWins': serializer.toJson<int?>(teamTwoWins),
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
          Value<bool?> finished = const Value.absent(),
          Value<int?> teamOneWins = const Value.absent(),
          Value<int?> teamTwoWins = const Value.absent()}) =>
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
        teamOneWins: teamOneWins.present ? teamOneWins.value : this.teamOneWins,
        teamTwoWins: teamTwoWins.present ? teamTwoWins.value : this.teamTwoWins,
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
      teamOneWins:
          data.teamOneWins.present ? data.teamOneWins.value : this.teamOneWins,
      teamTwoWins:
          data.teamTwoWins.present ? data.teamTwoWins.value : this.teamTwoWins,
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
          ..write('finished: $finished, ')
          ..write('teamOneWins: $teamOneWins, ')
          ..write('teamTwoWins: $teamTwoWins')
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
      finished,
      teamOneWins,
      teamTwoWins);
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
          other.finished == this.finished &&
          other.teamOneWins == this.teamOneWins &&
          other.teamTwoWins == this.teamTwoWins);
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
  final Value<int?> teamOneWins;
  final Value<int?> teamTwoWins;
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
    this.teamOneWins = const Value.absent(),
    this.teamTwoWins = const Value.absent(),
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
    this.teamOneWins = const Value.absent(),
    this.teamTwoWins = const Value.absent(),
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
    Expression<int>? teamOneWins,
    Expression<int>? teamTwoWins,
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
      if (teamOneWins != null) 'team_one_wins': teamOneWins,
      if (teamTwoWins != null) 'team_two_wins': teamTwoWins,
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
      Value<int?>? teamOneWins,
      Value<int?>? teamTwoWins,
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
      teamOneWins: teamOneWins ?? this.teamOneWins,
      teamTwoWins: teamTwoWins ?? this.teamTwoWins,
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
    if (teamOneWins.present) {
      map['team_one_wins'] = Variable<int>(teamOneWins.value);
    }
    if (teamTwoWins.present) {
      map['team_two_wins'] = Variable<int>(teamTwoWins.value);
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
          ..write('teamOneWins: $teamOneWins, ')
          ..write('teamTwoWins: $teamTwoWins, ')
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
  static const VerificationMeta _us20Meta = const VerificationMeta('us20');
  @override
  late final GeneratedColumn<int> us20 = GeneratedColumn<int>(
      'us20', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _us50Meta = const VerificationMeta('us50');
  @override
  late final GeneratedColumn<int> us50 = GeneratedColumn<int>(
      'us50', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _us100Meta = const VerificationMeta('us100');
  @override
  late final GeneratedColumn<int> us100 = GeneratedColumn<int>(
      'us100', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _us150Meta = const VerificationMeta('us150');
  @override
  late final GeneratedColumn<int> us150 = GeneratedColumn<int>(
      'us150', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _us200Meta = const VerificationMeta('us200');
  @override
  late final GeneratedColumn<int> us200 = GeneratedColumn<int>(
      'us200', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _them20Meta = const VerificationMeta('them20');
  @override
  late final GeneratedColumn<int> them20 = GeneratedColumn<int>(
      'them20', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _them50Meta = const VerificationMeta('them50');
  @override
  late final GeneratedColumn<int> them50 = GeneratedColumn<int>(
      'them50', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _them100Meta =
      const VerificationMeta('them100');
  @override
  late final GeneratedColumn<int> them100 = GeneratedColumn<int>(
      'them100', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _them150Meta =
      const VerificationMeta('them150');
  @override
  late final GeneratedColumn<int> them150 = GeneratedColumn<int>(
      'them150', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _them200Meta =
      const VerificationMeta('them200');
  @override
  late final GeneratedColumn<int> them200 = GeneratedColumn<int>(
      'them200', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
        calculatorResult,
        us20,
        us50,
        us100,
        us150,
        us200,
        them20,
        them50,
        them100,
        them150,
        them200
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
    if (data.containsKey('us20')) {
      context.handle(
          _us20Meta, us20.isAcceptableOrUnknown(data['us20']!, _us20Meta));
    }
    if (data.containsKey('us50')) {
      context.handle(
          _us50Meta, us50.isAcceptableOrUnknown(data['us50']!, _us50Meta));
    }
    if (data.containsKey('us100')) {
      context.handle(
          _us100Meta, us100.isAcceptableOrUnknown(data['us100']!, _us100Meta));
    }
    if (data.containsKey('us150')) {
      context.handle(
          _us150Meta, us150.isAcceptableOrUnknown(data['us150']!, _us150Meta));
    }
    if (data.containsKey('us200')) {
      context.handle(
          _us200Meta, us200.isAcceptableOrUnknown(data['us200']!, _us200Meta));
    }
    if (data.containsKey('them20')) {
      context.handle(_them20Meta,
          them20.isAcceptableOrUnknown(data['them20']!, _them20Meta));
    }
    if (data.containsKey('them50')) {
      context.handle(_them50Meta,
          them50.isAcceptableOrUnknown(data['them50']!, _them50Meta));
    }
    if (data.containsKey('them100')) {
      context.handle(_them100Meta,
          them100.isAcceptableOrUnknown(data['them100']!, _them100Meta));
    }
    if (data.containsKey('them150')) {
      context.handle(_them150Meta,
          them150.isAcceptableOrUnknown(data['them150']!, _them150Meta));
    }
    if (data.containsKey('them200')) {
      context.handle(_them200Meta,
          them200.isAcceptableOrUnknown(data['them200']!, _them200Meta));
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
      us20: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}us20']),
      us50: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}us50']),
      us100: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}us100']),
      us150: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}us150']),
      us200: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}us200']),
      them20: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}them20']),
      them50: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}them50']),
      them100: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}them100']),
      them150: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}them150']),
      them200: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}them200']),
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
  final int? us20;
  final int? us50;
  final int? us100;
  final int? us150;
  final int? us200;
  final int? them20;
  final int? them50;
  final int? them100;
  final int? them150;
  final int? them200;
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
      this.calculatorResult,
      this.us20,
      this.us50,
      this.us100,
      this.us150,
      this.us200,
      this.them20,
      this.them50,
      this.them100,
      this.them150,
      this.them200});
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
    if (!nullToAbsent || us20 != null) {
      map['us20'] = Variable<int>(us20);
    }
    if (!nullToAbsent || us50 != null) {
      map['us50'] = Variable<int>(us50);
    }
    if (!nullToAbsent || us100 != null) {
      map['us100'] = Variable<int>(us100);
    }
    if (!nullToAbsent || us150 != null) {
      map['us150'] = Variable<int>(us150);
    }
    if (!nullToAbsent || us200 != null) {
      map['us200'] = Variable<int>(us200);
    }
    if (!nullToAbsent || them20 != null) {
      map['them20'] = Variable<int>(them20);
    }
    if (!nullToAbsent || them50 != null) {
      map['them50'] = Variable<int>(them50);
    }
    if (!nullToAbsent || them100 != null) {
      map['them100'] = Variable<int>(them100);
    }
    if (!nullToAbsent || them150 != null) {
      map['them150'] = Variable<int>(them150);
    }
    if (!nullToAbsent || them200 != null) {
      map['them200'] = Variable<int>(them200);
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
      us20: us20 == null && nullToAbsent ? const Value.absent() : Value(us20),
      us50: us50 == null && nullToAbsent ? const Value.absent() : Value(us50),
      us100:
          us100 == null && nullToAbsent ? const Value.absent() : Value(us100),
      us150:
          us150 == null && nullToAbsent ? const Value.absent() : Value(us150),
      us200:
          us200 == null && nullToAbsent ? const Value.absent() : Value(us200),
      them20:
          them20 == null && nullToAbsent ? const Value.absent() : Value(them20),
      them50:
          them50 == null && nullToAbsent ? const Value.absent() : Value(them50),
      them100: them100 == null && nullToAbsent
          ? const Value.absent()
          : Value(them100),
      them150: them150 == null && nullToAbsent
          ? const Value.absent()
          : Value(them150),
      them200: them200 == null && nullToAbsent
          ? const Value.absent()
          : Value(them200),
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
      us20: serializer.fromJson<int?>(json['us20']),
      us50: serializer.fromJson<int?>(json['us50']),
      us100: serializer.fromJson<int?>(json['us100']),
      us150: serializer.fromJson<int?>(json['us150']),
      us200: serializer.fromJson<int?>(json['us200']),
      them20: serializer.fromJson<int?>(json['them20']),
      them50: serializer.fromJson<int?>(json['them50']),
      them100: serializer.fromJson<int?>(json['them100']),
      them150: serializer.fromJson<int?>(json['them150']),
      them200: serializer.fromJson<int?>(json['them200']),
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
      'us20': serializer.toJson<int?>(us20),
      'us50': serializer.toJson<int?>(us50),
      'us100': serializer.toJson<int?>(us100),
      'us150': serializer.toJson<int?>(us150),
      'us200': serializer.toJson<int?>(us200),
      'them20': serializer.toJson<int?>(them20),
      'them50': serializer.toJson<int?>(them50),
      'them100': serializer.toJson<int?>(them100),
      'them150': serializer.toJson<int?>(them150),
      'them200': serializer.toJson<int?>(them200),
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
          Value<String?> calculatorResult = const Value.absent(),
          Value<int?> us20 = const Value.absent(),
          Value<int?> us50 = const Value.absent(),
          Value<int?> us100 = const Value.absent(),
          Value<int?> us150 = const Value.absent(),
          Value<int?> us200 = const Value.absent(),
          Value<int?> them20 = const Value.absent(),
          Value<int?> them50 = const Value.absent(),
          Value<int?> them100 = const Value.absent(),
          Value<int?> them150 = const Value.absent(),
          Value<int?> them200 = const Value.absent()}) =>
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
        us20: us20.present ? us20.value : this.us20,
        us50: us50.present ? us50.value : this.us50,
        us100: us100.present ? us100.value : this.us100,
        us150: us150.present ? us150.value : this.us150,
        us200: us200.present ? us200.value : this.us200,
        them20: them20.present ? them20.value : this.them20,
        them50: them50.present ? them50.value : this.them50,
        them100: them100.present ? them100.value : this.them100,
        them150: them150.present ? them150.value : this.them150,
        them200: them200.present ? them200.value : this.them200,
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
      us20: data.us20.present ? data.us20.value : this.us20,
      us50: data.us50.present ? data.us50.value : this.us50,
      us100: data.us100.present ? data.us100.value : this.us100,
      us150: data.us150.present ? data.us150.value : this.us150,
      us200: data.us200.present ? data.us200.value : this.us200,
      them20: data.them20.present ? data.them20.value : this.them20,
      them50: data.them50.present ? data.them50.value : this.them50,
      them100: data.them100.present ? data.them100.value : this.them100,
      them150: data.them150.present ? data.them150.value : this.them150,
      them200: data.them200.present ? data.them200.value : this.them200,
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
          ..write('calculatorResult: $calculatorResult, ')
          ..write('us20: $us20, ')
          ..write('us50: $us50, ')
          ..write('us100: $us100, ')
          ..write('us150: $us150, ')
          ..write('us200: $us200, ')
          ..write('them20: $them20, ')
          ..write('them50: $them50, ')
          ..write('them100: $them100, ')
          ..write('them150: $them150, ')
          ..write('them200: $them200')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
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
        calculatorResult,
        us20,
        us50,
        us100,
        us150,
        us200,
        them20,
        them50,
        them100,
        them150,
        them200
      ]);
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
          other.calculatorResult == this.calculatorResult &&
          other.us20 == this.us20 &&
          other.us50 == this.us50 &&
          other.us100 == this.us100 &&
          other.us150 == this.us150 &&
          other.us200 == this.us200 &&
          other.them20 == this.them20 &&
          other.them50 == this.them50 &&
          other.them100 == this.them100 &&
          other.them150 == this.them150 &&
          other.them200 == this.them200);
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
  final Value<int?> us20;
  final Value<int?> us50;
  final Value<int?> us100;
  final Value<int?> us150;
  final Value<int?> us200;
  final Value<int?> them20;
  final Value<int?> them50;
  final Value<int?> them100;
  final Value<int?> them150;
  final Value<int?> them200;
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
    this.us20 = const Value.absent(),
    this.us50 = const Value.absent(),
    this.us100 = const Value.absent(),
    this.us150 = const Value.absent(),
    this.us200 = const Value.absent(),
    this.them20 = const Value.absent(),
    this.them50 = const Value.absent(),
    this.them100 = const Value.absent(),
    this.them150 = const Value.absent(),
    this.them200 = const Value.absent(),
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
    this.us20 = const Value.absent(),
    this.us50 = const Value.absent(),
    this.us100 = const Value.absent(),
    this.us150 = const Value.absent(),
    this.us200 = const Value.absent(),
    this.them20 = const Value.absent(),
    this.them50 = const Value.absent(),
    this.them100 = const Value.absent(),
    this.them150 = const Value.absent(),
    this.them200 = const Value.absent(),
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
    Expression<int>? us20,
    Expression<int>? us50,
    Expression<int>? us100,
    Expression<int>? us150,
    Expression<int>? us200,
    Expression<int>? them20,
    Expression<int>? them50,
    Expression<int>? them100,
    Expression<int>? them150,
    Expression<int>? them200,
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
      if (us20 != null) 'us20': us20,
      if (us50 != null) 'us50': us50,
      if (us100 != null) 'us100': us100,
      if (us150 != null) 'us150': us150,
      if (us200 != null) 'us200': us200,
      if (them20 != null) 'them20': them20,
      if (them50 != null) 'them50': them50,
      if (them100 != null) 'them100': them100,
      if (them150 != null) 'them150': them150,
      if (them200 != null) 'them200': them200,
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
      Value<int?>? us20,
      Value<int?>? us50,
      Value<int?>? us100,
      Value<int?>? us150,
      Value<int?>? us200,
      Value<int?>? them20,
      Value<int?>? them50,
      Value<int?>? them100,
      Value<int?>? them150,
      Value<int?>? them200,
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
      us20: us20 ?? this.us20,
      us50: us50 ?? this.us50,
      us100: us100 ?? this.us100,
      us150: us150 ?? this.us150,
      us200: us200 ?? this.us200,
      them20: them20 ?? this.them20,
      them50: them50 ?? this.them50,
      them100: them100 ?? this.them100,
      them150: them150 ?? this.them150,
      them200: them200 ?? this.them200,
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
    if (us20.present) {
      map['us20'] = Variable<int>(us20.value);
    }
    if (us50.present) {
      map['us50'] = Variable<int>(us50.value);
    }
    if (us100.present) {
      map['us100'] = Variable<int>(us100.value);
    }
    if (us150.present) {
      map['us150'] = Variable<int>(us150.value);
    }
    if (us200.present) {
      map['us200'] = Variable<int>(us200.value);
    }
    if (them20.present) {
      map['them20'] = Variable<int>(them20.value);
    }
    if (them50.present) {
      map['them50'] = Variable<int>(them50.value);
    }
    if (them100.present) {
      map['them100'] = Variable<int>(them100.value);
    }
    if (them150.present) {
      map['them150'] = Variable<int>(them150.value);
    }
    if (them200.present) {
      map['them200'] = Variable<int>(them200.value);
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
          ..write('us20: $us20, ')
          ..write('us50: $us50, ')
          ..write('us100: $us100, ')
          ..write('us150: $us150, ')
          ..write('us200: $us200, ')
          ..write('them20: $them20, ')
          ..write('them50: $them50, ')
          ..write('them100: $them100, ')
          ..write('them150: $them150, ')
          ..write('them200: $them200, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTableTable extends SettingsTable
    with TableInfo<$SettingsTableTable, SettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _showRulesMeta =
      const VerificationMeta('showRules');
  @override
  late final GeneratedColumn<bool> showRules = GeneratedColumn<bool>(
      'show_rules', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("show_rules" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _showHelpDialogMeta =
      const VerificationMeta('showHelpDialog');
  @override
  late final GeneratedColumn<bool> showHelpDialog = GeneratedColumn<bool>(
      'show_help_dialog', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("show_help_dialog" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _showGameStatsMeta =
      const VerificationMeta('showGameStats');
  @override
  late final GeneratedColumn<bool> showGameStats = GeneratedColumn<bool>(
      'show_game_stats', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("show_game_stats" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _showSmartCalculatorMeta =
      const VerificationMeta('showSmartCalculator');
  @override
  late final GeneratedColumn<bool> showSmartCalculator = GeneratedColumn<bool>(
      'show_smart_calculator', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("show_smart_calculator" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _lockPreviousRoundsMeta =
      const VerificationMeta('lockPreviousRounds');
  @override
  late final GeneratedColumn<bool> lockPreviousRounds = GeneratedColumn<bool>(
      'lock_previous_rounds', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("lock_previous_rounds" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _themeModeMeta =
      const VerificationMeta('themeMode');
  @override
  late final GeneratedColumn<int> themeMode = GeneratedColumn<int>(
      'theme_mode', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(AppThemeMode.light.index));
  static const VerificationMeta _ecoModeMeta =
      const VerificationMeta('ecoMode');
  @override
  late final GeneratedColumn<bool> ecoMode = GeneratedColumn<bool>(
      'eco_mode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("eco_mode" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _roundSortOrderMeta =
      const VerificationMeta('roundSortOrder');
  @override
  late final GeneratedColumn<int> roundSortOrder = GeneratedColumn<int>(
      'round_sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(RoundSortOrder.newestFirst.index));
  static const VerificationMeta _keepScreenOnMeta =
      const VerificationMeta('keepScreenOn');
  @override
  late final GeneratedColumn<bool> keepScreenOn = GeneratedColumn<bool>(
      'keep_screen_on', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("keep_screen_on" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        deletedAt,
        showRules,
        showHelpDialog,
        showGameStats,
        showSmartCalculator,
        lockPreviousRounds,
        themeMode,
        ecoMode,
        roundSortOrder,
        keepScreenOn
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<SettingsTableData> instance,
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
    if (data.containsKey('show_rules')) {
      context.handle(_showRulesMeta,
          showRules.isAcceptableOrUnknown(data['show_rules']!, _showRulesMeta));
    }
    if (data.containsKey('show_help_dialog')) {
      context.handle(
          _showHelpDialogMeta,
          showHelpDialog.isAcceptableOrUnknown(
              data['show_help_dialog']!, _showHelpDialogMeta));
    }
    if (data.containsKey('show_game_stats')) {
      context.handle(
          _showGameStatsMeta,
          showGameStats.isAcceptableOrUnknown(
              data['show_game_stats']!, _showGameStatsMeta));
    }
    if (data.containsKey('show_smart_calculator')) {
      context.handle(
          _showSmartCalculatorMeta,
          showSmartCalculator.isAcceptableOrUnknown(
              data['show_smart_calculator']!, _showSmartCalculatorMeta));
    }
    if (data.containsKey('lock_previous_rounds')) {
      context.handle(
          _lockPreviousRoundsMeta,
          lockPreviousRounds.isAcceptableOrUnknown(
              data['lock_previous_rounds']!, _lockPreviousRoundsMeta));
    }
    if (data.containsKey('theme_mode')) {
      context.handle(_themeModeMeta,
          themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta));
    }
    if (data.containsKey('eco_mode')) {
      context.handle(_ecoModeMeta,
          ecoMode.isAcceptableOrUnknown(data['eco_mode']!, _ecoModeMeta));
    }
    if (data.containsKey('round_sort_order')) {
      context.handle(
          _roundSortOrderMeta,
          roundSortOrder.isAcceptableOrUnknown(
              data['round_sort_order']!, _roundSortOrderMeta));
    }
    if (data.containsKey('keep_screen_on')) {
      context.handle(
          _keepScreenOnMeta,
          keepScreenOn.isAcceptableOrUnknown(
              data['keep_screen_on']!, _keepScreenOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      showRules: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}show_rules'])!,
      showHelpDialog: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}show_help_dialog'])!,
      showGameStats: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}show_game_stats'])!,
      showSmartCalculator: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}show_smart_calculator'])!,
      lockPreviousRounds: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}lock_previous_rounds'])!,
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}theme_mode'])!,
      ecoMode: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}eco_mode'])!,
      roundSortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}round_sort_order'])!,
      keepScreenOn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}keep_screen_on'])!,
    );
  }

  @override
  $SettingsTableTable createAlias(String alias) {
    return $SettingsTableTable(attachedDatabase, alias);
  }
}

class SettingsTableData extends DataClass
    implements Insertable<SettingsTableData> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool showRules;
  final bool showHelpDialog;
  final bool showGameStats;
  final bool showSmartCalculator;
  final bool lockPreviousRounds;
  final int themeMode;
  final bool ecoMode;
  final int roundSortOrder;
  final bool keepScreenOn;
  const SettingsTableData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.showRules,
      required this.showHelpDialog,
      required this.showGameStats,
      required this.showSmartCalculator,
      required this.lockPreviousRounds,
      required this.themeMode,
      required this.ecoMode,
      required this.roundSortOrder,
      required this.keepScreenOn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['show_rules'] = Variable<bool>(showRules);
    map['show_help_dialog'] = Variable<bool>(showHelpDialog);
    map['show_game_stats'] = Variable<bool>(showGameStats);
    map['show_smart_calculator'] = Variable<bool>(showSmartCalculator);
    map['lock_previous_rounds'] = Variable<bool>(lockPreviousRounds);
    map['theme_mode'] = Variable<int>(themeMode);
    map['eco_mode'] = Variable<bool>(ecoMode);
    map['round_sort_order'] = Variable<int>(roundSortOrder);
    map['keep_screen_on'] = Variable<bool>(keepScreenOn);
    return map;
  }

  SettingsTableCompanion toCompanion(bool nullToAbsent) {
    return SettingsTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      showRules: Value(showRules),
      showHelpDialog: Value(showHelpDialog),
      showGameStats: Value(showGameStats),
      showSmartCalculator: Value(showSmartCalculator),
      lockPreviousRounds: Value(lockPreviousRounds),
      themeMode: Value(themeMode),
      ecoMode: Value(ecoMode),
      roundSortOrder: Value(roundSortOrder),
      keepScreenOn: Value(keepScreenOn),
    );
  }

  factory SettingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsTableData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      showRules: serializer.fromJson<bool>(json['showRules']),
      showHelpDialog: serializer.fromJson<bool>(json['showHelpDialog']),
      showGameStats: serializer.fromJson<bool>(json['showGameStats']),
      showSmartCalculator:
          serializer.fromJson<bool>(json['showSmartCalculator']),
      lockPreviousRounds: serializer.fromJson<bool>(json['lockPreviousRounds']),
      themeMode: serializer.fromJson<int>(json['themeMode']),
      ecoMode: serializer.fromJson<bool>(json['ecoMode']),
      roundSortOrder: serializer.fromJson<int>(json['roundSortOrder']),
      keepScreenOn: serializer.fromJson<bool>(json['keepScreenOn']),
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
      'showRules': serializer.toJson<bool>(showRules),
      'showHelpDialog': serializer.toJson<bool>(showHelpDialog),
      'showGameStats': serializer.toJson<bool>(showGameStats),
      'showSmartCalculator': serializer.toJson<bool>(showSmartCalculator),
      'lockPreviousRounds': serializer.toJson<bool>(lockPreviousRounds),
      'themeMode': serializer.toJson<int>(themeMode),
      'ecoMode': serializer.toJson<bool>(ecoMode),
      'roundSortOrder': serializer.toJson<int>(roundSortOrder),
      'keepScreenOn': serializer.toJson<bool>(keepScreenOn),
    };
  }

  SettingsTableData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          bool? showRules,
          bool? showHelpDialog,
          bool? showGameStats,
          bool? showSmartCalculator,
          bool? lockPreviousRounds,
          int? themeMode,
          bool? ecoMode,
          int? roundSortOrder,
          bool? keepScreenOn}) =>
      SettingsTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        showRules: showRules ?? this.showRules,
        showHelpDialog: showHelpDialog ?? this.showHelpDialog,
        showGameStats: showGameStats ?? this.showGameStats,
        showSmartCalculator: showSmartCalculator ?? this.showSmartCalculator,
        lockPreviousRounds: lockPreviousRounds ?? this.lockPreviousRounds,
        themeMode: themeMode ?? this.themeMode,
        ecoMode: ecoMode ?? this.ecoMode,
        roundSortOrder: roundSortOrder ?? this.roundSortOrder,
        keepScreenOn: keepScreenOn ?? this.keepScreenOn,
      );
  SettingsTableData copyWithCompanion(SettingsTableCompanion data) {
    return SettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      showRules: data.showRules.present ? data.showRules.value : this.showRules,
      showHelpDialog: data.showHelpDialog.present
          ? data.showHelpDialog.value
          : this.showHelpDialog,
      showGameStats: data.showGameStats.present
          ? data.showGameStats.value
          : this.showGameStats,
      showSmartCalculator: data.showSmartCalculator.present
          ? data.showSmartCalculator.value
          : this.showSmartCalculator,
      lockPreviousRounds: data.lockPreviousRounds.present
          ? data.lockPreviousRounds.value
          : this.lockPreviousRounds,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      ecoMode: data.ecoMode.present ? data.ecoMode.value : this.ecoMode,
      roundSortOrder: data.roundSortOrder.present
          ? data.roundSortOrder.value
          : this.roundSortOrder,
      keepScreenOn: data.keepScreenOn.present
          ? data.keepScreenOn.value
          : this.keepScreenOn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('showRules: $showRules, ')
          ..write('showHelpDialog: $showHelpDialog, ')
          ..write('showGameStats: $showGameStats, ')
          ..write('showSmartCalculator: $showSmartCalculator, ')
          ..write('lockPreviousRounds: $lockPreviousRounds, ')
          ..write('themeMode: $themeMode, ')
          ..write('ecoMode: $ecoMode, ')
          ..write('roundSortOrder: $roundSortOrder, ')
          ..write('keepScreenOn: $keepScreenOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      deletedAt,
      showRules,
      showHelpDialog,
      showGameStats,
      showSmartCalculator,
      lockPreviousRounds,
      themeMode,
      ecoMode,
      roundSortOrder,
      keepScreenOn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.showRules == this.showRules &&
          other.showHelpDialog == this.showHelpDialog &&
          other.showGameStats == this.showGameStats &&
          other.showSmartCalculator == this.showSmartCalculator &&
          other.lockPreviousRounds == this.lockPreviousRounds &&
          other.themeMode == this.themeMode &&
          other.ecoMode == this.ecoMode &&
          other.roundSortOrder == this.roundSortOrder &&
          other.keepScreenOn == this.keepScreenOn);
}

class SettingsTableCompanion extends UpdateCompanion<SettingsTableData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> showRules;
  final Value<bool> showHelpDialog;
  final Value<bool> showGameStats;
  final Value<bool> showSmartCalculator;
  final Value<bool> lockPreviousRounds;
  final Value<int> themeMode;
  final Value<bool> ecoMode;
  final Value<int> roundSortOrder;
  final Value<bool> keepScreenOn;
  final Value<int> rowid;
  const SettingsTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.showRules = const Value.absent(),
    this.showHelpDialog = const Value.absent(),
    this.showGameStats = const Value.absent(),
    this.showSmartCalculator = const Value.absent(),
    this.lockPreviousRounds = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.ecoMode = const Value.absent(),
    this.roundSortOrder = const Value.absent(),
    this.keepScreenOn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.showRules = const Value.absent(),
    this.showHelpDialog = const Value.absent(),
    this.showGameStats = const Value.absent(),
    this.showSmartCalculator = const Value.absent(),
    this.lockPreviousRounds = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.ecoMode = const Value.absent(),
    this.roundSortOrder = const Value.absent(),
    this.keepScreenOn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<SettingsTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? showRules,
    Expression<bool>? showHelpDialog,
    Expression<bool>? showGameStats,
    Expression<bool>? showSmartCalculator,
    Expression<bool>? lockPreviousRounds,
    Expression<int>? themeMode,
    Expression<bool>? ecoMode,
    Expression<int>? roundSortOrder,
    Expression<bool>? keepScreenOn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (showRules != null) 'show_rules': showRules,
      if (showHelpDialog != null) 'show_help_dialog': showHelpDialog,
      if (showGameStats != null) 'show_game_stats': showGameStats,
      if (showSmartCalculator != null)
        'show_smart_calculator': showSmartCalculator,
      if (lockPreviousRounds != null)
        'lock_previous_rounds': lockPreviousRounds,
      if (themeMode != null) 'theme_mode': themeMode,
      if (ecoMode != null) 'eco_mode': ecoMode,
      if (roundSortOrder != null) 'round_sort_order': roundSortOrder,
      if (keepScreenOn != null) 'keep_screen_on': keepScreenOn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<bool>? showRules,
      Value<bool>? showHelpDialog,
      Value<bool>? showGameStats,
      Value<bool>? showSmartCalculator,
      Value<bool>? lockPreviousRounds,
      Value<int>? themeMode,
      Value<bool>? ecoMode,
      Value<int>? roundSortOrder,
      Value<bool>? keepScreenOn,
      Value<int>? rowid}) {
    return SettingsTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      showRules: showRules ?? this.showRules,
      showHelpDialog: showHelpDialog ?? this.showHelpDialog,
      showGameStats: showGameStats ?? this.showGameStats,
      showSmartCalculator: showSmartCalculator ?? this.showSmartCalculator,
      lockPreviousRounds: lockPreviousRounds ?? this.lockPreviousRounds,
      themeMode: themeMode ?? this.themeMode,
      ecoMode: ecoMode ?? this.ecoMode,
      roundSortOrder: roundSortOrder ?? this.roundSortOrder,
      keepScreenOn: keepScreenOn ?? this.keepScreenOn,
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
    if (showRules.present) {
      map['show_rules'] = Variable<bool>(showRules.value);
    }
    if (showHelpDialog.present) {
      map['show_help_dialog'] = Variable<bool>(showHelpDialog.value);
    }
    if (showGameStats.present) {
      map['show_game_stats'] = Variable<bool>(showGameStats.value);
    }
    if (showSmartCalculator.present) {
      map['show_smart_calculator'] = Variable<bool>(showSmartCalculator.value);
    }
    if (lockPreviousRounds.present) {
      map['lock_previous_rounds'] = Variable<bool>(lockPreviousRounds.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<int>(themeMode.value);
    }
    if (ecoMode.present) {
      map['eco_mode'] = Variable<bool>(ecoMode.value);
    }
    if (roundSortOrder.present) {
      map['round_sort_order'] = Variable<int>(roundSortOrder.value);
    }
    if (keepScreenOn.present) {
      map['keep_screen_on'] = Variable<bool>(keepScreenOn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('showRules: $showRules, ')
          ..write('showHelpDialog: $showHelpDialog, ')
          ..write('showGameStats: $showGameStats, ')
          ..write('showSmartCalculator: $showSmartCalculator, ')
          ..write('lockPreviousRounds: $lockPreviousRounds, ')
          ..write('themeMode: $themeMode, ')
          ..write('ecoMode: $ecoMode, ')
          ..write('roundSortOrder: $roundSortOrder, ')
          ..write('keepScreenOn: $keepScreenOn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CalculatorResultTableTable extends CalculatorResultTable
    with TableInfo<$CalculatorResultTableTable, CalculatorResultTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalculatorResultTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _roundIdMeta =
      const VerificationMeta('roundId');
  @override
  late final GeneratedColumn<String> roundId = GeneratedColumn<String>(
      'round_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES rounds (id)'));
  static const VerificationMeta _teamOneDeclarationsMeta =
      const VerificationMeta('teamOneDeclarations');
  @override
  late final GeneratedColumn<int> teamOneDeclarations = GeneratedColumn<int>(
      'team_one_declarations', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _teamOneDeclarationsSumMeta =
      const VerificationMeta('teamOneDeclarationsSum');
  @override
  late final GeneratedColumn<int> teamOneDeclarationsSum = GeneratedColumn<int>(
      'team_one_declarations_sum', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _teamOneFailsMeta =
      const VerificationMeta('teamOneFails');
  @override
  late final GeneratedColumn<int> teamOneFails = GeneratedColumn<int>(
      'team_one_fails', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _teamTwoDeclarationsMeta =
      const VerificationMeta('teamTwoDeclarations');
  @override
  late final GeneratedColumn<int> teamTwoDeclarations = GeneratedColumn<int>(
      'team_two_declarations', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _teamTwoDeclarationsSumMeta =
      const VerificationMeta('teamTwoDeclarationsSum');
  @override
  late final GeneratedColumn<int> teamTwoDeclarationsSum = GeneratedColumn<int>(
      'team_two_declarations_sum', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _teamTwoFailsMeta =
      const VerificationMeta('teamTwoFails');
  @override
  late final GeneratedColumn<int> teamTwoFails = GeneratedColumn<int>(
      'team_two_fails', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _selectedCardsMeta =
      const VerificationMeta('selectedCards');
  @override
  late final GeneratedColumn<String> selectedCards = GeneratedColumn<String>(
      'selected_cards', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _trumpCardsMeta =
      const VerificationMeta('trumpCards');
  @override
  late final GeneratedColumn<String> trumpCards = GeneratedColumn<String>(
      'trump_cards', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedColumn<String> team = GeneratedColumn<String>(
      'team', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        deletedAt,
        roundId,
        teamOneDeclarations,
        teamOneDeclarationsSum,
        teamOneFails,
        teamTwoDeclarations,
        teamTwoDeclarationsSum,
        teamTwoFails,
        selectedCards,
        trumpCards,
        team
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calculator_results';
  @override
  VerificationContext validateIntegrity(
      Insertable<CalculatorResultTableData> instance,
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
    if (data.containsKey('round_id')) {
      context.handle(_roundIdMeta,
          roundId.isAcceptableOrUnknown(data['round_id']!, _roundIdMeta));
    } else if (isInserting) {
      context.missing(_roundIdMeta);
    }
    if (data.containsKey('team_one_declarations')) {
      context.handle(
          _teamOneDeclarationsMeta,
          teamOneDeclarations.isAcceptableOrUnknown(
              data['team_one_declarations']!, _teamOneDeclarationsMeta));
    }
    if (data.containsKey('team_one_declarations_sum')) {
      context.handle(
          _teamOneDeclarationsSumMeta,
          teamOneDeclarationsSum.isAcceptableOrUnknown(
              data['team_one_declarations_sum']!, _teamOneDeclarationsSumMeta));
    }
    if (data.containsKey('team_one_fails')) {
      context.handle(
          _teamOneFailsMeta,
          teamOneFails.isAcceptableOrUnknown(
              data['team_one_fails']!, _teamOneFailsMeta));
    }
    if (data.containsKey('team_two_declarations')) {
      context.handle(
          _teamTwoDeclarationsMeta,
          teamTwoDeclarations.isAcceptableOrUnknown(
              data['team_two_declarations']!, _teamTwoDeclarationsMeta));
    }
    if (data.containsKey('team_two_declarations_sum')) {
      context.handle(
          _teamTwoDeclarationsSumMeta,
          teamTwoDeclarationsSum.isAcceptableOrUnknown(
              data['team_two_declarations_sum']!, _teamTwoDeclarationsSumMeta));
    }
    if (data.containsKey('team_two_fails')) {
      context.handle(
          _teamTwoFailsMeta,
          teamTwoFails.isAcceptableOrUnknown(
              data['team_two_fails']!, _teamTwoFailsMeta));
    }
    if (data.containsKey('selected_cards')) {
      context.handle(
          _selectedCardsMeta,
          selectedCards.isAcceptableOrUnknown(
              data['selected_cards']!, _selectedCardsMeta));
    }
    if (data.containsKey('trump_cards')) {
      context.handle(
          _trumpCardsMeta,
          trumpCards.isAcceptableOrUnknown(
              data['trump_cards']!, _trumpCardsMeta));
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team']!, _teamMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalculatorResultTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalculatorResultTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      roundId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}round_id'])!,
      teamOneDeclarations: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}team_one_declarations']),
      teamOneDeclarationsSum: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}team_one_declarations_sum']),
      teamOneFails: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_one_fails']),
      teamTwoDeclarations: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}team_two_declarations']),
      teamTwoDeclarationsSum: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}team_two_declarations_sum']),
      teamTwoFails: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}team_two_fails']),
      selectedCards: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}selected_cards']),
      trumpCards: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trump_cards']),
      team: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}team']),
    );
  }

  @override
  $CalculatorResultTableTable createAlias(String alias) {
    return $CalculatorResultTableTable(attachedDatabase, alias);
  }
}

class CalculatorResultTableData extends DataClass
    implements Insertable<CalculatorResultTableData> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String roundId;
  final int? teamOneDeclarations;
  final int? teamOneDeclarationsSum;
  final int? teamOneFails;
  final int? teamTwoDeclarations;
  final int? teamTwoDeclarationsSum;
  final int? teamTwoFails;
  final String? selectedCards;
  final String? trumpCards;
  final String? team;
  const CalculatorResultTableData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.roundId,
      this.teamOneDeclarations,
      this.teamOneDeclarationsSum,
      this.teamOneFails,
      this.teamTwoDeclarations,
      this.teamTwoDeclarationsSum,
      this.teamTwoFails,
      this.selectedCards,
      this.trumpCards,
      this.team});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['round_id'] = Variable<String>(roundId);
    if (!nullToAbsent || teamOneDeclarations != null) {
      map['team_one_declarations'] = Variable<int>(teamOneDeclarations);
    }
    if (!nullToAbsent || teamOneDeclarationsSum != null) {
      map['team_one_declarations_sum'] = Variable<int>(teamOneDeclarationsSum);
    }
    if (!nullToAbsent || teamOneFails != null) {
      map['team_one_fails'] = Variable<int>(teamOneFails);
    }
    if (!nullToAbsent || teamTwoDeclarations != null) {
      map['team_two_declarations'] = Variable<int>(teamTwoDeclarations);
    }
    if (!nullToAbsent || teamTwoDeclarationsSum != null) {
      map['team_two_declarations_sum'] = Variable<int>(teamTwoDeclarationsSum);
    }
    if (!nullToAbsent || teamTwoFails != null) {
      map['team_two_fails'] = Variable<int>(teamTwoFails);
    }
    if (!nullToAbsent || selectedCards != null) {
      map['selected_cards'] = Variable<String>(selectedCards);
    }
    if (!nullToAbsent || trumpCards != null) {
      map['trump_cards'] = Variable<String>(trumpCards);
    }
    if (!nullToAbsent || team != null) {
      map['team'] = Variable<String>(team);
    }
    return map;
  }

  CalculatorResultTableCompanion toCompanion(bool nullToAbsent) {
    return CalculatorResultTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      roundId: Value(roundId),
      teamOneDeclarations: teamOneDeclarations == null && nullToAbsent
          ? const Value.absent()
          : Value(teamOneDeclarations),
      teamOneDeclarationsSum: teamOneDeclarationsSum == null && nullToAbsent
          ? const Value.absent()
          : Value(teamOneDeclarationsSum),
      teamOneFails: teamOneFails == null && nullToAbsent
          ? const Value.absent()
          : Value(teamOneFails),
      teamTwoDeclarations: teamTwoDeclarations == null && nullToAbsent
          ? const Value.absent()
          : Value(teamTwoDeclarations),
      teamTwoDeclarationsSum: teamTwoDeclarationsSum == null && nullToAbsent
          ? const Value.absent()
          : Value(teamTwoDeclarationsSum),
      teamTwoFails: teamTwoFails == null && nullToAbsent
          ? const Value.absent()
          : Value(teamTwoFails),
      selectedCards: selectedCards == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedCards),
      trumpCards: trumpCards == null && nullToAbsent
          ? const Value.absent()
          : Value(trumpCards),
      team: team == null && nullToAbsent ? const Value.absent() : Value(team),
    );
  }

  factory CalculatorResultTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalculatorResultTableData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      roundId: serializer.fromJson<String>(json['roundId']),
      teamOneDeclarations:
          serializer.fromJson<int?>(json['teamOneDeclarations']),
      teamOneDeclarationsSum:
          serializer.fromJson<int?>(json['teamOneDeclarationsSum']),
      teamOneFails: serializer.fromJson<int?>(json['teamOneFails']),
      teamTwoDeclarations:
          serializer.fromJson<int?>(json['teamTwoDeclarations']),
      teamTwoDeclarationsSum:
          serializer.fromJson<int?>(json['teamTwoDeclarationsSum']),
      teamTwoFails: serializer.fromJson<int?>(json['teamTwoFails']),
      selectedCards: serializer.fromJson<String?>(json['selectedCards']),
      trumpCards: serializer.fromJson<String?>(json['trumpCards']),
      team: serializer.fromJson<String?>(json['team']),
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
      'roundId': serializer.toJson<String>(roundId),
      'teamOneDeclarations': serializer.toJson<int?>(teamOneDeclarations),
      'teamOneDeclarationsSum': serializer.toJson<int?>(teamOneDeclarationsSum),
      'teamOneFails': serializer.toJson<int?>(teamOneFails),
      'teamTwoDeclarations': serializer.toJson<int?>(teamTwoDeclarations),
      'teamTwoDeclarationsSum': serializer.toJson<int?>(teamTwoDeclarationsSum),
      'teamTwoFails': serializer.toJson<int?>(teamTwoFails),
      'selectedCards': serializer.toJson<String?>(selectedCards),
      'trumpCards': serializer.toJson<String?>(trumpCards),
      'team': serializer.toJson<String?>(team),
    };
  }

  CalculatorResultTableData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? roundId,
          Value<int?> teamOneDeclarations = const Value.absent(),
          Value<int?> teamOneDeclarationsSum = const Value.absent(),
          Value<int?> teamOneFails = const Value.absent(),
          Value<int?> teamTwoDeclarations = const Value.absent(),
          Value<int?> teamTwoDeclarationsSum = const Value.absent(),
          Value<int?> teamTwoFails = const Value.absent(),
          Value<String?> selectedCards = const Value.absent(),
          Value<String?> trumpCards = const Value.absent(),
          Value<String?> team = const Value.absent()}) =>
      CalculatorResultTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        roundId: roundId ?? this.roundId,
        teamOneDeclarations: teamOneDeclarations.present
            ? teamOneDeclarations.value
            : this.teamOneDeclarations,
        teamOneDeclarationsSum: teamOneDeclarationsSum.present
            ? teamOneDeclarationsSum.value
            : this.teamOneDeclarationsSum,
        teamOneFails:
            teamOneFails.present ? teamOneFails.value : this.teamOneFails,
        teamTwoDeclarations: teamTwoDeclarations.present
            ? teamTwoDeclarations.value
            : this.teamTwoDeclarations,
        teamTwoDeclarationsSum: teamTwoDeclarationsSum.present
            ? teamTwoDeclarationsSum.value
            : this.teamTwoDeclarationsSum,
        teamTwoFails:
            teamTwoFails.present ? teamTwoFails.value : this.teamTwoFails,
        selectedCards:
            selectedCards.present ? selectedCards.value : this.selectedCards,
        trumpCards: trumpCards.present ? trumpCards.value : this.trumpCards,
        team: team.present ? team.value : this.team,
      );
  CalculatorResultTableData copyWithCompanion(
      CalculatorResultTableCompanion data) {
    return CalculatorResultTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      roundId: data.roundId.present ? data.roundId.value : this.roundId,
      teamOneDeclarations: data.teamOneDeclarations.present
          ? data.teamOneDeclarations.value
          : this.teamOneDeclarations,
      teamOneDeclarationsSum: data.teamOneDeclarationsSum.present
          ? data.teamOneDeclarationsSum.value
          : this.teamOneDeclarationsSum,
      teamOneFails: data.teamOneFails.present
          ? data.teamOneFails.value
          : this.teamOneFails,
      teamTwoDeclarations: data.teamTwoDeclarations.present
          ? data.teamTwoDeclarations.value
          : this.teamTwoDeclarations,
      teamTwoDeclarationsSum: data.teamTwoDeclarationsSum.present
          ? data.teamTwoDeclarationsSum.value
          : this.teamTwoDeclarationsSum,
      teamTwoFails: data.teamTwoFails.present
          ? data.teamTwoFails.value
          : this.teamTwoFails,
      selectedCards: data.selectedCards.present
          ? data.selectedCards.value
          : this.selectedCards,
      trumpCards:
          data.trumpCards.present ? data.trumpCards.value : this.trumpCards,
      team: data.team.present ? data.team.value : this.team,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalculatorResultTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('roundId: $roundId, ')
          ..write('teamOneDeclarations: $teamOneDeclarations, ')
          ..write('teamOneDeclarationsSum: $teamOneDeclarationsSum, ')
          ..write('teamOneFails: $teamOneFails, ')
          ..write('teamTwoDeclarations: $teamTwoDeclarations, ')
          ..write('teamTwoDeclarationsSum: $teamTwoDeclarationsSum, ')
          ..write('teamTwoFails: $teamTwoFails, ')
          ..write('selectedCards: $selectedCards, ')
          ..write('trumpCards: $trumpCards, ')
          ..write('team: $team')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      deletedAt,
      roundId,
      teamOneDeclarations,
      teamOneDeclarationsSum,
      teamOneFails,
      teamTwoDeclarations,
      teamTwoDeclarationsSum,
      teamTwoFails,
      selectedCards,
      trumpCards,
      team);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalculatorResultTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.roundId == this.roundId &&
          other.teamOneDeclarations == this.teamOneDeclarations &&
          other.teamOneDeclarationsSum == this.teamOneDeclarationsSum &&
          other.teamOneFails == this.teamOneFails &&
          other.teamTwoDeclarations == this.teamTwoDeclarations &&
          other.teamTwoDeclarationsSum == this.teamTwoDeclarationsSum &&
          other.teamTwoFails == this.teamTwoFails &&
          other.selectedCards == this.selectedCards &&
          other.trumpCards == this.trumpCards &&
          other.team == this.team);
}

class CalculatorResultTableCompanion
    extends UpdateCompanion<CalculatorResultTableData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> roundId;
  final Value<int?> teamOneDeclarations;
  final Value<int?> teamOneDeclarationsSum;
  final Value<int?> teamOneFails;
  final Value<int?> teamTwoDeclarations;
  final Value<int?> teamTwoDeclarationsSum;
  final Value<int?> teamTwoFails;
  final Value<String?> selectedCards;
  final Value<String?> trumpCards;
  final Value<String?> team;
  final Value<int> rowid;
  const CalculatorResultTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.roundId = const Value.absent(),
    this.teamOneDeclarations = const Value.absent(),
    this.teamOneDeclarationsSum = const Value.absent(),
    this.teamOneFails = const Value.absent(),
    this.teamTwoDeclarations = const Value.absent(),
    this.teamTwoDeclarationsSum = const Value.absent(),
    this.teamTwoFails = const Value.absent(),
    this.selectedCards = const Value.absent(),
    this.trumpCards = const Value.absent(),
    this.team = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalculatorResultTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String roundId,
    this.teamOneDeclarations = const Value.absent(),
    this.teamOneDeclarationsSum = const Value.absent(),
    this.teamOneFails = const Value.absent(),
    this.teamTwoDeclarations = const Value.absent(),
    this.teamTwoDeclarationsSum = const Value.absent(),
    this.teamTwoFails = const Value.absent(),
    this.selectedCards = const Value.absent(),
    this.trumpCards = const Value.absent(),
    this.team = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : roundId = Value(roundId);
  static Insertable<CalculatorResultTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? roundId,
    Expression<int>? teamOneDeclarations,
    Expression<int>? teamOneDeclarationsSum,
    Expression<int>? teamOneFails,
    Expression<int>? teamTwoDeclarations,
    Expression<int>? teamTwoDeclarationsSum,
    Expression<int>? teamTwoFails,
    Expression<String>? selectedCards,
    Expression<String>? trumpCards,
    Expression<String>? team,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (roundId != null) 'round_id': roundId,
      if (teamOneDeclarations != null)
        'team_one_declarations': teamOneDeclarations,
      if (teamOneDeclarationsSum != null)
        'team_one_declarations_sum': teamOneDeclarationsSum,
      if (teamOneFails != null) 'team_one_fails': teamOneFails,
      if (teamTwoDeclarations != null)
        'team_two_declarations': teamTwoDeclarations,
      if (teamTwoDeclarationsSum != null)
        'team_two_declarations_sum': teamTwoDeclarationsSum,
      if (teamTwoFails != null) 'team_two_fails': teamTwoFails,
      if (selectedCards != null) 'selected_cards': selectedCards,
      if (trumpCards != null) 'trump_cards': trumpCards,
      if (team != null) 'team': team,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalculatorResultTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<String>? roundId,
      Value<int?>? teamOneDeclarations,
      Value<int?>? teamOneDeclarationsSum,
      Value<int?>? teamOneFails,
      Value<int?>? teamTwoDeclarations,
      Value<int?>? teamTwoDeclarationsSum,
      Value<int?>? teamTwoFails,
      Value<String?>? selectedCards,
      Value<String?>? trumpCards,
      Value<String?>? team,
      Value<int>? rowid}) {
    return CalculatorResultTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      roundId: roundId ?? this.roundId,
      teamOneDeclarations: teamOneDeclarations ?? this.teamOneDeclarations,
      teamOneDeclarationsSum:
          teamOneDeclarationsSum ?? this.teamOneDeclarationsSum,
      teamOneFails: teamOneFails ?? this.teamOneFails,
      teamTwoDeclarations: teamTwoDeclarations ?? this.teamTwoDeclarations,
      teamTwoDeclarationsSum:
          teamTwoDeclarationsSum ?? this.teamTwoDeclarationsSum,
      teamTwoFails: teamTwoFails ?? this.teamTwoFails,
      selectedCards: selectedCards ?? this.selectedCards,
      trumpCards: trumpCards ?? this.trumpCards,
      team: team ?? this.team,
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
    if (roundId.present) {
      map['round_id'] = Variable<String>(roundId.value);
    }
    if (teamOneDeclarations.present) {
      map['team_one_declarations'] = Variable<int>(teamOneDeclarations.value);
    }
    if (teamOneDeclarationsSum.present) {
      map['team_one_declarations_sum'] =
          Variable<int>(teamOneDeclarationsSum.value);
    }
    if (teamOneFails.present) {
      map['team_one_fails'] = Variable<int>(teamOneFails.value);
    }
    if (teamTwoDeclarations.present) {
      map['team_two_declarations'] = Variable<int>(teamTwoDeclarations.value);
    }
    if (teamTwoDeclarationsSum.present) {
      map['team_two_declarations_sum'] =
          Variable<int>(teamTwoDeclarationsSum.value);
    }
    if (teamTwoFails.present) {
      map['team_two_fails'] = Variable<int>(teamTwoFails.value);
    }
    if (selectedCards.present) {
      map['selected_cards'] = Variable<String>(selectedCards.value);
    }
    if (trumpCards.present) {
      map['trump_cards'] = Variable<String>(trumpCards.value);
    }
    if (team.present) {
      map['team'] = Variable<String>(team.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalculatorResultTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('roundId: $roundId, ')
          ..write('teamOneDeclarations: $teamOneDeclarations, ')
          ..write('teamOneDeclarationsSum: $teamOneDeclarationsSum, ')
          ..write('teamOneFails: $teamOneFails, ')
          ..write('teamTwoDeclarations: $teamTwoDeclarations, ')
          ..write('teamTwoDeclarationsSum: $teamTwoDeclarationsSum, ')
          ..write('teamTwoFails: $teamTwoFails, ')
          ..write('selectedCards: $selectedCards, ')
          ..write('trumpCards: $trumpCards, ')
          ..write('team: $team, ')
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
  late final $SettingsTableTable settingsTable = $SettingsTableTable(this);
  late final $CalculatorResultTableTable calculatorResultTable =
      $CalculatorResultTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [gameTable, roundTable, settingsTable, calculatorResultTable];
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
  Value<int?> teamOneWins,
  Value<int?> teamTwoWins,
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
  Value<int?> teamOneWins,
  Value<int?> teamTwoWins,
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

  ColumnFilters<int> get teamOneWins => $composableBuilder(
      column: $table.teamOneWins, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamTwoWins => $composableBuilder(
      column: $table.teamTwoWins, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<int> get teamOneWins => $composableBuilder(
      column: $table.teamOneWins, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamTwoWins => $composableBuilder(
      column: $table.teamTwoWins, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get teamOneWins => $composableBuilder(
      column: $table.teamOneWins, builder: (column) => column);

  GeneratedColumn<int> get teamTwoWins => $composableBuilder(
      column: $table.teamTwoWins, builder: (column) => column);

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
            Value<int?> teamOneWins = const Value.absent(),
            Value<int?> teamTwoWins = const Value.absent(),
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
            teamOneWins: teamOneWins,
            teamTwoWins: teamTwoWins,
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
            Value<int?> teamOneWins = const Value.absent(),
            Value<int?> teamTwoWins = const Value.absent(),
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
            teamOneWins: teamOneWins,
            teamTwoWins: teamTwoWins,
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
  Value<int?> us20,
  Value<int?> us50,
  Value<int?> us100,
  Value<int?> us150,
  Value<int?> us200,
  Value<int?> them20,
  Value<int?> them50,
  Value<int?> them100,
  Value<int?> them150,
  Value<int?> them200,
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
  Value<int?> us20,
  Value<int?> us50,
  Value<int?> us100,
  Value<int?> us150,
  Value<int?> us200,
  Value<int?> them20,
  Value<int?> them50,
  Value<int?> them100,
  Value<int?> them150,
  Value<int?> them200,
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

  static MultiTypedResultKey<$CalculatorResultTableTable,
      List<CalculatorResultTableData>> _calculatorResultTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.calculatorResultTable,
          aliasName: $_aliasNameGenerator(
              db.roundTable.id, db.calculatorResultTable.roundId));

  $$CalculatorResultTableTableProcessedTableManager
      get calculatorResultTableRefs {
    final manager = $$CalculatorResultTableTableTableManager(
            $_db, $_db.calculatorResultTable)
        .filter((f) => f.roundId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_calculatorResultTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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

  ColumnFilters<int> get us20 => $composableBuilder(
      column: $table.us20, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get us50 => $composableBuilder(
      column: $table.us50, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get us100 => $composableBuilder(
      column: $table.us100, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get us150 => $composableBuilder(
      column: $table.us150, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get us200 => $composableBuilder(
      column: $table.us200, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get them20 => $composableBuilder(
      column: $table.them20, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get them50 => $composableBuilder(
      column: $table.them50, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get them100 => $composableBuilder(
      column: $table.them100, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get them150 => $composableBuilder(
      column: $table.them150, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get them200 => $composableBuilder(
      column: $table.them200, builder: (column) => ColumnFilters(column));

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

  Expression<bool> calculatorResultTableRefs(
      Expression<bool> Function($$CalculatorResultTableTableFilterComposer f)
          f) {
    final $$CalculatorResultTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.calculatorResultTable,
            getReferencedColumn: (t) => t.roundId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CalculatorResultTableTableFilterComposer(
                  $db: $db,
                  $table: $db.calculatorResultTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
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

  ColumnOrderings<int> get us20 => $composableBuilder(
      column: $table.us20, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get us50 => $composableBuilder(
      column: $table.us50, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get us100 => $composableBuilder(
      column: $table.us100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get us150 => $composableBuilder(
      column: $table.us150, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get us200 => $composableBuilder(
      column: $table.us200, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get them20 => $composableBuilder(
      column: $table.them20, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get them50 => $composableBuilder(
      column: $table.them50, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get them100 => $composableBuilder(
      column: $table.them100, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get them150 => $composableBuilder(
      column: $table.them150, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get them200 => $composableBuilder(
      column: $table.them200, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<int> get us20 =>
      $composableBuilder(column: $table.us20, builder: (column) => column);

  GeneratedColumn<int> get us50 =>
      $composableBuilder(column: $table.us50, builder: (column) => column);

  GeneratedColumn<int> get us100 =>
      $composableBuilder(column: $table.us100, builder: (column) => column);

  GeneratedColumn<int> get us150 =>
      $composableBuilder(column: $table.us150, builder: (column) => column);

  GeneratedColumn<int> get us200 =>
      $composableBuilder(column: $table.us200, builder: (column) => column);

  GeneratedColumn<int> get them20 =>
      $composableBuilder(column: $table.them20, builder: (column) => column);

  GeneratedColumn<int> get them50 =>
      $composableBuilder(column: $table.them50, builder: (column) => column);

  GeneratedColumn<int> get them100 =>
      $composableBuilder(column: $table.them100, builder: (column) => column);

  GeneratedColumn<int> get them150 =>
      $composableBuilder(column: $table.them150, builder: (column) => column);

  GeneratedColumn<int> get them200 =>
      $composableBuilder(column: $table.them200, builder: (column) => column);

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

  Expression<T> calculatorResultTableRefs<T extends Object>(
      Expression<T> Function($$CalculatorResultTableTableAnnotationComposer a)
          f) {
    final $$CalculatorResultTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.calculatorResultTable,
            getReferencedColumn: (t) => t.roundId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CalculatorResultTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.calculatorResultTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
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
    PrefetchHooks Function({bool gameId, bool calculatorResultTableRefs})> {
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
            Value<int?> us20 = const Value.absent(),
            Value<int?> us50 = const Value.absent(),
            Value<int?> us100 = const Value.absent(),
            Value<int?> us150 = const Value.absent(),
            Value<int?> us200 = const Value.absent(),
            Value<int?> them20 = const Value.absent(),
            Value<int?> them50 = const Value.absent(),
            Value<int?> them100 = const Value.absent(),
            Value<int?> them150 = const Value.absent(),
            Value<int?> them200 = const Value.absent(),
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
            us20: us20,
            us50: us50,
            us100: us100,
            us150: us150,
            us200: us200,
            them20: them20,
            them50: them50,
            them100: them100,
            them150: them150,
            them200: them200,
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
            Value<int?> us20 = const Value.absent(),
            Value<int?> us50 = const Value.absent(),
            Value<int?> us100 = const Value.absent(),
            Value<int?> us150 = const Value.absent(),
            Value<int?> us200 = const Value.absent(),
            Value<int?> them20 = const Value.absent(),
            Value<int?> them50 = const Value.absent(),
            Value<int?> them100 = const Value.absent(),
            Value<int?> them150 = const Value.absent(),
            Value<int?> them200 = const Value.absent(),
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
            us20: us20,
            us50: us50,
            us100: us100,
            us150: us150,
            us200: us200,
            them20: them20,
            them50: them50,
            them100: them100,
            them150: them150,
            them200: them200,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoundTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {gameId = false, calculatorResultTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (calculatorResultTableRefs) db.calculatorResultTable
              ],
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
                return [
                  if (calculatorResultTableRefs)
                    await $_getPrefetchedData<RoundTableData, $RoundTableTable,
                            CalculatorResultTableData>(
                        currentTable: table,
                        referencedTable: $$RoundTableTableReferences
                            ._calculatorResultTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoundTableTableReferences(db, table, p0)
                                .calculatorResultTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.roundId == item.id),
                        typedResults: items)
                ];
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
    PrefetchHooks Function({bool gameId, bool calculatorResultTableRefs})>;
typedef $$SettingsTableTableCreateCompanionBuilder = SettingsTableCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> showRules,
  Value<bool> showHelpDialog,
  Value<bool> showGameStats,
  Value<bool> showSmartCalculator,
  Value<bool> lockPreviousRounds,
  Value<int> themeMode,
  Value<bool> ecoMode,
  Value<int> roundSortOrder,
  Value<bool> keepScreenOn,
  Value<int> rowid,
});
typedef $$SettingsTableTableUpdateCompanionBuilder = SettingsTableCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> showRules,
  Value<bool> showHelpDialog,
  Value<bool> showGameStats,
  Value<bool> showSmartCalculator,
  Value<bool> lockPreviousRounds,
  Value<int> themeMode,
  Value<bool> ecoMode,
  Value<int> roundSortOrder,
  Value<bool> keepScreenOn,
  Value<int> rowid,
});

class $$SettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableFilterComposer({
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

  ColumnFilters<bool> get showRules => $composableBuilder(
      column: $table.showRules, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get showHelpDialog => $composableBuilder(
      column: $table.showHelpDialog,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get showGameStats => $composableBuilder(
      column: $table.showGameStats, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get showSmartCalculator => $composableBuilder(
      column: $table.showSmartCalculator,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get lockPreviousRounds => $composableBuilder(
      column: $table.lockPreviousRounds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get themeMode => $composableBuilder(
      column: $table.themeMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ecoMode => $composableBuilder(
      column: $table.ecoMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get roundSortOrder => $composableBuilder(
      column: $table.roundSortOrder,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get keepScreenOn => $composableBuilder(
      column: $table.keepScreenOn, builder: (column) => ColumnFilters(column));
}

class $$SettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableOrderingComposer({
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

  ColumnOrderings<bool> get showRules => $composableBuilder(
      column: $table.showRules, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get showHelpDialog => $composableBuilder(
      column: $table.showHelpDialog,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get showGameStats => $composableBuilder(
      column: $table.showGameStats,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get showSmartCalculator => $composableBuilder(
      column: $table.showSmartCalculator,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get lockPreviousRounds => $composableBuilder(
      column: $table.lockPreviousRounds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get themeMode => $composableBuilder(
      column: $table.themeMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ecoMode => $composableBuilder(
      column: $table.ecoMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get roundSortOrder => $composableBuilder(
      column: $table.roundSortOrder,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get keepScreenOn => $composableBuilder(
      column: $table.keepScreenOn,
      builder: (column) => ColumnOrderings(column));
}

class $$SettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableAnnotationComposer({
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

  GeneratedColumn<bool> get showRules =>
      $composableBuilder(column: $table.showRules, builder: (column) => column);

  GeneratedColumn<bool> get showHelpDialog => $composableBuilder(
      column: $table.showHelpDialog, builder: (column) => column);

  GeneratedColumn<bool> get showGameStats => $composableBuilder(
      column: $table.showGameStats, builder: (column) => column);

  GeneratedColumn<bool> get showSmartCalculator => $composableBuilder(
      column: $table.showSmartCalculator, builder: (column) => column);

  GeneratedColumn<bool> get lockPreviousRounds => $composableBuilder(
      column: $table.lockPreviousRounds, builder: (column) => column);

  GeneratedColumn<int> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<bool> get ecoMode =>
      $composableBuilder(column: $table.ecoMode, builder: (column) => column);

  GeneratedColumn<int> get roundSortOrder => $composableBuilder(
      column: $table.roundSortOrder, builder: (column) => column);

  GeneratedColumn<bool> get keepScreenOn => $composableBuilder(
      column: $table.keepScreenOn, builder: (column) => column);
}

class $$SettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTableTable,
    SettingsTableData,
    $$SettingsTableTableFilterComposer,
    $$SettingsTableTableOrderingComposer,
    $$SettingsTableTableAnnotationComposer,
    $$SettingsTableTableCreateCompanionBuilder,
    $$SettingsTableTableUpdateCompanionBuilder,
    (
      SettingsTableData,
      BaseReferences<_$AppDatabase, $SettingsTableTable, SettingsTableData>
    ),
    SettingsTableData,
    PrefetchHooks Function()> {
  $$SettingsTableTableTableManager(_$AppDatabase db, $SettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> showRules = const Value.absent(),
            Value<bool> showHelpDialog = const Value.absent(),
            Value<bool> showGameStats = const Value.absent(),
            Value<bool> showSmartCalculator = const Value.absent(),
            Value<bool> lockPreviousRounds = const Value.absent(),
            Value<int> themeMode = const Value.absent(),
            Value<bool> ecoMode = const Value.absent(),
            Value<int> roundSortOrder = const Value.absent(),
            Value<bool> keepScreenOn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsTableCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            showRules: showRules,
            showHelpDialog: showHelpDialog,
            showGameStats: showGameStats,
            showSmartCalculator: showSmartCalculator,
            lockPreviousRounds: lockPreviousRounds,
            themeMode: themeMode,
            ecoMode: ecoMode,
            roundSortOrder: roundSortOrder,
            keepScreenOn: keepScreenOn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> showRules = const Value.absent(),
            Value<bool> showHelpDialog = const Value.absent(),
            Value<bool> showGameStats = const Value.absent(),
            Value<bool> showSmartCalculator = const Value.absent(),
            Value<bool> lockPreviousRounds = const Value.absent(),
            Value<int> themeMode = const Value.absent(),
            Value<bool> ecoMode = const Value.absent(),
            Value<int> roundSortOrder = const Value.absent(),
            Value<bool> keepScreenOn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            showRules: showRules,
            showHelpDialog: showHelpDialog,
            showGameStats: showGameStats,
            showSmartCalculator: showSmartCalculator,
            lockPreviousRounds: lockPreviousRounds,
            themeMode: themeMode,
            ecoMode: ecoMode,
            roundSortOrder: roundSortOrder,
            keepScreenOn: keepScreenOn,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingsTableTable,
    SettingsTableData,
    $$SettingsTableTableFilterComposer,
    $$SettingsTableTableOrderingComposer,
    $$SettingsTableTableAnnotationComposer,
    $$SettingsTableTableCreateCompanionBuilder,
    $$SettingsTableTableUpdateCompanionBuilder,
    (
      SettingsTableData,
      BaseReferences<_$AppDatabase, $SettingsTableTable, SettingsTableData>
    ),
    SettingsTableData,
    PrefetchHooks Function()>;
typedef $$CalculatorResultTableTableCreateCompanionBuilder
    = CalculatorResultTableCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  required String roundId,
  Value<int?> teamOneDeclarations,
  Value<int?> teamOneDeclarationsSum,
  Value<int?> teamOneFails,
  Value<int?> teamTwoDeclarations,
  Value<int?> teamTwoDeclarationsSum,
  Value<int?> teamTwoFails,
  Value<String?> selectedCards,
  Value<String?> trumpCards,
  Value<String?> team,
  Value<int> rowid,
});
typedef $$CalculatorResultTableTableUpdateCompanionBuilder
    = CalculatorResultTableCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> roundId,
  Value<int?> teamOneDeclarations,
  Value<int?> teamOneDeclarationsSum,
  Value<int?> teamOneFails,
  Value<int?> teamTwoDeclarations,
  Value<int?> teamTwoDeclarationsSum,
  Value<int?> teamTwoFails,
  Value<String?> selectedCards,
  Value<String?> trumpCards,
  Value<String?> team,
  Value<int> rowid,
});

final class $$CalculatorResultTableTableReferences extends BaseReferences<
    _$AppDatabase, $CalculatorResultTableTable, CalculatorResultTableData> {
  $$CalculatorResultTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoundTableTable _roundIdTable(_$AppDatabase db) =>
      db.roundTable.createAlias($_aliasNameGenerator(
          db.calculatorResultTable.roundId, db.roundTable.id));

  $$RoundTableTableProcessedTableManager get roundId {
    final $_column = $_itemColumn<String>('round_id')!;

    final manager = $$RoundTableTableTableManager($_db, $_db.roundTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CalculatorResultTableTableFilterComposer
    extends Composer<_$AppDatabase, $CalculatorResultTableTable> {
  $$CalculatorResultTableTableFilterComposer({
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

  ColumnFilters<int> get teamOneDeclarations => $composableBuilder(
      column: $table.teamOneDeclarations,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamOneDeclarationsSum => $composableBuilder(
      column: $table.teamOneDeclarationsSum,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamOneFails => $composableBuilder(
      column: $table.teamOneFails, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamTwoDeclarations => $composableBuilder(
      column: $table.teamTwoDeclarations,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamTwoDeclarationsSum => $composableBuilder(
      column: $table.teamTwoDeclarationsSum,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teamTwoFails => $composableBuilder(
      column: $table.teamTwoFails, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get selectedCards => $composableBuilder(
      column: $table.selectedCards, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trumpCards => $composableBuilder(
      column: $table.trumpCards, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get team => $composableBuilder(
      column: $table.team, builder: (column) => ColumnFilters(column));

  $$RoundTableTableFilterComposer get roundId {
    final $$RoundTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roundId,
        referencedTable: $db.roundTable,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$CalculatorResultTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CalculatorResultTableTable> {
  $$CalculatorResultTableTableOrderingComposer({
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

  ColumnOrderings<int> get teamOneDeclarations => $composableBuilder(
      column: $table.teamOneDeclarations,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamOneDeclarationsSum => $composableBuilder(
      column: $table.teamOneDeclarationsSum,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamOneFails => $composableBuilder(
      column: $table.teamOneFails,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamTwoDeclarations => $composableBuilder(
      column: $table.teamTwoDeclarations,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamTwoDeclarationsSum => $composableBuilder(
      column: $table.teamTwoDeclarationsSum,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teamTwoFails => $composableBuilder(
      column: $table.teamTwoFails,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get selectedCards => $composableBuilder(
      column: $table.selectedCards,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trumpCards => $composableBuilder(
      column: $table.trumpCards, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get team => $composableBuilder(
      column: $table.team, builder: (column) => ColumnOrderings(column));

  $$RoundTableTableOrderingComposer get roundId {
    final $$RoundTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roundId,
        referencedTable: $db.roundTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoundTableTableOrderingComposer(
              $db: $db,
              $table: $db.roundTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CalculatorResultTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalculatorResultTableTable> {
  $$CalculatorResultTableTableAnnotationComposer({
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

  GeneratedColumn<int> get teamOneDeclarations => $composableBuilder(
      column: $table.teamOneDeclarations, builder: (column) => column);

  GeneratedColumn<int> get teamOneDeclarationsSum => $composableBuilder(
      column: $table.teamOneDeclarationsSum, builder: (column) => column);

  GeneratedColumn<int> get teamOneFails => $composableBuilder(
      column: $table.teamOneFails, builder: (column) => column);

  GeneratedColumn<int> get teamTwoDeclarations => $composableBuilder(
      column: $table.teamTwoDeclarations, builder: (column) => column);

  GeneratedColumn<int> get teamTwoDeclarationsSum => $composableBuilder(
      column: $table.teamTwoDeclarationsSum, builder: (column) => column);

  GeneratedColumn<int> get teamTwoFails => $composableBuilder(
      column: $table.teamTwoFails, builder: (column) => column);

  GeneratedColumn<String> get selectedCards => $composableBuilder(
      column: $table.selectedCards, builder: (column) => column);

  GeneratedColumn<String> get trumpCards => $composableBuilder(
      column: $table.trumpCards, builder: (column) => column);

  GeneratedColumn<String> get team =>
      $composableBuilder(column: $table.team, builder: (column) => column);

  $$RoundTableTableAnnotationComposer get roundId {
    final $$RoundTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roundId,
        referencedTable: $db.roundTable,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$CalculatorResultTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CalculatorResultTableTable,
    CalculatorResultTableData,
    $$CalculatorResultTableTableFilterComposer,
    $$CalculatorResultTableTableOrderingComposer,
    $$CalculatorResultTableTableAnnotationComposer,
    $$CalculatorResultTableTableCreateCompanionBuilder,
    $$CalculatorResultTableTableUpdateCompanionBuilder,
    (CalculatorResultTableData, $$CalculatorResultTableTableReferences),
    CalculatorResultTableData,
    PrefetchHooks Function({bool roundId})> {
  $$CalculatorResultTableTableTableManager(
      _$AppDatabase db, $CalculatorResultTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalculatorResultTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CalculatorResultTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalculatorResultTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> roundId = const Value.absent(),
            Value<int?> teamOneDeclarations = const Value.absent(),
            Value<int?> teamOneDeclarationsSum = const Value.absent(),
            Value<int?> teamOneFails = const Value.absent(),
            Value<int?> teamTwoDeclarations = const Value.absent(),
            Value<int?> teamTwoDeclarationsSum = const Value.absent(),
            Value<int?> teamTwoFails = const Value.absent(),
            Value<String?> selectedCards = const Value.absent(),
            Value<String?> trumpCards = const Value.absent(),
            Value<String?> team = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CalculatorResultTableCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            roundId: roundId,
            teamOneDeclarations: teamOneDeclarations,
            teamOneDeclarationsSum: teamOneDeclarationsSum,
            teamOneFails: teamOneFails,
            teamTwoDeclarations: teamTwoDeclarations,
            teamTwoDeclarationsSum: teamTwoDeclarationsSum,
            teamTwoFails: teamTwoFails,
            selectedCards: selectedCards,
            trumpCards: trumpCards,
            team: team,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required String roundId,
            Value<int?> teamOneDeclarations = const Value.absent(),
            Value<int?> teamOneDeclarationsSum = const Value.absent(),
            Value<int?> teamOneFails = const Value.absent(),
            Value<int?> teamTwoDeclarations = const Value.absent(),
            Value<int?> teamTwoDeclarationsSum = const Value.absent(),
            Value<int?> teamTwoFails = const Value.absent(),
            Value<String?> selectedCards = const Value.absent(),
            Value<String?> trumpCards = const Value.absent(),
            Value<String?> team = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CalculatorResultTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            roundId: roundId,
            teamOneDeclarations: teamOneDeclarations,
            teamOneDeclarationsSum: teamOneDeclarationsSum,
            teamOneFails: teamOneFails,
            teamTwoDeclarations: teamTwoDeclarations,
            teamTwoDeclarationsSum: teamTwoDeclarationsSum,
            teamTwoFails: teamTwoFails,
            selectedCards: selectedCards,
            trumpCards: trumpCards,
            team: team,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CalculatorResultTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({roundId = false}) {
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
                if (roundId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roundId,
                    referencedTable: $$CalculatorResultTableTableReferences
                        ._roundIdTable(db),
                    referencedColumn: $$CalculatorResultTableTableReferences
                        ._roundIdTable(db)
                        .id,
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

typedef $$CalculatorResultTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CalculatorResultTableTable,
        CalculatorResultTableData,
        $$CalculatorResultTableTableFilterComposer,
        $$CalculatorResultTableTableOrderingComposer,
        $$CalculatorResultTableTableAnnotationComposer,
        $$CalculatorResultTableTableCreateCompanionBuilder,
        $$CalculatorResultTableTableUpdateCompanionBuilder,
        (CalculatorResultTableData, $$CalculatorResultTableTableReferences),
        CalculatorResultTableData,
        PrefetchHooks Function({bool roundId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GameTableTableTableManager get gameTable =>
      $$GameTableTableTableManager(_db, _db.gameTable);
  $$RoundTableTableTableManager get roundTable =>
      $$RoundTableTableTableManager(_db, _db.roundTable);
  $$SettingsTableTableTableManager get settingsTable =>
      $$SettingsTableTableTableManager(_db, _db.settingsTable);
  $$CalculatorResultTableTableTableManager get calculatorResultTable =>
      $$CalculatorResultTableTableTableManager(_db, _db.calculatorResultTable);
}
