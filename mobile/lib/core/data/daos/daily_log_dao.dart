import 'package:drift/drift.dart';
import 'package:libresse_cycle/core/data/app_database.dart';
import 'package:libresse_cycle/core/data/tables/cycle_tables.dart';

part 'daily_log_dao.g.dart';

@DriftAccessor(tables: [DailyLogs])
class DailyLogDao extends DatabaseAccessor<AppDatabase>
    with _$DailyLogDaoMixin {
  DailyLogDao(super.attachedDatabase);

  Future<List<DailyLog>> getAllLogs() =>
      (select(dailyLogs)..orderBy([(t) => OrderingTerm.desc(t.logDate)])).get();

  Stream<List<DailyLog>> watchAllLogs() => (select(
    dailyLogs,
  )..orderBy([(t) => OrderingTerm.desc(t.logDate)])).watch();

  Future<DailyLog?> getLogForDate(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return (select(
      dailyLogs,
    )..where((t) => t.logDate.equals(dateOnly))).getSingleOrNull();
  }

  Stream<DailyLog?> watchLogForDate(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return (select(
      dailyLogs,
    )..where((t) => t.logDate.equals(dateOnly))).watchSingleOrNull();
  }

  Future<List<DailyLog>> getLogsForCycle(int cycleId) =>
      (select(dailyLogs)
            ..where((t) => t.cycleId.equals(cycleId))
            ..orderBy([(t) => OrderingTerm.asc(t.logDate)]))
          .get();

  Future<List<DailyLog>> getLogsBetween(DateTime start, DateTime end) =>
      (select(dailyLogs)
            ..where(
              (t) =>
                  t.logDate.isBiggerOrEqualValue(start) &
                  t.logDate.isSmallerOrEqualValue(end),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.logDate)]))
          .get();

  /// Upsert: insert or replace log for a given date.
  Future<int> upsertLog(DailyLogsCompanion entry) => into(dailyLogs).insert(
    entry,
    mode: InsertMode.insertOrReplace,
  );

  Future<int> deleteLog(int id) =>
      (delete(dailyLogs)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAllLogs() => delete(dailyLogs).go();
}
