import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

abstract class BaseUUIDModel extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
