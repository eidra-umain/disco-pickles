import 'package:drift/drift.dart';

/// Represents a single menstrual cycle from start to next start.
class Cycles extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get cycleLength => integer().nullable()();
  IntColumn get periodLength => integer().nullable()();
  BoolColumn get isEstimated => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

/// Daily log entry capturing flow, mood, symptoms, and pain.
class DailyLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get logDate => dateTime()();
  IntColumn get cycleId => integer().nullable().references(Cycles, #id)();
  IntColumn get cycleDay => integer().nullable()();
  TextColumn get flow => text().nullable()();
  TextColumn get moods => text().withDefault(const Constant('[]'))();
  TextColumn get symptoms => text().withDefault(const Constant('[]'))();
  IntColumn get painLevel => integer().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
    {logDate},
  ];
}

/// User settings and preferences, stored as a single row.
class UserSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get lastPeriodDate => dateTime().nullable()();
  IntColumn get typicalCycleLength =>
      integer().withDefault(const Constant(28))();
  IntColumn get typicalPeriodLength =>
      integer().withDefault(const Constant(5))();
  BoolColumn get onboardingCompleted =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get darkModeEnabled =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get discreetModeEnabled =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get notificationsEnabled =>
      boolean().withDefault(const Constant(false))();
  TextColumn get conditionMode => text().withDefault(const Constant('none'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
