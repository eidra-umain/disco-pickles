// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CyclesTable extends Cycles with TableInfo<$CyclesTable, Cycle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CyclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cycleLengthMeta = const VerificationMeta(
    'cycleLength',
  );
  @override
  late final GeneratedColumn<int> cycleLength = GeneratedColumn<int>(
    'cycle_length',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _periodLengthMeta = const VerificationMeta(
    'periodLength',
  );
  @override
  late final GeneratedColumn<int> periodLength = GeneratedColumn<int>(
    'period_length',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isEstimatedMeta = const VerificationMeta(
    'isEstimated',
  );
  @override
  late final GeneratedColumn<bool> isEstimated = GeneratedColumn<bool>(
    'is_estimated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_estimated" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startDate,
    endDate,
    cycleLength,
    periodLength,
    isEstimated,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cycles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cycle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('cycle_length')) {
      context.handle(
        _cycleLengthMeta,
        cycleLength.isAcceptableOrUnknown(
          data['cycle_length']!,
          _cycleLengthMeta,
        ),
      );
    }
    if (data.containsKey('period_length')) {
      context.handle(
        _periodLengthMeta,
        periodLength.isAcceptableOrUnknown(
          data['period_length']!,
          _periodLengthMeta,
        ),
      );
    }
    if (data.containsKey('is_estimated')) {
      context.handle(
        _isEstimatedMeta,
        isEstimated.isAcceptableOrUnknown(
          data['is_estimated']!,
          _isEstimatedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cycle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cycle(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      cycleLength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_length'],
      ),
      periodLength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}period_length'],
      ),
      isEstimated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_estimated'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CyclesTable createAlias(String alias) {
    return $CyclesTable(attachedDatabase, alias);
  }
}

class Cycle extends DataClass implements Insertable<Cycle> {
  final int id;
  final DateTime startDate;
  final DateTime? endDate;
  final int? cycleLength;
  final int? periodLength;
  final bool isEstimated;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Cycle({
    required this.id,
    required this.startDate,
    this.endDate,
    this.cycleLength,
    this.periodLength,
    required this.isEstimated,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || cycleLength != null) {
      map['cycle_length'] = Variable<int>(cycleLength);
    }
    if (!nullToAbsent || periodLength != null) {
      map['period_length'] = Variable<int>(periodLength);
    }
    map['is_estimated'] = Variable<bool>(isEstimated);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CyclesCompanion toCompanion(bool nullToAbsent) {
    return CyclesCompanion(
      id: Value(id),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      cycleLength: cycleLength == null && nullToAbsent
          ? const Value.absent()
          : Value(cycleLength),
      periodLength: periodLength == null && nullToAbsent
          ? const Value.absent()
          : Value(periodLength),
      isEstimated: Value(isEstimated),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Cycle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cycle(
      id: serializer.fromJson<int>(json['id']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      cycleLength: serializer.fromJson<int?>(json['cycleLength']),
      periodLength: serializer.fromJson<int?>(json['periodLength']),
      isEstimated: serializer.fromJson<bool>(json['isEstimated']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'cycleLength': serializer.toJson<int?>(cycleLength),
      'periodLength': serializer.toJson<int?>(periodLength),
      'isEstimated': serializer.toJson<bool>(isEstimated),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Cycle copyWith({
    int? id,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    Value<int?> cycleLength = const Value.absent(),
    Value<int?> periodLength = const Value.absent(),
    bool? isEstimated,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Cycle(
    id: id ?? this.id,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    cycleLength: cycleLength.present ? cycleLength.value : this.cycleLength,
    periodLength: periodLength.present ? periodLength.value : this.periodLength,
    isEstimated: isEstimated ?? this.isEstimated,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Cycle copyWithCompanion(CyclesCompanion data) {
    return Cycle(
      id: data.id.present ? data.id.value : this.id,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      cycleLength: data.cycleLength.present
          ? data.cycleLength.value
          : this.cycleLength,
      periodLength: data.periodLength.present
          ? data.periodLength.value
          : this.periodLength,
      isEstimated: data.isEstimated.present
          ? data.isEstimated.value
          : this.isEstimated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cycle(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('cycleLength: $cycleLength, ')
          ..write('periodLength: $periodLength, ')
          ..write('isEstimated: $isEstimated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    startDate,
    endDate,
    cycleLength,
    periodLength,
    isEstimated,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cycle &&
          other.id == this.id &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.cycleLength == this.cycleLength &&
          other.periodLength == this.periodLength &&
          other.isEstimated == this.isEstimated &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CyclesCompanion extends UpdateCompanion<Cycle> {
  final Value<int> id;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<int?> cycleLength;
  final Value<int?> periodLength;
  final Value<bool> isEstimated;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CyclesCompanion({
    this.id = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.cycleLength = const Value.absent(),
    this.periodLength = const Value.absent(),
    this.isEstimated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CyclesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.cycleLength = const Value.absent(),
    this.periodLength = const Value.absent(),
    this.isEstimated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : startDate = Value(startDate);
  static Insertable<Cycle> custom({
    Expression<int>? id,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<int>? cycleLength,
    Expression<int>? periodLength,
    Expression<bool>? isEstimated,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (cycleLength != null) 'cycle_length': cycleLength,
      if (periodLength != null) 'period_length': periodLength,
      if (isEstimated != null) 'is_estimated': isEstimated,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CyclesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<int?>? cycleLength,
    Value<int?>? periodLength,
    Value<bool>? isEstimated,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CyclesCompanion(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      cycleLength: cycleLength ?? this.cycleLength,
      periodLength: periodLength ?? this.periodLength,
      isEstimated: isEstimated ?? this.isEstimated,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (cycleLength.present) {
      map['cycle_length'] = Variable<int>(cycleLength.value);
    }
    if (periodLength.present) {
      map['period_length'] = Variable<int>(periodLength.value);
    }
    if (isEstimated.present) {
      map['is_estimated'] = Variable<bool>(isEstimated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CyclesCompanion(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('cycleLength: $cycleLength, ')
          ..write('periodLength: $periodLength, ')
          ..write('isEstimated: $isEstimated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DailyLogsTable extends DailyLogs
    with TableInfo<$DailyLogsTable, DailyLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _logDateMeta = const VerificationMeta(
    'logDate',
  );
  @override
  late final GeneratedColumn<DateTime> logDate = GeneratedColumn<DateTime>(
    'log_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cycleIdMeta = const VerificationMeta(
    'cycleId',
  );
  @override
  late final GeneratedColumn<int> cycleId = GeneratedColumn<int>(
    'cycle_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cycles (id)',
    ),
  );
  static const VerificationMeta _cycleDayMeta = const VerificationMeta(
    'cycleDay',
  );
  @override
  late final GeneratedColumn<int> cycleDay = GeneratedColumn<int>(
    'cycle_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _flowMeta = const VerificationMeta('flow');
  @override
  late final GeneratedColumn<String> flow = GeneratedColumn<String>(
    'flow',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moodsMeta = const VerificationMeta('moods');
  @override
  late final GeneratedColumn<String> moods = GeneratedColumn<String>(
    'moods',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _symptomsMeta = const VerificationMeta(
    'symptoms',
  );
  @override
  late final GeneratedColumn<String> symptoms = GeneratedColumn<String>(
    'symptoms',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _painLevelMeta = const VerificationMeta(
    'painLevel',
  );
  @override
  late final GeneratedColumn<int> painLevel = GeneratedColumn<int>(
    'pain_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    logDate,
    cycleId,
    cycleDay,
    flow,
    moods,
    symptoms,
    painLevel,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('log_date')) {
      context.handle(
        _logDateMeta,
        logDate.isAcceptableOrUnknown(data['log_date']!, _logDateMeta),
      );
    } else if (isInserting) {
      context.missing(_logDateMeta);
    }
    if (data.containsKey('cycle_id')) {
      context.handle(
        _cycleIdMeta,
        cycleId.isAcceptableOrUnknown(data['cycle_id']!, _cycleIdMeta),
      );
    }
    if (data.containsKey('cycle_day')) {
      context.handle(
        _cycleDayMeta,
        cycleDay.isAcceptableOrUnknown(data['cycle_day']!, _cycleDayMeta),
      );
    }
    if (data.containsKey('flow')) {
      context.handle(
        _flowMeta,
        flow.isAcceptableOrUnknown(data['flow']!, _flowMeta),
      );
    }
    if (data.containsKey('moods')) {
      context.handle(
        _moodsMeta,
        moods.isAcceptableOrUnknown(data['moods']!, _moodsMeta),
      );
    }
    if (data.containsKey('symptoms')) {
      context.handle(
        _symptomsMeta,
        symptoms.isAcceptableOrUnknown(data['symptoms']!, _symptomsMeta),
      );
    }
    if (data.containsKey('pain_level')) {
      context.handle(
        _painLevelMeta,
        painLevel.isAcceptableOrUnknown(data['pain_level']!, _painLevelMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {logDate},
  ];
  @override
  DailyLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      logDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}log_date'],
      )!,
      cycleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_id'],
      ),
      cycleDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_day'],
      ),
      flow: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flow'],
      ),
      moods: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moods'],
      )!,
      symptoms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symptoms'],
      )!,
      painLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pain_level'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DailyLogsTable createAlias(String alias) {
    return $DailyLogsTable(attachedDatabase, alias);
  }
}

class DailyLog extends DataClass implements Insertable<DailyLog> {
  final int id;
  final DateTime logDate;
  final int? cycleId;
  final int? cycleDay;
  final String? flow;
  final String moods;
  final String symptoms;
  final int? painLevel;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DailyLog({
    required this.id,
    required this.logDate,
    this.cycleId,
    this.cycleDay,
    this.flow,
    required this.moods,
    required this.symptoms,
    this.painLevel,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['log_date'] = Variable<DateTime>(logDate);
    if (!nullToAbsent || cycleId != null) {
      map['cycle_id'] = Variable<int>(cycleId);
    }
    if (!nullToAbsent || cycleDay != null) {
      map['cycle_day'] = Variable<int>(cycleDay);
    }
    if (!nullToAbsent || flow != null) {
      map['flow'] = Variable<String>(flow);
    }
    map['moods'] = Variable<String>(moods);
    map['symptoms'] = Variable<String>(symptoms);
    if (!nullToAbsent || painLevel != null) {
      map['pain_level'] = Variable<int>(painLevel);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DailyLogsCompanion toCompanion(bool nullToAbsent) {
    return DailyLogsCompanion(
      id: Value(id),
      logDate: Value(logDate),
      cycleId: cycleId == null && nullToAbsent
          ? const Value.absent()
          : Value(cycleId),
      cycleDay: cycleDay == null && nullToAbsent
          ? const Value.absent()
          : Value(cycleDay),
      flow: flow == null && nullToAbsent ? const Value.absent() : Value(flow),
      moods: Value(moods),
      symptoms: Value(symptoms),
      painLevel: painLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(painLevel),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DailyLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyLog(
      id: serializer.fromJson<int>(json['id']),
      logDate: serializer.fromJson<DateTime>(json['logDate']),
      cycleId: serializer.fromJson<int?>(json['cycleId']),
      cycleDay: serializer.fromJson<int?>(json['cycleDay']),
      flow: serializer.fromJson<String?>(json['flow']),
      moods: serializer.fromJson<String>(json['moods']),
      symptoms: serializer.fromJson<String>(json['symptoms']),
      painLevel: serializer.fromJson<int?>(json['painLevel']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'logDate': serializer.toJson<DateTime>(logDate),
      'cycleId': serializer.toJson<int?>(cycleId),
      'cycleDay': serializer.toJson<int?>(cycleDay),
      'flow': serializer.toJson<String?>(flow),
      'moods': serializer.toJson<String>(moods),
      'symptoms': serializer.toJson<String>(symptoms),
      'painLevel': serializer.toJson<int?>(painLevel),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DailyLog copyWith({
    int? id,
    DateTime? logDate,
    Value<int?> cycleId = const Value.absent(),
    Value<int?> cycleDay = const Value.absent(),
    Value<String?> flow = const Value.absent(),
    String? moods,
    String? symptoms,
    Value<int?> painLevel = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DailyLog(
    id: id ?? this.id,
    logDate: logDate ?? this.logDate,
    cycleId: cycleId.present ? cycleId.value : this.cycleId,
    cycleDay: cycleDay.present ? cycleDay.value : this.cycleDay,
    flow: flow.present ? flow.value : this.flow,
    moods: moods ?? this.moods,
    symptoms: symptoms ?? this.symptoms,
    painLevel: painLevel.present ? painLevel.value : this.painLevel,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DailyLog copyWithCompanion(DailyLogsCompanion data) {
    return DailyLog(
      id: data.id.present ? data.id.value : this.id,
      logDate: data.logDate.present ? data.logDate.value : this.logDate,
      cycleId: data.cycleId.present ? data.cycleId.value : this.cycleId,
      cycleDay: data.cycleDay.present ? data.cycleDay.value : this.cycleDay,
      flow: data.flow.present ? data.flow.value : this.flow,
      moods: data.moods.present ? data.moods.value : this.moods,
      symptoms: data.symptoms.present ? data.symptoms.value : this.symptoms,
      painLevel: data.painLevel.present ? data.painLevel.value : this.painLevel,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyLog(')
          ..write('id: $id, ')
          ..write('logDate: $logDate, ')
          ..write('cycleId: $cycleId, ')
          ..write('cycleDay: $cycleDay, ')
          ..write('flow: $flow, ')
          ..write('moods: $moods, ')
          ..write('symptoms: $symptoms, ')
          ..write('painLevel: $painLevel, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    logDate,
    cycleId,
    cycleDay,
    flow,
    moods,
    symptoms,
    painLevel,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyLog &&
          other.id == this.id &&
          other.logDate == this.logDate &&
          other.cycleId == this.cycleId &&
          other.cycleDay == this.cycleDay &&
          other.flow == this.flow &&
          other.moods == this.moods &&
          other.symptoms == this.symptoms &&
          other.painLevel == this.painLevel &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DailyLogsCompanion extends UpdateCompanion<DailyLog> {
  final Value<int> id;
  final Value<DateTime> logDate;
  final Value<int?> cycleId;
  final Value<int?> cycleDay;
  final Value<String?> flow;
  final Value<String> moods;
  final Value<String> symptoms;
  final Value<int?> painLevel;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DailyLogsCompanion({
    this.id = const Value.absent(),
    this.logDate = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.cycleDay = const Value.absent(),
    this.flow = const Value.absent(),
    this.moods = const Value.absent(),
    this.symptoms = const Value.absent(),
    this.painLevel = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DailyLogsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime logDate,
    this.cycleId = const Value.absent(),
    this.cycleDay = const Value.absent(),
    this.flow = const Value.absent(),
    this.moods = const Value.absent(),
    this.symptoms = const Value.absent(),
    this.painLevel = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : logDate = Value(logDate);
  static Insertable<DailyLog> custom({
    Expression<int>? id,
    Expression<DateTime>? logDate,
    Expression<int>? cycleId,
    Expression<int>? cycleDay,
    Expression<String>? flow,
    Expression<String>? moods,
    Expression<String>? symptoms,
    Expression<int>? painLevel,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (logDate != null) 'log_date': logDate,
      if (cycleId != null) 'cycle_id': cycleId,
      if (cycleDay != null) 'cycle_day': cycleDay,
      if (flow != null) 'flow': flow,
      if (moods != null) 'moods': moods,
      if (symptoms != null) 'symptoms': symptoms,
      if (painLevel != null) 'pain_level': painLevel,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DailyLogsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? logDate,
    Value<int?>? cycleId,
    Value<int?>? cycleDay,
    Value<String?>? flow,
    Value<String>? moods,
    Value<String>? symptoms,
    Value<int?>? painLevel,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DailyLogsCompanion(
      id: id ?? this.id,
      logDate: logDate ?? this.logDate,
      cycleId: cycleId ?? this.cycleId,
      cycleDay: cycleDay ?? this.cycleDay,
      flow: flow ?? this.flow,
      moods: moods ?? this.moods,
      symptoms: symptoms ?? this.symptoms,
      painLevel: painLevel ?? this.painLevel,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (logDate.present) {
      map['log_date'] = Variable<DateTime>(logDate.value);
    }
    if (cycleId.present) {
      map['cycle_id'] = Variable<int>(cycleId.value);
    }
    if (cycleDay.present) {
      map['cycle_day'] = Variable<int>(cycleDay.value);
    }
    if (flow.present) {
      map['flow'] = Variable<String>(flow.value);
    }
    if (moods.present) {
      map['moods'] = Variable<String>(moods.value);
    }
    if (symptoms.present) {
      map['symptoms'] = Variable<String>(symptoms.value);
    }
    if (painLevel.present) {
      map['pain_level'] = Variable<int>(painLevel.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyLogsCompanion(')
          ..write('id: $id, ')
          ..write('logDate: $logDate, ')
          ..write('cycleId: $cycleId, ')
          ..write('cycleDay: $cycleDay, ')
          ..write('flow: $flow, ')
          ..write('moods: $moods, ')
          ..write('symptoms: $symptoms, ')
          ..write('painLevel: $painLevel, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTable extends UserSettings
    with TableInfo<$UserSettingsTable, UserSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lastPeriodDateMeta = const VerificationMeta(
    'lastPeriodDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastPeriodDate =
      GeneratedColumn<DateTime>(
        'last_period_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _typicalCycleLengthMeta =
      const VerificationMeta('typicalCycleLength');
  @override
  late final GeneratedColumn<int> typicalCycleLength = GeneratedColumn<int>(
    'typical_cycle_length',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(28),
  );
  static const VerificationMeta _typicalPeriodLengthMeta =
      const VerificationMeta('typicalPeriodLength');
  @override
  late final GeneratedColumn<int> typicalPeriodLength = GeneratedColumn<int>(
    'typical_period_length',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _onboardingCompletedMeta =
      const VerificationMeta('onboardingCompleted');
  @override
  late final GeneratedColumn<bool> onboardingCompleted = GeneratedColumn<bool>(
    'onboarding_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("onboarding_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _darkModeEnabledMeta = const VerificationMeta(
    'darkModeEnabled',
  );
  @override
  late final GeneratedColumn<bool> darkModeEnabled = GeneratedColumn<bool>(
    'dark_mode_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("dark_mode_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _discreetModeEnabledMeta =
      const VerificationMeta('discreetModeEnabled');
  @override
  late final GeneratedColumn<bool> discreetModeEnabled = GeneratedColumn<bool>(
    'discreet_mode_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("discreet_mode_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
    'notifications_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _conditionModeMeta = const VerificationMeta(
    'conditionMode',
  );
  @override
  late final GeneratedColumn<String> conditionMode = GeneratedColumn<String>(
    'condition_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lastPeriodDate,
    typicalCycleLength,
    typicalPeriodLength,
    onboardingCompleted,
    darkModeEnabled,
    discreetModeEnabled,
    notificationsEnabled,
    conditionMode,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('last_period_date')) {
      context.handle(
        _lastPeriodDateMeta,
        lastPeriodDate.isAcceptableOrUnknown(
          data['last_period_date']!,
          _lastPeriodDateMeta,
        ),
      );
    }
    if (data.containsKey('typical_cycle_length')) {
      context.handle(
        _typicalCycleLengthMeta,
        typicalCycleLength.isAcceptableOrUnknown(
          data['typical_cycle_length']!,
          _typicalCycleLengthMeta,
        ),
      );
    }
    if (data.containsKey('typical_period_length')) {
      context.handle(
        _typicalPeriodLengthMeta,
        typicalPeriodLength.isAcceptableOrUnknown(
          data['typical_period_length']!,
          _typicalPeriodLengthMeta,
        ),
      );
    }
    if (data.containsKey('onboarding_completed')) {
      context.handle(
        _onboardingCompletedMeta,
        onboardingCompleted.isAcceptableOrUnknown(
          data['onboarding_completed']!,
          _onboardingCompletedMeta,
        ),
      );
    }
    if (data.containsKey('dark_mode_enabled')) {
      context.handle(
        _darkModeEnabledMeta,
        darkModeEnabled.isAcceptableOrUnknown(
          data['dark_mode_enabled']!,
          _darkModeEnabledMeta,
        ),
      );
    }
    if (data.containsKey('discreet_mode_enabled')) {
      context.handle(
        _discreetModeEnabledMeta,
        discreetModeEnabled.isAcceptableOrUnknown(
          data['discreet_mode_enabled']!,
          _discreetModeEnabledMeta,
        ),
      );
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
        _notificationsEnabledMeta,
        notificationsEnabled.isAcceptableOrUnknown(
          data['notifications_enabled']!,
          _notificationsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('condition_mode')) {
      context.handle(
        _conditionModeMeta,
        conditionMode.isAcceptableOrUnknown(
          data['condition_mode']!,
          _conditionModeMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lastPeriodDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_period_date'],
      ),
      typicalCycleLength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}typical_cycle_length'],
      )!,
      typicalPeriodLength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}typical_period_length'],
      )!,
      onboardingCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}onboarding_completed'],
      )!,
      darkModeEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}dark_mode_enabled'],
      )!,
      discreetModeEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}discreet_mode_enabled'],
      )!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications_enabled'],
      )!,
      conditionMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition_mode'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserSettingsTable createAlias(String alias) {
    return $UserSettingsTable(attachedDatabase, alias);
  }
}

class UserSetting extends DataClass implements Insertable<UserSetting> {
  final int id;
  final DateTime? lastPeriodDate;
  final int typicalCycleLength;
  final int typicalPeriodLength;
  final bool onboardingCompleted;
  final bool darkModeEnabled;
  final bool discreetModeEnabled;
  final bool notificationsEnabled;
  final String conditionMode;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserSetting({
    required this.id,
    this.lastPeriodDate,
    required this.typicalCycleLength,
    required this.typicalPeriodLength,
    required this.onboardingCompleted,
    required this.darkModeEnabled,
    required this.discreetModeEnabled,
    required this.notificationsEnabled,
    required this.conditionMode,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || lastPeriodDate != null) {
      map['last_period_date'] = Variable<DateTime>(lastPeriodDate);
    }
    map['typical_cycle_length'] = Variable<int>(typicalCycleLength);
    map['typical_period_length'] = Variable<int>(typicalPeriodLength);
    map['onboarding_completed'] = Variable<bool>(onboardingCompleted);
    map['dark_mode_enabled'] = Variable<bool>(darkModeEnabled);
    map['discreet_mode_enabled'] = Variable<bool>(discreetModeEnabled);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    map['condition_mode'] = Variable<String>(conditionMode);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserSettingsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsCompanion(
      id: Value(id),
      lastPeriodDate: lastPeriodDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPeriodDate),
      typicalCycleLength: Value(typicalCycleLength),
      typicalPeriodLength: Value(typicalPeriodLength),
      onboardingCompleted: Value(onboardingCompleted),
      darkModeEnabled: Value(darkModeEnabled),
      discreetModeEnabled: Value(discreetModeEnabled),
      notificationsEnabled: Value(notificationsEnabled),
      conditionMode: Value(conditionMode),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSetting(
      id: serializer.fromJson<int>(json['id']),
      lastPeriodDate: serializer.fromJson<DateTime?>(json['lastPeriodDate']),
      typicalCycleLength: serializer.fromJson<int>(json['typicalCycleLength']),
      typicalPeriodLength: serializer.fromJson<int>(
        json['typicalPeriodLength'],
      ),
      onboardingCompleted: serializer.fromJson<bool>(
        json['onboardingCompleted'],
      ),
      darkModeEnabled: serializer.fromJson<bool>(json['darkModeEnabled']),
      discreetModeEnabled: serializer.fromJson<bool>(
        json['discreetModeEnabled'],
      ),
      notificationsEnabled: serializer.fromJson<bool>(
        json['notificationsEnabled'],
      ),
      conditionMode: serializer.fromJson<String>(json['conditionMode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lastPeriodDate': serializer.toJson<DateTime?>(lastPeriodDate),
      'typicalCycleLength': serializer.toJson<int>(typicalCycleLength),
      'typicalPeriodLength': serializer.toJson<int>(typicalPeriodLength),
      'onboardingCompleted': serializer.toJson<bool>(onboardingCompleted),
      'darkModeEnabled': serializer.toJson<bool>(darkModeEnabled),
      'discreetModeEnabled': serializer.toJson<bool>(discreetModeEnabled),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'conditionMode': serializer.toJson<String>(conditionMode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserSetting copyWith({
    int? id,
    Value<DateTime?> lastPeriodDate = const Value.absent(),
    int? typicalCycleLength,
    int? typicalPeriodLength,
    bool? onboardingCompleted,
    bool? darkModeEnabled,
    bool? discreetModeEnabled,
    bool? notificationsEnabled,
    String? conditionMode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UserSetting(
    id: id ?? this.id,
    lastPeriodDate: lastPeriodDate.present
        ? lastPeriodDate.value
        : this.lastPeriodDate,
    typicalCycleLength: typicalCycleLength ?? this.typicalCycleLength,
    typicalPeriodLength: typicalPeriodLength ?? this.typicalPeriodLength,
    onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
    discreetModeEnabled: discreetModeEnabled ?? this.discreetModeEnabled,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    conditionMode: conditionMode ?? this.conditionMode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserSetting copyWithCompanion(UserSettingsCompanion data) {
    return UserSetting(
      id: data.id.present ? data.id.value : this.id,
      lastPeriodDate: data.lastPeriodDate.present
          ? data.lastPeriodDate.value
          : this.lastPeriodDate,
      typicalCycleLength: data.typicalCycleLength.present
          ? data.typicalCycleLength.value
          : this.typicalCycleLength,
      typicalPeriodLength: data.typicalPeriodLength.present
          ? data.typicalPeriodLength.value
          : this.typicalPeriodLength,
      onboardingCompleted: data.onboardingCompleted.present
          ? data.onboardingCompleted.value
          : this.onboardingCompleted,
      darkModeEnabled: data.darkModeEnabled.present
          ? data.darkModeEnabled.value
          : this.darkModeEnabled,
      discreetModeEnabled: data.discreetModeEnabled.present
          ? data.discreetModeEnabled.value
          : this.discreetModeEnabled,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      conditionMode: data.conditionMode.present
          ? data.conditionMode.value
          : this.conditionMode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSetting(')
          ..write('id: $id, ')
          ..write('lastPeriodDate: $lastPeriodDate, ')
          ..write('typicalCycleLength: $typicalCycleLength, ')
          ..write('typicalPeriodLength: $typicalPeriodLength, ')
          ..write('onboardingCompleted: $onboardingCompleted, ')
          ..write('darkModeEnabled: $darkModeEnabled, ')
          ..write('discreetModeEnabled: $discreetModeEnabled, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('conditionMode: $conditionMode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lastPeriodDate,
    typicalCycleLength,
    typicalPeriodLength,
    onboardingCompleted,
    darkModeEnabled,
    discreetModeEnabled,
    notificationsEnabled,
    conditionMode,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSetting &&
          other.id == this.id &&
          other.lastPeriodDate == this.lastPeriodDate &&
          other.typicalCycleLength == this.typicalCycleLength &&
          other.typicalPeriodLength == this.typicalPeriodLength &&
          other.onboardingCompleted == this.onboardingCompleted &&
          other.darkModeEnabled == this.darkModeEnabled &&
          other.discreetModeEnabled == this.discreetModeEnabled &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.conditionMode == this.conditionMode &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserSettingsCompanion extends UpdateCompanion<UserSetting> {
  final Value<int> id;
  final Value<DateTime?> lastPeriodDate;
  final Value<int> typicalCycleLength;
  final Value<int> typicalPeriodLength;
  final Value<bool> onboardingCompleted;
  final Value<bool> darkModeEnabled;
  final Value<bool> discreetModeEnabled;
  final Value<bool> notificationsEnabled;
  final Value<String> conditionMode;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UserSettingsCompanion({
    this.id = const Value.absent(),
    this.lastPeriodDate = const Value.absent(),
    this.typicalCycleLength = const Value.absent(),
    this.typicalPeriodLength = const Value.absent(),
    this.onboardingCompleted = const Value.absent(),
    this.darkModeEnabled = const Value.absent(),
    this.discreetModeEnabled = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.conditionMode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.lastPeriodDate = const Value.absent(),
    this.typicalCycleLength = const Value.absent(),
    this.typicalPeriodLength = const Value.absent(),
    this.onboardingCompleted = const Value.absent(),
    this.darkModeEnabled = const Value.absent(),
    this.discreetModeEnabled = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.conditionMode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<UserSetting> custom({
    Expression<int>? id,
    Expression<DateTime>? lastPeriodDate,
    Expression<int>? typicalCycleLength,
    Expression<int>? typicalPeriodLength,
    Expression<bool>? onboardingCompleted,
    Expression<bool>? darkModeEnabled,
    Expression<bool>? discreetModeEnabled,
    Expression<bool>? notificationsEnabled,
    Expression<String>? conditionMode,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lastPeriodDate != null) 'last_period_date': lastPeriodDate,
      if (typicalCycleLength != null)
        'typical_cycle_length': typicalCycleLength,
      if (typicalPeriodLength != null)
        'typical_period_length': typicalPeriodLength,
      if (onboardingCompleted != null)
        'onboarding_completed': onboardingCompleted,
      if (darkModeEnabled != null) 'dark_mode_enabled': darkModeEnabled,
      if (discreetModeEnabled != null)
        'discreet_mode_enabled': discreetModeEnabled,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (conditionMode != null) 'condition_mode': conditionMode,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserSettingsCompanion copyWith({
    Value<int>? id,
    Value<DateTime?>? lastPeriodDate,
    Value<int>? typicalCycleLength,
    Value<int>? typicalPeriodLength,
    Value<bool>? onboardingCompleted,
    Value<bool>? darkModeEnabled,
    Value<bool>? discreetModeEnabled,
    Value<bool>? notificationsEnabled,
    Value<String>? conditionMode,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UserSettingsCompanion(
      id: id ?? this.id,
      lastPeriodDate: lastPeriodDate ?? this.lastPeriodDate,
      typicalCycleLength: typicalCycleLength ?? this.typicalCycleLength,
      typicalPeriodLength: typicalPeriodLength ?? this.typicalPeriodLength,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
      discreetModeEnabled: discreetModeEnabled ?? this.discreetModeEnabled,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      conditionMode: conditionMode ?? this.conditionMode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lastPeriodDate.present) {
      map['last_period_date'] = Variable<DateTime>(lastPeriodDate.value);
    }
    if (typicalCycleLength.present) {
      map['typical_cycle_length'] = Variable<int>(typicalCycleLength.value);
    }
    if (typicalPeriodLength.present) {
      map['typical_period_length'] = Variable<int>(typicalPeriodLength.value);
    }
    if (onboardingCompleted.present) {
      map['onboarding_completed'] = Variable<bool>(onboardingCompleted.value);
    }
    if (darkModeEnabled.present) {
      map['dark_mode_enabled'] = Variable<bool>(darkModeEnabled.value);
    }
    if (discreetModeEnabled.present) {
      map['discreet_mode_enabled'] = Variable<bool>(discreetModeEnabled.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (conditionMode.present) {
      map['condition_mode'] = Variable<String>(conditionMode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsCompanion(')
          ..write('id: $id, ')
          ..write('lastPeriodDate: $lastPeriodDate, ')
          ..write('typicalCycleLength: $typicalCycleLength, ')
          ..write('typicalPeriodLength: $typicalPeriodLength, ')
          ..write('onboardingCompleted: $onboardingCompleted, ')
          ..write('darkModeEnabled: $darkModeEnabled, ')
          ..write('discreetModeEnabled: $discreetModeEnabled, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('conditionMode: $conditionMode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CyclesTable cycles = $CyclesTable(this);
  late final $DailyLogsTable dailyLogs = $DailyLogsTable(this);
  late final $UserSettingsTable userSettings = $UserSettingsTable(this);
  late final CycleDao cycleDao = CycleDao(this as AppDatabase);
  late final DailyLogDao dailyLogDao = DailyLogDao(this as AppDatabase);
  late final UserSettingsDao userSettingsDao = UserSettingsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cycles,
    dailyLogs,
    userSettings,
  ];
}

typedef $$CyclesTableCreateCompanionBuilder =
    CyclesCompanion Function({
      Value<int> id,
      required DateTime startDate,
      Value<DateTime?> endDate,
      Value<int?> cycleLength,
      Value<int?> periodLength,
      Value<bool> isEstimated,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$CyclesTableUpdateCompanionBuilder =
    CyclesCompanion Function({
      Value<int> id,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<int?> cycleLength,
      Value<int?> periodLength,
      Value<bool> isEstimated,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$CyclesTableReferences
    extends BaseReferences<_$AppDatabase, $CyclesTable, Cycle> {
  $$CyclesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DailyLogsTable, List<DailyLog>>
  _dailyLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dailyLogs,
    aliasName: $_aliasNameGenerator(db.cycles.id, db.dailyLogs.cycleId),
  );

  $$DailyLogsTableProcessedTableManager get dailyLogsRefs {
    final manager = $$DailyLogsTableTableManager(
      $_db,
      $_db.dailyLogs,
    ).filter((f) => f.cycleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dailyLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CyclesTableFilterComposer
    extends Composer<_$AppDatabase, $CyclesTable> {
  $$CyclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cycleLength => $composableBuilder(
    column: $table.cycleLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get periodLength => $composableBuilder(
    column: $table.periodLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEstimated => $composableBuilder(
    column: $table.isEstimated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dailyLogsRefs(
    Expression<bool> Function($$DailyLogsTableFilterComposer f) f,
  ) {
    final $$DailyLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableFilterComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CyclesTableOrderingComposer
    extends Composer<_$AppDatabase, $CyclesTable> {
  $$CyclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cycleLength => $composableBuilder(
    column: $table.cycleLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get periodLength => $composableBuilder(
    column: $table.periodLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEstimated => $composableBuilder(
    column: $table.isEstimated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CyclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CyclesTable> {
  $$CyclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<int> get cycleLength => $composableBuilder(
    column: $table.cycleLength,
    builder: (column) => column,
  );

  GeneratedColumn<int> get periodLength => $composableBuilder(
    column: $table.periodLength,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEstimated => $composableBuilder(
    column: $table.isEstimated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> dailyLogsRefs<T extends Object>(
    Expression<T> Function($$DailyLogsTableAnnotationComposer a) f,
  ) {
    final $$DailyLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dailyLogs,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.dailyLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CyclesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CyclesTable,
          Cycle,
          $$CyclesTableFilterComposer,
          $$CyclesTableOrderingComposer,
          $$CyclesTableAnnotationComposer,
          $$CyclesTableCreateCompanionBuilder,
          $$CyclesTableUpdateCompanionBuilder,
          (Cycle, $$CyclesTableReferences),
          Cycle,
          PrefetchHooks Function({bool dailyLogsRefs})
        > {
  $$CyclesTableTableManager(_$AppDatabase db, $CyclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CyclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CyclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CyclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int?> cycleLength = const Value.absent(),
                Value<int?> periodLength = const Value.absent(),
                Value<bool> isEstimated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CyclesCompanion(
                id: id,
                startDate: startDate,
                endDate: endDate,
                cycleLength: cycleLength,
                periodLength: periodLength,
                isEstimated: isEstimated,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                Value<int?> cycleLength = const Value.absent(),
                Value<int?> periodLength = const Value.absent(),
                Value<bool> isEstimated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CyclesCompanion.insert(
                id: id,
                startDate: startDate,
                endDate: endDate,
                cycleLength: cycleLength,
                periodLength: periodLength,
                isEstimated: isEstimated,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$CyclesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({dailyLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dailyLogsRefs) db.dailyLogs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dailyLogsRefs)
                    await $_getPrefetchedData<Cycle, $CyclesTable, DailyLog>(
                      currentTable: table,
                      referencedTable: $$CyclesTableReferences
                          ._dailyLogsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CyclesTableReferences(db, table, p0).dailyLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.cycleId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CyclesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CyclesTable,
      Cycle,
      $$CyclesTableFilterComposer,
      $$CyclesTableOrderingComposer,
      $$CyclesTableAnnotationComposer,
      $$CyclesTableCreateCompanionBuilder,
      $$CyclesTableUpdateCompanionBuilder,
      (Cycle, $$CyclesTableReferences),
      Cycle,
      PrefetchHooks Function({bool dailyLogsRefs})
    >;
typedef $$DailyLogsTableCreateCompanionBuilder =
    DailyLogsCompanion Function({
      Value<int> id,
      required DateTime logDate,
      Value<int?> cycleId,
      Value<int?> cycleDay,
      Value<String?> flow,
      Value<String> moods,
      Value<String> symptoms,
      Value<int?> painLevel,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$DailyLogsTableUpdateCompanionBuilder =
    DailyLogsCompanion Function({
      Value<int> id,
      Value<DateTime> logDate,
      Value<int?> cycleId,
      Value<int?> cycleDay,
      Value<String?> flow,
      Value<String> moods,
      Value<String> symptoms,
      Value<int?> painLevel,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$DailyLogsTableReferences
    extends BaseReferences<_$AppDatabase, $DailyLogsTable, DailyLog> {
  $$DailyLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CyclesTable _cycleIdTable(_$AppDatabase db) => db.cycles.createAlias(
    $_aliasNameGenerator(db.dailyLogs.cycleId, db.cycles.id),
  );

  $$CyclesTableProcessedTableManager? get cycleId {
    final $_column = $_itemColumn<int>('cycle_id');
    if ($_column == null) return null;
    final manager = $$CyclesTableTableManager(
      $_db,
      $_db.cycles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cycleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DailyLogsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyLogsTable> {
  $$DailyLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get logDate => $composableBuilder(
    column: $table.logDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cycleDay => $composableBuilder(
    column: $table.cycleDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get flow => $composableBuilder(
    column: $table.flow,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moods => $composableBuilder(
    column: $table.moods,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symptoms => $composableBuilder(
    column: $table.symptoms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get painLevel => $composableBuilder(
    column: $table.painLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CyclesTableFilterComposer get cycleId {
    final $$CyclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.cycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CyclesTableFilterComposer(
            $db: $db,
            $table: $db.cycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DailyLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyLogsTable> {
  $$DailyLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get logDate => $composableBuilder(
    column: $table.logDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cycleDay => $composableBuilder(
    column: $table.cycleDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get flow => $composableBuilder(
    column: $table.flow,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moods => $composableBuilder(
    column: $table.moods,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symptoms => $composableBuilder(
    column: $table.symptoms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get painLevel => $composableBuilder(
    column: $table.painLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CyclesTableOrderingComposer get cycleId {
    final $$CyclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.cycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CyclesTableOrderingComposer(
            $db: $db,
            $table: $db.cycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DailyLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyLogsTable> {
  $$DailyLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get logDate =>
      $composableBuilder(column: $table.logDate, builder: (column) => column);

  GeneratedColumn<int> get cycleDay =>
      $composableBuilder(column: $table.cycleDay, builder: (column) => column);

  GeneratedColumn<String> get flow =>
      $composableBuilder(column: $table.flow, builder: (column) => column);

  GeneratedColumn<String> get moods =>
      $composableBuilder(column: $table.moods, builder: (column) => column);

  GeneratedColumn<String> get symptoms =>
      $composableBuilder(column: $table.symptoms, builder: (column) => column);

  GeneratedColumn<int> get painLevel =>
      $composableBuilder(column: $table.painLevel, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CyclesTableAnnotationComposer get cycleId {
    final $$CyclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.cycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CyclesTableAnnotationComposer(
            $db: $db,
            $table: $db.cycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DailyLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyLogsTable,
          DailyLog,
          $$DailyLogsTableFilterComposer,
          $$DailyLogsTableOrderingComposer,
          $$DailyLogsTableAnnotationComposer,
          $$DailyLogsTableCreateCompanionBuilder,
          $$DailyLogsTableUpdateCompanionBuilder,
          (DailyLog, $$DailyLogsTableReferences),
          DailyLog,
          PrefetchHooks Function({bool cycleId})
        > {
  $$DailyLogsTableTableManager(_$AppDatabase db, $DailyLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> logDate = const Value.absent(),
                Value<int?> cycleId = const Value.absent(),
                Value<int?> cycleDay = const Value.absent(),
                Value<String?> flow = const Value.absent(),
                Value<String> moods = const Value.absent(),
                Value<String> symptoms = const Value.absent(),
                Value<int?> painLevel = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DailyLogsCompanion(
                id: id,
                logDate: logDate,
                cycleId: cycleId,
                cycleDay: cycleDay,
                flow: flow,
                moods: moods,
                symptoms: symptoms,
                painLevel: painLevel,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime logDate,
                Value<int?> cycleId = const Value.absent(),
                Value<int?> cycleDay = const Value.absent(),
                Value<String?> flow = const Value.absent(),
                Value<String> moods = const Value.absent(),
                Value<String> symptoms = const Value.absent(),
                Value<int?> painLevel = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DailyLogsCompanion.insert(
                id: id,
                logDate: logDate,
                cycleId: cycleId,
                cycleDay: cycleDay,
                flow: flow,
                moods: moods,
                symptoms: symptoms,
                painLevel: painLevel,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DailyLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cycleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cycleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cycleId,
                                referencedTable: $$DailyLogsTableReferences
                                    ._cycleIdTable(db),
                                referencedColumn: $$DailyLogsTableReferences
                                    ._cycleIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DailyLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyLogsTable,
      DailyLog,
      $$DailyLogsTableFilterComposer,
      $$DailyLogsTableOrderingComposer,
      $$DailyLogsTableAnnotationComposer,
      $$DailyLogsTableCreateCompanionBuilder,
      $$DailyLogsTableUpdateCompanionBuilder,
      (DailyLog, $$DailyLogsTableReferences),
      DailyLog,
      PrefetchHooks Function({bool cycleId})
    >;
typedef $$UserSettingsTableCreateCompanionBuilder =
    UserSettingsCompanion Function({
      Value<int> id,
      Value<DateTime?> lastPeriodDate,
      Value<int> typicalCycleLength,
      Value<int> typicalPeriodLength,
      Value<bool> onboardingCompleted,
      Value<bool> darkModeEnabled,
      Value<bool> discreetModeEnabled,
      Value<bool> notificationsEnabled,
      Value<String> conditionMode,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$UserSettingsTableUpdateCompanionBuilder =
    UserSettingsCompanion Function({
      Value<int> id,
      Value<DateTime?> lastPeriodDate,
      Value<int> typicalCycleLength,
      Value<int> typicalPeriodLength,
      Value<bool> onboardingCompleted,
      Value<bool> darkModeEnabled,
      Value<bool> discreetModeEnabled,
      Value<bool> notificationsEnabled,
      Value<String> conditionMode,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$UserSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPeriodDate => $composableBuilder(
    column: $table.lastPeriodDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get typicalCycleLength => $composableBuilder(
    column: $table.typicalCycleLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get typicalPeriodLength => $composableBuilder(
    column: $table.typicalPeriodLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onboardingCompleted => $composableBuilder(
    column: $table.onboardingCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get darkModeEnabled => $composableBuilder(
    column: $table.darkModeEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get discreetModeEnabled => $composableBuilder(
    column: $table.discreetModeEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conditionMode => $composableBuilder(
    column: $table.conditionMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPeriodDate => $composableBuilder(
    column: $table.lastPeriodDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get typicalCycleLength => $composableBuilder(
    column: $table.typicalCycleLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get typicalPeriodLength => $composableBuilder(
    column: $table.typicalPeriodLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onboardingCompleted => $composableBuilder(
    column: $table.onboardingCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get darkModeEnabled => $composableBuilder(
    column: $table.darkModeEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get discreetModeEnabled => $composableBuilder(
    column: $table.discreetModeEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conditionMode => $composableBuilder(
    column: $table.conditionMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPeriodDate => $composableBuilder(
    column: $table.lastPeriodDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get typicalCycleLength => $composableBuilder(
    column: $table.typicalCycleLength,
    builder: (column) => column,
  );

  GeneratedColumn<int> get typicalPeriodLength => $composableBuilder(
    column: $table.typicalPeriodLength,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get onboardingCompleted => $composableBuilder(
    column: $table.onboardingCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get darkModeEnabled => $composableBuilder(
    column: $table.darkModeEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get discreetModeEnabled => $composableBuilder(
    column: $table.discreetModeEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conditionMode => $composableBuilder(
    column: $table.conditionMode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserSettingsTable,
          UserSetting,
          $$UserSettingsTableFilterComposer,
          $$UserSettingsTableOrderingComposer,
          $$UserSettingsTableAnnotationComposer,
          $$UserSettingsTableCreateCompanionBuilder,
          $$UserSettingsTableUpdateCompanionBuilder,
          (
            UserSetting,
            BaseReferences<_$AppDatabase, $UserSettingsTable, UserSetting>,
          ),
          UserSetting,
          PrefetchHooks Function()
        > {
  $$UserSettingsTableTableManager(_$AppDatabase db, $UserSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> lastPeriodDate = const Value.absent(),
                Value<int> typicalCycleLength = const Value.absent(),
                Value<int> typicalPeriodLength = const Value.absent(),
                Value<bool> onboardingCompleted = const Value.absent(),
                Value<bool> darkModeEnabled = const Value.absent(),
                Value<bool> discreetModeEnabled = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<String> conditionMode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserSettingsCompanion(
                id: id,
                lastPeriodDate: lastPeriodDate,
                typicalCycleLength: typicalCycleLength,
                typicalPeriodLength: typicalPeriodLength,
                onboardingCompleted: onboardingCompleted,
                darkModeEnabled: darkModeEnabled,
                discreetModeEnabled: discreetModeEnabled,
                notificationsEnabled: notificationsEnabled,
                conditionMode: conditionMode,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> lastPeriodDate = const Value.absent(),
                Value<int> typicalCycleLength = const Value.absent(),
                Value<int> typicalPeriodLength = const Value.absent(),
                Value<bool> onboardingCompleted = const Value.absent(),
                Value<bool> darkModeEnabled = const Value.absent(),
                Value<bool> discreetModeEnabled = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<String> conditionMode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserSettingsCompanion.insert(
                id: id,
                lastPeriodDate: lastPeriodDate,
                typicalCycleLength: typicalCycleLength,
                typicalPeriodLength: typicalPeriodLength,
                onboardingCompleted: onboardingCompleted,
                darkModeEnabled: darkModeEnabled,
                discreetModeEnabled: discreetModeEnabled,
                notificationsEnabled: notificationsEnabled,
                conditionMode: conditionMode,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserSettingsTable,
      UserSetting,
      $$UserSettingsTableFilterComposer,
      $$UserSettingsTableOrderingComposer,
      $$UserSettingsTableAnnotationComposer,
      $$UserSettingsTableCreateCompanionBuilder,
      $$UserSettingsTableUpdateCompanionBuilder,
      (
        UserSetting,
        BaseReferences<_$AppDatabase, $UserSettingsTable, UserSetting>,
      ),
      UserSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CyclesTableTableManager get cycles =>
      $$CyclesTableTableManager(_db, _db.cycles);
  $$DailyLogsTableTableManager get dailyLogs =>
      $$DailyLogsTableTableManager(_db, _db.dailyLogs);
  $$UserSettingsTableTableManager get userSettings =>
      $$UserSettingsTableTableManager(_db, _db.userSettings);
}
