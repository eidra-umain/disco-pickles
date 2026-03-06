import 'package:drift/drift.dart';
import 'package:libresse_cycle/core/data/app_database.dart';
import 'package:libresse_cycle/core/data/tables/cycle_tables.dart';

part 'cycle_dao.g.dart';

@DriftAccessor(tables: [Cycles])
class CycleDao extends DatabaseAccessor<AppDatabase> with _$CycleDaoMixin {
  CycleDao(super.attachedDatabase);

  Future<List<Cycle>> getAllCycles() =>
      (select(cycles)..orderBy([(t) => OrderingTerm.desc(t.startDate)])).get();

  Stream<List<Cycle>> watchAllCycles() => (select(
    cycles,
  )..orderBy([(t) => OrderingTerm.desc(t.startDate)])).watch();

  Future<Cycle?> getLatestCycle() =>
      (select(cycles)
            ..orderBy([(t) => OrderingTerm.desc(t.startDate)])
            ..limit(1))
          .getSingleOrNull();

  Stream<Cycle?> watchLatestCycle() =>
      (select(cycles)
            ..orderBy([(t) => OrderingTerm.desc(t.startDate)])
            ..limit(1))
          .watchSingleOrNull();

  Future<Cycle> getCycleById(int id) =>
      (select(cycles)..where((t) => t.id.equals(id))).getSingle();

  Future<int> insertCycle(CyclesCompanion entry) => into(cycles).insert(entry);

  Future<void> updateCycleById(
    int cycleId,
    CyclesCompanion entry,
  ) => (update(cycles)..where((t) => t.id.equals(cycleId))).write(entry);

  Future<int> deleteCycle(int id) =>
      (delete(cycles)..where((t) => t.id.equals(id))).go();

  Future<int> deleteAllCycles() => delete(cycles).go();

  Future<int> getCycleCount() async {
    final count = cycles.id.count();
    final query = selectOnly(cycles)..addColumns([count]);
    final row = await query.getSingle();
    return row.read(count) ?? 0;
  }
}
