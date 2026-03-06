// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_log_dao.dart';

// ignore_for_file: type=lint
mixin _$DailyLogDaoMixin on DatabaseAccessor<AppDatabase> {
  $CyclesTable get cycles => attachedDatabase.cycles;
  $DailyLogsTable get dailyLogs => attachedDatabase.dailyLogs;
  DailyLogDaoManager get managers => DailyLogDaoManager(this);
}

class DailyLogDaoManager {
  final _$DailyLogDaoMixin _db;
  DailyLogDaoManager(this._db);
  $$CyclesTableTableManager get cycles =>
      $$CyclesTableTableManager(_db.attachedDatabase, _db.cycles);
  $$DailyLogsTableTableManager get dailyLogs =>
      $$DailyLogsTableTableManager(_db.attachedDatabase, _db.dailyLogs);
}
