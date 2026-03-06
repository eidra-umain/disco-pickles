import 'package:drift/drift.dart';
import 'package:libresse_cycle/core/data/app_database.dart';
import 'package:libresse_cycle/core/data/tables/cycle_tables.dart';

part 'user_settings_dao.g.dart';

@DriftAccessor(tables: [UserSettings])
class UserSettingsDao extends DatabaseAccessor<AppDatabase>
    with _$UserSettingsDaoMixin {
  UserSettingsDao(super.attachedDatabase);

  Future<UserSetting?> getSettings() => select(userSettings).getSingleOrNull();

  Stream<UserSetting?> watchSettings() =>
      select(userSettings).watchSingleOrNull();

  /// Ensures a single settings row exists, then returns it.
  Future<UserSetting> getOrCreateSettings() async {
    final existing = await getSettings();
    if (existing != null) return existing;

    await into(userSettings).insert(
      UserSettingsCompanion.insert(),
    );
    final created = await getSettings();
    return created!;
  }

  Future<void> updateSettings(UserSettingsCompanion entry) async {
    final current = await getOrCreateSettings();
    await (update(
      userSettings,
    )..where((t) => t.id.equals(current.id))).write(entry);
  }

  Future<int> deleteAllSettings() => delete(userSettings).go();
}
