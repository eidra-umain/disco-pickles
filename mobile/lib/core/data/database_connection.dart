import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Creates a [LazyDatabase] that stores data in the app's documents
/// directory. All data stays on-device — no cloud sync for core tracking.
LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(
      p.join(dbFolder.path, 'libresse_cycle.sqlite'),
    );
    return NativeDatabase.createInBackground(file);
  });
}
