import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:libresse_cycle/core/data/app_database.dart';

/// High-level API for cycle tracking operations.
/// Wraps DAOs and provides business-logic-aware methods.
class CycleRepository {
  CycleRepository(this._db);

  final AppDatabase _db;

  // --- Cycles ---

  Stream<List<Cycle>> watchAllCycles() => _db.cycleDao.watchAllCycles();

  Stream<Cycle?> watchLatestCycle() => _db.cycleDao.watchLatestCycle();

  Future<int> startNewCycle({required DateTime startDate}) {
    return _db.cycleDao.insertCycle(
      CyclesCompanion.insert(startDate: startDate),
    );
  }

  Future<void> endCycle({
    required int cycleId,
    required DateTime endDate,
  }) async {
    final cycle = await _db.cycleDao.getCycleById(cycleId);
    final length = endDate.difference(cycle.startDate).inDays;
    await (_db.update(_db.cycles)..where((t) => t.id.equals(cycleId))).write(
      CyclesCompanion(
        endDate: Value(endDate),
        cycleLength: Value(length),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> getCycleCount() => _db.cycleDao.getCycleCount();

  Future<int> deleteAllCycles() => _db.cycleDao.deleteAllCycles();

  // --- Daily Logs ---

  Stream<List<DailyLog>> watchAllLogs() => _db.dailyLogDao.watchAllLogs();

  Stream<DailyLog?> watchLogForToday() =>
      _db.dailyLogDao.watchLogForDate(DateTime.now());

  Future<DailyLog?> getLogForDate(DateTime date) =>
      _db.dailyLogDao.getLogForDate(date);

  Future<List<DailyLog>> getLogsForCycle(int cycleId) =>
      _db.dailyLogDao.getLogsForCycle(cycleId);

  /// Log or update today's entry. Moods and symptoms are stored as JSON arrays.
  Future<int> logDay({
    required DateTime date,
    int? cycleId,
    int? cycleDay,
    String? flow,
    List<String>? moods,
    List<String>? symptoms,
    int? painLevel,
    String? notes,
  }) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return _db.dailyLogDao.upsertLog(
      DailyLogsCompanion(
        logDate: Value(dateOnly),
        cycleId: Value(cycleId),
        cycleDay: Value(cycleDay),
        flow: Value(flow),
        moods: Value(jsonEncode(moods ?? [])),
        symptoms: Value(jsonEncode(symptoms ?? [])),
        painLevel: Value(painLevel),
        notes: Value(notes),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> deleteAllLogs() => _db.dailyLogDao.deleteAllLogs();

  // --- User Settings ---

  Stream<UserSetting?> watchSettings() => _db.userSettingsDao.watchSettings();

  Future<UserSetting> getOrCreateSettings() =>
      _db.userSettingsDao.getOrCreateSettings();

  Future<void> completeOnboarding({
    required DateTime lastPeriodDate,
    required int typicalCycleLength,
    required int typicalPeriodLength,
  }) {
    return _db.userSettingsDao.updateSettings(
      UserSettingsCompanion(
        lastPeriodDate: Value(lastPeriodDate),
        typicalCycleLength: Value(typicalCycleLength),
        typicalPeriodLength: Value(typicalPeriodLength),
        onboardingCompleted: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> updateDiscreetMode({required bool enabled}) {
    return _db.userSettingsDao.updateSettings(
      UserSettingsCompanion(
        discreetModeEnabled: Value(enabled),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> updateDarkMode({required bool enabled}) {
    return _db.userSettingsDao.updateSettings(
      UserSettingsCompanion(
        darkModeEnabled: Value(enabled),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// Delete all user data — cycle history, logs, and settings.
  Future<void> deleteAllData() async {
    await _db.dailyLogDao.deleteAllLogs();
    await _db.cycleDao.deleteAllCycles();
    await _db.userSettingsDao.deleteAllSettings();
  }

  /// Export all data as a JSON-serializable map.
  Future<Map<String, dynamic>> exportAllData() async {
    final cycles = await _db.cycleDao.getAllCycles();
    final logs = await _db.dailyLogDao.getAllLogs();
    final settings = await _db.userSettingsDao.getSettings();

    return {
      'exportedAt': DateTime.now().toIso8601String(),
      'cycles': cycles
          .map(
            (c) => {
              'id': c.id,
              'startDate': c.startDate.toIso8601String(),
              'endDate': c.endDate?.toIso8601String(),
              'cycleLength': c.cycleLength,
              'periodLength': c.periodLength,
              'isEstimated': c.isEstimated,
            },
          )
          .toList(),
      'dailyLogs': logs
          .map(
            (l) => {
              'logDate': l.logDate.toIso8601String(),
              'cycleDay': l.cycleDay,
              'flow': l.flow,
              'moods': jsonDecode(l.moods),
              'symptoms': jsonDecode(l.symptoms),
              'painLevel': l.painLevel,
              'notes': l.notes,
            },
          )
          .toList(),
      'settings': settings == null
          ? null
          : {
              'typicalCycleLength': settings.typicalCycleLength,
              'typicalPeriodLength': settings.typicalPeriodLength,
              'onboardingCompleted': settings.onboardingCompleted,
            },
    };
  }
}
