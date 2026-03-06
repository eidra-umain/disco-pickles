import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:libresse_cycle/core/data/app_database.dart';
import 'package:libresse_cycle/core/data/repositories/cycle_repository.dart';

void main() {
  late AppDatabase db;
  late CycleRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = CycleRepository(db);
  });

  tearDown(() => db.close());

  group('Cycles', () {
    test('start a new cycle and retrieve it', () async {
      final start = DateTime(2026, 3);
      final id = await repo.startNewCycle(startDate: start);

      expect(id, greaterThan(0));

      final latest = await db.cycleDao.getLatestCycle();
      expect(latest, isNotNull);
      expect(latest!.startDate, start);
      expect(latest.endDate, isNull);
    });

    test('end a cycle calculates length', () async {
      final start = DateTime(2026, 3);
      final end = DateTime(2026, 3, 29);
      final id = await repo.startNewCycle(startDate: start);

      await repo.endCycle(cycleId: id, endDate: end);

      final cycle = await db.cycleDao.getCycleById(id);
      expect(cycle.cycleLength, 28);
      expect(cycle.endDate, end);
    });

    test('getCycleCount returns correct count', () async {
      expect(await repo.getCycleCount(), 0);

      await repo.startNewCycle(startDate: DateTime(2026));
      await repo.startNewCycle(startDate: DateTime(2026, 2));

      expect(await repo.getCycleCount(), 2);
    });
  });

  group('Daily Logs', () {
    test('log a day and retrieve it', () async {
      final date = DateTime(2026, 3, 5);
      await repo.logDay(
        date: date,
        flow: 'heavy',
        moods: ['anxious', 'tired'],
        symptoms: ['cramps', 'headache'],
        painLevel: 7,
      );

      final log = await repo.getLogForDate(date);
      expect(log, isNotNull);
      expect(log!.flow, 'heavy');
      expect(jsonDecode(log.moods), ['anxious', 'tired']);
      expect(jsonDecode(log.symptoms), ['cramps', 'headache']);
      expect(log.painLevel, 7);
    });

    test('upsert replaces log for same date', () async {
      final date = DateTime(2026, 3, 5);

      await repo.logDay(date: date, flow: 'light');
      await repo.logDay(date: date, flow: 'heavy');

      final log = await repo.getLogForDate(date);
      expect(log!.flow, 'heavy');
    });

    test('logs can be retrieved for a cycle', () async {
      final cycleId = await repo.startNewCycle(
        startDate: DateTime(2026, 3),
      );

      await repo.logDay(
        date: DateTime(2026, 3),
        cycleId: cycleId,
        cycleDay: 1,
        flow: 'heavy',
      );
      await repo.logDay(
        date: DateTime(2026, 3, 2),
        cycleId: cycleId,
        cycleDay: 2,
        flow: 'medium',
      );

      final logs = await repo.getLogsForCycle(cycleId);
      expect(logs, hasLength(2));
      expect(logs.first.cycleDay, 1);
      expect(logs.last.cycleDay, 2);
    });
  });

  group('User Settings', () {
    test('getOrCreateSettings creates default settings', () async {
      final settings = await repo.getOrCreateSettings();

      expect(settings.typicalCycleLength, 28);
      expect(settings.typicalPeriodLength, 5);
      expect(settings.onboardingCompleted, isFalse);
      expect(settings.discreetModeEnabled, isFalse);
    });

    test('completeOnboarding updates settings', () async {
      await repo.completeOnboarding(
        lastPeriodDate: DateTime(2026, 2, 20),
        typicalCycleLength: 30,
        typicalPeriodLength: 6,
      );

      final settings = await repo.getOrCreateSettings();
      expect(settings.onboardingCompleted, isTrue);
      expect(settings.typicalCycleLength, 30);
      expect(settings.typicalPeriodLength, 6);
      expect(settings.lastPeriodDate, DateTime(2026, 2, 20));
    });

    test('toggle discreet mode', () async {
      await repo.getOrCreateSettings();
      await repo.updateDiscreetMode(enabled: true);

      final settings = await repo.getOrCreateSettings();
      expect(settings.discreetModeEnabled, isTrue);
    });
  });

  group('Data management', () {
    test('deleteAllData clears everything', () async {
      await repo.startNewCycle(startDate: DateTime(2026, 3));
      await repo.logDay(date: DateTime(2026, 3), flow: 'light');
      await repo.getOrCreateSettings();

      await repo.deleteAllData();

      expect(await repo.getCycleCount(), 0);
      expect(
        await repo.getLogForDate(DateTime(2026, 3)),
        isNull,
      );
      expect(await db.userSettingsDao.getSettings(), isNull);
    });

    test('exportAllData returns structured JSON', () async {
      await repo.startNewCycle(startDate: DateTime(2026, 3));
      await repo.logDay(
        date: DateTime(2026, 3),
        flow: 'medium',
        moods: ['happy'],
      );
      await repo.completeOnboarding(
        lastPeriodDate: DateTime(2026, 2, 20),
        typicalCycleLength: 28,
        typicalPeriodLength: 5,
      );

      final data = await repo.exportAllData();

      expect(data['cycles'], isList);
      expect(data['cycles'] as List<dynamic>, hasLength(1));
      expect(data['dailyLogs'], isList);
      expect(data['dailyLogs'] as List<dynamic>, hasLength(1));
      expect(data['settings'], isNotNull);
      expect(data['exportedAt'], isNotNull);
    });
  });

  group('Offline-first', () {
    test('all operations work without network', () async {
      // This test proves offline-first: in-memory SQLite db
      // with no network dependency.
      final id = await repo.startNewCycle(
        startDate: DateTime(2026, 3),
      );
      await repo.logDay(
        date: DateTime(2026, 3),
        cycleId: id,
        cycleDay: 1,
        flow: 'heavy',
        moods: ['tired'],
        symptoms: ['cramps'],
        painLevel: 6,
        notes: 'First day',
      );
      await repo.completeOnboarding(
        lastPeriodDate: DateTime(2026, 2, 20),
        typicalCycleLength: 28,
        typicalPeriodLength: 5,
      );

      final cycles = await db.cycleDao.getAllCycles();
      final log = await repo.getLogForDate(DateTime(2026, 3));
      final settings = await repo.getOrCreateSettings();

      expect(cycles, hasLength(1));
      expect(log, isNotNull);
      expect(settings.onboardingCompleted, isTrue);
    });
  });
}
