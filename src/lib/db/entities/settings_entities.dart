import 'package:bela_blok/db/entities/base_model.dart';
import 'package:bela_blok/enums/theme_mode_enum.dart';
import 'package:drift/drift.dart';

class SettingsTable extends BaseUUIDModel {
  BoolColumn get showRules => 
      boolean().withDefault(const Constant(true))();
  BoolColumn get showHelpDialog => 
      boolean().withDefault(const Constant(true))();
  BoolColumn get showGameStats => 
      boolean().withDefault(const Constant(true))();
  IntColumn get themeMode => 
      integer().withDefault(Constant(AppThemeMode.light.index))();

  @override
  String get tableName => 'settings';
}