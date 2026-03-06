import 'package:drift/drift.dart';
import 'package:libresse_cycle/core/data/daos/cycle_dao.dart';
import 'package:libresse_cycle/core/data/daos/daily_log_dao.dart';
import 'package:libresse_cycle/core/data/daos/user_settings_dao.dart';
import 'package:libresse_cycle/core/data/tables/cycle_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Cycles, DailyLogs, UserSettings],
  daos: [CycleDao, DailyLogDao, UserSettingsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) => m.createAll(),
      onUpgrade: (m, from, to) async {
        // Future migrations go here.
        // Example for v2:
        // if (from < 2) {
        //   await m.addColumn(dailyLogs, dailyLogs.newColumn);
        // }
      },
    );
  }
}
