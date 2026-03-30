// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FundsTableTable extends FundsTable
    with TableInfo<$FundsTableTable, FundDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FundsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minimumAmountMeta = const VerificationMeta(
    'minimumAmount',
  );
  @override
  late final GeneratedColumn<double> minimumAmount = GeneratedColumn<double>(
    'minimum_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtitleMeta = const VerificationMeta(
    'subtitle',
  );
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
    'subtitle',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _investedMeta = const VerificationMeta(
    'invested',
  );
  @override
  late final GeneratedColumn<String> invested = GeneratedColumn<String>(
    'invested',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentBalanceMeta = const VerificationMeta(
    'currentBalance',
  );
  @override
  late final GeneratedColumn<String> currentBalance = GeneratedColumn<String>(
    'current_balance',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _returnPctMeta = const VerificationMeta(
    'returnPct',
  );
  @override
  late final GeneratedColumn<String> returnPct = GeneratedColumn<String>(
    'return_pct',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    minimumAmount,
    category,
    subtitle,
    invested,
    currentBalance,
    returnPct,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'funds_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FundDb> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('minimum_amount')) {
      context.handle(
        _minimumAmountMeta,
        minimumAmount.isAcceptableOrUnknown(
          data['minimum_amount']!,
          _minimumAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minimumAmountMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(
        _subtitleMeta,
        subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta),
      );
    }
    if (data.containsKey('invested')) {
      context.handle(
        _investedMeta,
        invested.isAcceptableOrUnknown(data['invested']!, _investedMeta),
      );
    }
    if (data.containsKey('current_balance')) {
      context.handle(
        _currentBalanceMeta,
        currentBalance.isAcceptableOrUnknown(
          data['current_balance']!,
          _currentBalanceMeta,
        ),
      );
    }
    if (data.containsKey('return_pct')) {
      context.handle(
        _returnPctMeta,
        returnPct.isAcceptableOrUnknown(data['return_pct']!, _returnPctMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FundDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FundDb(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      minimumAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}minimum_amount'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      subtitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subtitle'],
      ),
      invested: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invested'],
      ),
      currentBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_balance'],
      ),
      returnPct: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}return_pct'],
      ),
    );
  }

  @override
  $FundsTableTable createAlias(String alias) {
    return $FundsTableTable(attachedDatabase, alias);
  }
}

class FundDb extends DataClass implements Insertable<FundDb> {
  final String id;
  final String name;
  final double minimumAmount;
  final String category;
  final String? subtitle;
  final String? invested;
  final String? currentBalance;
  final String? returnPct;
  const FundDb({
    required this.id,
    required this.name,
    required this.minimumAmount,
    required this.category,
    this.subtitle,
    this.invested,
    this.currentBalance,
    this.returnPct,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['minimum_amount'] = Variable<double>(minimumAmount);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || subtitle != null) {
      map['subtitle'] = Variable<String>(subtitle);
    }
    if (!nullToAbsent || invested != null) {
      map['invested'] = Variable<String>(invested);
    }
    if (!nullToAbsent || currentBalance != null) {
      map['current_balance'] = Variable<String>(currentBalance);
    }
    if (!nullToAbsent || returnPct != null) {
      map['return_pct'] = Variable<String>(returnPct);
    }
    return map;
  }

  FundsTableCompanion toCompanion(bool nullToAbsent) {
    return FundsTableCompanion(
      id: Value(id),
      name: Value(name),
      minimumAmount: Value(minimumAmount),
      category: Value(category),
      subtitle: subtitle == null && nullToAbsent
          ? const Value.absent()
          : Value(subtitle),
      invested: invested == null && nullToAbsent
          ? const Value.absent()
          : Value(invested),
      currentBalance: currentBalance == null && nullToAbsent
          ? const Value.absent()
          : Value(currentBalance),
      returnPct: returnPct == null && nullToAbsent
          ? const Value.absent()
          : Value(returnPct),
    );
  }

  factory FundDb.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FundDb(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      minimumAmount: serializer.fromJson<double>(json['minimumAmount']),
      category: serializer.fromJson<String>(json['category']),
      subtitle: serializer.fromJson<String?>(json['subtitle']),
      invested: serializer.fromJson<String?>(json['invested']),
      currentBalance: serializer.fromJson<String?>(json['currentBalance']),
      returnPct: serializer.fromJson<String?>(json['returnPct']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'minimumAmount': serializer.toJson<double>(minimumAmount),
      'category': serializer.toJson<String>(category),
      'subtitle': serializer.toJson<String?>(subtitle),
      'invested': serializer.toJson<String?>(invested),
      'currentBalance': serializer.toJson<String?>(currentBalance),
      'returnPct': serializer.toJson<String?>(returnPct),
    };
  }

  FundDb copyWith({
    String? id,
    String? name,
    double? minimumAmount,
    String? category,
    Value<String?> subtitle = const Value.absent(),
    Value<String?> invested = const Value.absent(),
    Value<String?> currentBalance = const Value.absent(),
    Value<String?> returnPct = const Value.absent(),
  }) => FundDb(
    id: id ?? this.id,
    name: name ?? this.name,
    minimumAmount: minimumAmount ?? this.minimumAmount,
    category: category ?? this.category,
    subtitle: subtitle.present ? subtitle.value : this.subtitle,
    invested: invested.present ? invested.value : this.invested,
    currentBalance: currentBalance.present
        ? currentBalance.value
        : this.currentBalance,
    returnPct: returnPct.present ? returnPct.value : this.returnPct,
  );
  FundDb copyWithCompanion(FundsTableCompanion data) {
    return FundDb(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      minimumAmount: data.minimumAmount.present
          ? data.minimumAmount.value
          : this.minimumAmount,
      category: data.category.present ? data.category.value : this.category,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      invested: data.invested.present ? data.invested.value : this.invested,
      currentBalance: data.currentBalance.present
          ? data.currentBalance.value
          : this.currentBalance,
      returnPct: data.returnPct.present ? data.returnPct.value : this.returnPct,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FundDb(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('minimumAmount: $minimumAmount, ')
          ..write('category: $category, ')
          ..write('subtitle: $subtitle, ')
          ..write('invested: $invested, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('returnPct: $returnPct')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    minimumAmount,
    category,
    subtitle,
    invested,
    currentBalance,
    returnPct,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FundDb &&
          other.id == this.id &&
          other.name == this.name &&
          other.minimumAmount == this.minimumAmount &&
          other.category == this.category &&
          other.subtitle == this.subtitle &&
          other.invested == this.invested &&
          other.currentBalance == this.currentBalance &&
          other.returnPct == this.returnPct);
}

class FundsTableCompanion extends UpdateCompanion<FundDb> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> minimumAmount;
  final Value<String> category;
  final Value<String?> subtitle;
  final Value<String?> invested;
  final Value<String?> currentBalance;
  final Value<String?> returnPct;
  final Value<int> rowid;
  const FundsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.minimumAmount = const Value.absent(),
    this.category = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.invested = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.returnPct = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FundsTableCompanion.insert({
    required String id,
    required String name,
    required double minimumAmount,
    required String category,
    this.subtitle = const Value.absent(),
    this.invested = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.returnPct = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       minimumAmount = Value(minimumAmount),
       category = Value(category);
  static Insertable<FundDb> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? minimumAmount,
    Expression<String>? category,
    Expression<String>? subtitle,
    Expression<String>? invested,
    Expression<String>? currentBalance,
    Expression<String>? returnPct,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (minimumAmount != null) 'minimum_amount': minimumAmount,
      if (category != null) 'category': category,
      if (subtitle != null) 'subtitle': subtitle,
      if (invested != null) 'invested': invested,
      if (currentBalance != null) 'current_balance': currentBalance,
      if (returnPct != null) 'return_pct': returnPct,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FundsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? minimumAmount,
    Value<String>? category,
    Value<String?>? subtitle,
    Value<String?>? invested,
    Value<String?>? currentBalance,
    Value<String?>? returnPct,
    Value<int>? rowid,
  }) {
    return FundsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      minimumAmount: minimumAmount ?? this.minimumAmount,
      category: category ?? this.category,
      subtitle: subtitle ?? this.subtitle,
      invested: invested ?? this.invested,
      currentBalance: currentBalance ?? this.currentBalance,
      returnPct: returnPct ?? this.returnPct,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (minimumAmount.present) {
      map['minimum_amount'] = Variable<double>(minimumAmount.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (invested.present) {
      map['invested'] = Variable<String>(invested.value);
    }
    if (currentBalance.present) {
      map['current_balance'] = Variable<String>(currentBalance.value);
    }
    if (returnPct.present) {
      map['return_pct'] = Variable<String>(returnPct.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FundsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('minimumAmount: $minimumAmount, ')
          ..write('category: $category, ')
          ..write('subtitle: $subtitle, ')
          ..write('invested: $invested, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('returnPct: $returnPct, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTableTable extends TransactionsTable
    with TableInfo<$TransactionsTableTable, TransactionDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fundIdMeta = const VerificationMeta('fundId');
  @override
  late final GeneratedColumn<String> fundId = GeneratedColumn<String>(
    'fund_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    amount,
    fundId,
    date,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionDb> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('fund_id')) {
      context.handle(
        _fundIdMeta,
        fundId.isAcceptableOrUnknown(data['fund_id']!, _fundIdMeta),
      );
    } else if (isInserting) {
      context.missing(_fundIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionDb(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      fundId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fund_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $TransactionsTableTable createAlias(String alias) {
    return $TransactionsTableTable(attachedDatabase, alias);
  }
}

class TransactionDb extends DataClass implements Insertable<TransactionDb> {
  final String id;
  final String name;
  final String type;
  final double amount;
  final String fundId;
  final DateTime date;
  final String syncStatus;
  const TransactionDb({
    required this.id,
    required this.name,
    required this.type,
    required this.amount,
    required this.fundId,
    required this.date,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['amount'] = Variable<double>(amount);
    map['fund_id'] = Variable<String>(fundId);
    map['date'] = Variable<DateTime>(date);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  TransactionsTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionsTableCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      amount: Value(amount),
      fundId: Value(fundId),
      date: Value(date),
      syncStatus: Value(syncStatus),
    );
  }

  factory TransactionDb.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionDb(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      amount: serializer.fromJson<double>(json['amount']),
      fundId: serializer.fromJson<String>(json['fundId']),
      date: serializer.fromJson<DateTime>(json['date']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'amount': serializer.toJson<double>(amount),
      'fundId': serializer.toJson<String>(fundId),
      'date': serializer.toJson<DateTime>(date),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  TransactionDb copyWith({
    String? id,
    String? name,
    String? type,
    double? amount,
    String? fundId,
    DateTime? date,
    String? syncStatus,
  }) => TransactionDb(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    amount: amount ?? this.amount,
    fundId: fundId ?? this.fundId,
    date: date ?? this.date,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  TransactionDb copyWithCompanion(TransactionsTableCompanion data) {
    return TransactionDb(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      amount: data.amount.present ? data.amount.value : this.amount,
      fundId: data.fundId.present ? data.fundId.value : this.fundId,
      date: data.date.present ? data.date.value : this.date,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionDb(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('fundId: $fundId, ')
          ..write('date: $date, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, amount, fundId, date, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionDb &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.fundId == this.fundId &&
          other.date == this.date &&
          other.syncStatus == this.syncStatus);
}

class TransactionsTableCompanion extends UpdateCompanion<TransactionDb> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<double> amount;
  final Value<String> fundId;
  final Value<DateTime> date;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const TransactionsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.fundId = const Value.absent(),
    this.date = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsTableCompanion.insert({
    required String id,
    required String name,
    required String type,
    required double amount,
    required String fundId,
    required DateTime date,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       type = Value(type),
       amount = Value(amount),
       fundId = Value(fundId),
       date = Value(date);
  static Insertable<TransactionDb> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<double>? amount,
    Expression<String>? fundId,
    Expression<DateTime>? date,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (fundId != null) 'fund_id': fundId,
      if (date != null) 'date': date,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? type,
    Value<double>? amount,
    Value<String>? fundId,
    Value<DateTime>? date,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return TransactionsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      fundId: fundId ?? this.fundId,
      date: date ?? this.date,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (fundId.present) {
      map['fund_id'] = Variable<String>(fundId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('fundId: $fundId, ')
          ..write('date: $date, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '1',
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<double> balance = GeneratedColumn<double>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(500000.0),
  );
  static const VerificationMeta _notificationMethodMeta =
      const VerificationMeta('notificationMethod');
  @override
  late final GeneratedColumn<String> notificationMethod =
      GeneratedColumn<String>(
        'notification_method',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [id, balance, notificationMethod];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDb> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    }
    if (data.containsKey('notification_method')) {
      context.handle(
        _notificationMethodMeta,
        notificationMethod.isAcceptableOrUnknown(
          data['notification_method']!,
          _notificationMethodMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDb(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}balance'],
      )!,
      notificationMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notification_method'],
      ),
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserDb extends DataClass implements Insertable<UserDb> {
  final String id;
  final double balance;
  final String? notificationMethod;
  const UserDb({
    required this.id,
    required this.balance,
    this.notificationMethod,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['balance'] = Variable<double>(balance);
    if (!nullToAbsent || notificationMethod != null) {
      map['notification_method'] = Variable<String>(notificationMethod);
    }
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      balance: Value(balance),
      notificationMethod: notificationMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationMethod),
    );
  }

  factory UserDb.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDb(
      id: serializer.fromJson<String>(json['id']),
      balance: serializer.fromJson<double>(json['balance']),
      notificationMethod: serializer.fromJson<String?>(
        json['notificationMethod'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'balance': serializer.toJson<double>(balance),
      'notificationMethod': serializer.toJson<String?>(notificationMethod),
    };
  }

  UserDb copyWith({
    String? id,
    double? balance,
    Value<String?> notificationMethod = const Value.absent(),
  }) => UserDb(
    id: id ?? this.id,
    balance: balance ?? this.balance,
    notificationMethod: notificationMethod.present
        ? notificationMethod.value
        : this.notificationMethod,
  );
  UserDb copyWithCompanion(UserTableCompanion data) {
    return UserDb(
      id: data.id.present ? data.id.value : this.id,
      balance: data.balance.present ? data.balance.value : this.balance,
      notificationMethod: data.notificationMethod.present
          ? data.notificationMethod.value
          : this.notificationMethod,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDb(')
          ..write('id: $id, ')
          ..write('balance: $balance, ')
          ..write('notificationMethod: $notificationMethod')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, balance, notificationMethod);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDb &&
          other.id == this.id &&
          other.balance == this.balance &&
          other.notificationMethod == this.notificationMethod);
}

class UserTableCompanion extends UpdateCompanion<UserDb> {
  final Value<String> id;
  final Value<double> balance;
  final Value<String?> notificationMethod;
  final Value<int> rowid;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.balance = const Value.absent(),
    this.notificationMethod = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    this.balance = const Value.absent(),
    this.notificationMethod = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<UserDb> custom({
    Expression<String>? id,
    Expression<double>? balance,
    Expression<String>? notificationMethod,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (balance != null) 'balance': balance,
      if (notificationMethod != null) 'notification_method': notificationMethod,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserTableCompanion copyWith({
    Value<String>? id,
    Value<double>? balance,
    Value<String?>? notificationMethod,
    Value<int>? rowid,
  }) {
    return UserTableCompanion(
      id: id ?? this.id,
      balance: balance ?? this.balance,
      notificationMethod: notificationMethod ?? this.notificationMethod,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (balance.present) {
      map['balance'] = Variable<double>(balance.value);
    }
    if (notificationMethod.present) {
      map['notification_method'] = Variable<String>(notificationMethod.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('balance: $balance, ')
          ..write('notificationMethod: $notificationMethod, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FundsTableTable fundsTable = $FundsTableTable(this);
  late final $TransactionsTableTable transactionsTable =
      $TransactionsTableTable(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final FundDao fundDao = FundDao(this as AppDatabase);
  late final TransactionDao transactionDao = TransactionDao(
    this as AppDatabase,
  );
  late final UserDao userDao = UserDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    fundsTable,
    transactionsTable,
    userTable,
  ];
}

typedef $$FundsTableTableCreateCompanionBuilder =
    FundsTableCompanion Function({
      required String id,
      required String name,
      required double minimumAmount,
      required String category,
      Value<String?> subtitle,
      Value<String?> invested,
      Value<String?> currentBalance,
      Value<String?> returnPct,
      Value<int> rowid,
    });
typedef $$FundsTableTableUpdateCompanionBuilder =
    FundsTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<double> minimumAmount,
      Value<String> category,
      Value<String?> subtitle,
      Value<String?> invested,
      Value<String?> currentBalance,
      Value<String?> returnPct,
      Value<int> rowid,
    });

class $$FundsTableTableFilterComposer
    extends Composer<_$AppDatabase, $FundsTableTable> {
  $$FundsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minimumAmount => $composableBuilder(
    column: $table.minimumAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invested => $composableBuilder(
    column: $table.invested,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentBalance => $composableBuilder(
    column: $table.currentBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get returnPct => $composableBuilder(
    column: $table.returnPct,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FundsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FundsTableTable> {
  $$FundsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minimumAmount => $composableBuilder(
    column: $table.minimumAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invested => $composableBuilder(
    column: $table.invested,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentBalance => $composableBuilder(
    column: $table.currentBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get returnPct => $composableBuilder(
    column: $table.returnPct,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FundsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FundsTableTable> {
  $$FundsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get minimumAmount => $composableBuilder(
    column: $table.minimumAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get invested =>
      $composableBuilder(column: $table.invested, builder: (column) => column);

  GeneratedColumn<String> get currentBalance => $composableBuilder(
    column: $table.currentBalance,
    builder: (column) => column,
  );

  GeneratedColumn<String> get returnPct =>
      $composableBuilder(column: $table.returnPct, builder: (column) => column);
}

class $$FundsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FundsTableTable,
          FundDb,
          $$FundsTableTableFilterComposer,
          $$FundsTableTableOrderingComposer,
          $$FundsTableTableAnnotationComposer,
          $$FundsTableTableCreateCompanionBuilder,
          $$FundsTableTableUpdateCompanionBuilder,
          (FundDb, BaseReferences<_$AppDatabase, $FundsTableTable, FundDb>),
          FundDb,
          PrefetchHooks Function()
        > {
  $$FundsTableTableTableManager(_$AppDatabase db, $FundsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FundsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FundsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FundsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> minimumAmount = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> subtitle = const Value.absent(),
                Value<String?> invested = const Value.absent(),
                Value<String?> currentBalance = const Value.absent(),
                Value<String?> returnPct = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FundsTableCompanion(
                id: id,
                name: name,
                minimumAmount: minimumAmount,
                category: category,
                subtitle: subtitle,
                invested: invested,
                currentBalance: currentBalance,
                returnPct: returnPct,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required double minimumAmount,
                required String category,
                Value<String?> subtitle = const Value.absent(),
                Value<String?> invested = const Value.absent(),
                Value<String?> currentBalance = const Value.absent(),
                Value<String?> returnPct = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FundsTableCompanion.insert(
                id: id,
                name: name,
                minimumAmount: minimumAmount,
                category: category,
                subtitle: subtitle,
                invested: invested,
                currentBalance: currentBalance,
                returnPct: returnPct,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FundsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FundsTableTable,
      FundDb,
      $$FundsTableTableFilterComposer,
      $$FundsTableTableOrderingComposer,
      $$FundsTableTableAnnotationComposer,
      $$FundsTableTableCreateCompanionBuilder,
      $$FundsTableTableUpdateCompanionBuilder,
      (FundDb, BaseReferences<_$AppDatabase, $FundsTableTable, FundDb>),
      FundDb,
      PrefetchHooks Function()
    >;
typedef $$TransactionsTableTableCreateCompanionBuilder =
    TransactionsTableCompanion Function({
      required String id,
      required String name,
      required String type,
      required double amount,
      required String fundId,
      required DateTime date,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$TransactionsTableTableUpdateCompanionBuilder =
    TransactionsTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> type,
      Value<double> amount,
      Value<String> fundId,
      Value<DateTime> date,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$TransactionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTableTable> {
  $$TransactionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fundId => $composableBuilder(
    column: $table.fundId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransactionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTableTable> {
  $$TransactionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fundId => $composableBuilder(
    column: $table.fundId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTableTable> {
  $$TransactionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get fundId =>
      $composableBuilder(column: $table.fundId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$TransactionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTableTable,
          TransactionDb,
          $$TransactionsTableTableFilterComposer,
          $$TransactionsTableTableOrderingComposer,
          $$TransactionsTableTableAnnotationComposer,
          $$TransactionsTableTableCreateCompanionBuilder,
          $$TransactionsTableTableUpdateCompanionBuilder,
          (
            TransactionDb,
            BaseReferences<
              _$AppDatabase,
              $TransactionsTableTable,
              TransactionDb
            >,
          ),
          TransactionDb,
          PrefetchHooks Function()
        > {
  $$TransactionsTableTableTableManager(
    _$AppDatabase db,
    $TransactionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> fundId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsTableCompanion(
                id: id,
                name: name,
                type: type,
                amount: amount,
                fundId: fundId,
                date: date,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String type,
                required double amount,
                required String fundId,
                required DateTime date,
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsTableCompanion.insert(
                id: id,
                name: name,
                type: type,
                amount: amount,
                fundId: fundId,
                date: date,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransactionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTableTable,
      TransactionDb,
      $$TransactionsTableTableFilterComposer,
      $$TransactionsTableTableOrderingComposer,
      $$TransactionsTableTableAnnotationComposer,
      $$TransactionsTableTableCreateCompanionBuilder,
      $$TransactionsTableTableUpdateCompanionBuilder,
      (
        TransactionDb,
        BaseReferences<_$AppDatabase, $TransactionsTableTable, TransactionDb>,
      ),
      TransactionDb,
      PrefetchHooks Function()
    >;
typedef $$UserTableTableCreateCompanionBuilder =
    UserTableCompanion Function({
      Value<String> id,
      Value<double> balance,
      Value<String?> notificationMethod,
      Value<int> rowid,
    });
typedef $$UserTableTableUpdateCompanionBuilder =
    UserTableCompanion Function({
      Value<String> id,
      Value<double> balance,
      Value<String?> notificationMethod,
      Value<int> rowid,
    });

class $$UserTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notificationMethod => $composableBuilder(
    column: $table.notificationMethod,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notificationMethod => $composableBuilder(
    column: $table.notificationMethod,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<String> get notificationMethod => $composableBuilder(
    column: $table.notificationMethod,
    builder: (column) => column,
  );
}

class $$UserTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTableTable,
          UserDb,
          $$UserTableTableFilterComposer,
          $$UserTableTableOrderingComposer,
          $$UserTableTableAnnotationComposer,
          $$UserTableTableCreateCompanionBuilder,
          $$UserTableTableUpdateCompanionBuilder,
          (UserDb, BaseReferences<_$AppDatabase, $UserTableTable, UserDb>),
          UserDb,
          PrefetchHooks Function()
        > {
  $$UserTableTableTableManager(_$AppDatabase db, $UserTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> balance = const Value.absent(),
                Value<String?> notificationMethod = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserTableCompanion(
                id: id,
                balance: balance,
                notificationMethod: notificationMethod,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> balance = const Value.absent(),
                Value<String?> notificationMethod = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserTableCompanion.insert(
                id: id,
                balance: balance,
                notificationMethod: notificationMethod,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTableTable,
      UserDb,
      $$UserTableTableFilterComposer,
      $$UserTableTableOrderingComposer,
      $$UserTableTableAnnotationComposer,
      $$UserTableTableCreateCompanionBuilder,
      $$UserTableTableUpdateCompanionBuilder,
      (UserDb, BaseReferences<_$AppDatabase, $UserTableTable, UserDb>),
      UserDb,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FundsTableTableTableManager get fundsTable =>
      $$FundsTableTableTableManager(_db, _db.fundsTable);
  $$TransactionsTableTableTableManager get transactionsTable =>
      $$TransactionsTableTableTableManager(_db, _db.transactionsTable);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
}
