import 'package:drift/drift.dart';

class AppSettings extends Table {
  TextColumn get id => text().withDefault(const Constant('singleton'))();
  BoolColumn get showRules => boolean().withDefault(const Constant(true))();
  BoolColumn get showHelpDialog => boolean().withDefault(const Constant(true))();
  BoolColumn get showGameStats => boolean().withDefault(const Constant(true))();
  TextColumn get themeMode => text().withDefault(const Constant('light'))(); // 'light' or 'dark'

  @override
  Set<Column> get primaryKey => {id};
}
