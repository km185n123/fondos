// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FondosTableTable extends FondosTable
    with TableInfo<$FondosTableTable, FondoDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FondosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _montoMinimoMeta = const VerificationMeta(
    'montoMinimo',
  );
  @override
  late final GeneratedColumn<double> montoMinimo = GeneratedColumn<double>(
    'monto_minimo',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoriaMeta = const VerificationMeta(
    'categoria',
  );
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
    'categoria',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre, montoMinimo, categoria];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fondos_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FondoDb> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('monto_minimo')) {
      context.handle(
        _montoMinimoMeta,
        montoMinimo.isAcceptableOrUnknown(
          data['monto_minimo']!,
          _montoMinimoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_montoMinimoMeta);
    }
    if (data.containsKey('categoria')) {
      context.handle(
        _categoriaMeta,
        categoria.isAcceptableOrUnknown(data['categoria']!, _categoriaMeta),
      );
    } else if (isInserting) {
      context.missing(_categoriaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FondoDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FondoDb(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      montoMinimo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}monto_minimo'],
      )!,
      categoria: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria'],
      )!,
    );
  }

  @override
  $FondosTableTable createAlias(String alias) {
    return $FondosTableTable(attachedDatabase, alias);
  }
}

class FondoDb extends DataClass implements Insertable<FondoDb> {
  final String id;
  final String nombre;
  final double montoMinimo;
  final String categoria;
  const FondoDb({
    required this.id,
    required this.nombre,
    required this.montoMinimo,
    required this.categoria,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nombre'] = Variable<String>(nombre);
    map['monto_minimo'] = Variable<double>(montoMinimo);
    map['categoria'] = Variable<String>(categoria);
    return map;
  }

  FondosTableCompanion toCompanion(bool nullToAbsent) {
    return FondosTableCompanion(
      id: Value(id),
      nombre: Value(nombre),
      montoMinimo: Value(montoMinimo),
      categoria: Value(categoria),
    );
  }

  factory FondoDb.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FondoDb(
      id: serializer.fromJson<String>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      montoMinimo: serializer.fromJson<double>(json['montoMinimo']),
      categoria: serializer.fromJson<String>(json['categoria']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nombre': serializer.toJson<String>(nombre),
      'montoMinimo': serializer.toJson<double>(montoMinimo),
      'categoria': serializer.toJson<String>(categoria),
    };
  }

  FondoDb copyWith({
    String? id,
    String? nombre,
    double? montoMinimo,
    String? categoria,
  }) => FondoDb(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    montoMinimo: montoMinimo ?? this.montoMinimo,
    categoria: categoria ?? this.categoria,
  );
  FondoDb copyWithCompanion(FondosTableCompanion data) {
    return FondoDb(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      montoMinimo: data.montoMinimo.present
          ? data.montoMinimo.value
          : this.montoMinimo,
      categoria: data.categoria.present ? data.categoria.value : this.categoria,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FondoDb(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('montoMinimo: $montoMinimo, ')
          ..write('categoria: $categoria')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, montoMinimo, categoria);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FondoDb &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.montoMinimo == this.montoMinimo &&
          other.categoria == this.categoria);
}

class FondosTableCompanion extends UpdateCompanion<FondoDb> {
  final Value<String> id;
  final Value<String> nombre;
  final Value<double> montoMinimo;
  final Value<String> categoria;
  final Value<int> rowid;
  const FondosTableCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.montoMinimo = const Value.absent(),
    this.categoria = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FondosTableCompanion.insert({
    required String id,
    required String nombre,
    required double montoMinimo,
    required String categoria,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nombre = Value(nombre),
       montoMinimo = Value(montoMinimo),
       categoria = Value(categoria);
  static Insertable<FondoDb> custom({
    Expression<String>? id,
    Expression<String>? nombre,
    Expression<double>? montoMinimo,
    Expression<String>? categoria,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (montoMinimo != null) 'monto_minimo': montoMinimo,
      if (categoria != null) 'categoria': categoria,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FondosTableCompanion copyWith({
    Value<String>? id,
    Value<String>? nombre,
    Value<double>? montoMinimo,
    Value<String>? categoria,
    Value<int>? rowid,
  }) {
    return FondosTableCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      montoMinimo: montoMinimo ?? this.montoMinimo,
      categoria: categoria ?? this.categoria,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (montoMinimo.present) {
      map['monto_minimo'] = Variable<double>(montoMinimo.value);
    }
    if (categoria.present) {
      map['categoria'] = Variable<String>(categoria.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FondosTableCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('montoMinimo: $montoMinimo, ')
          ..write('categoria: $categoria, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FondosTableTable fondosTable = $FondosTableTable(this);
  late final FondoDao fondoDao = FondoDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [fondosTable];
}

typedef $$FondosTableTableCreateCompanionBuilder =
    FondosTableCompanion Function({
      required String id,
      required String nombre,
      required double montoMinimo,
      required String categoria,
      Value<int> rowid,
    });
typedef $$FondosTableTableUpdateCompanionBuilder =
    FondosTableCompanion Function({
      Value<String> id,
      Value<String> nombre,
      Value<double> montoMinimo,
      Value<String> categoria,
      Value<int> rowid,
    });

class $$FondosTableTableFilterComposer
    extends Composer<_$AppDatabase, $FondosTableTable> {
  $$FondosTableTableFilterComposer({
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

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get montoMinimo => $composableBuilder(
    column: $table.montoMinimo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FondosTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FondosTableTable> {
  $$FondosTableTableOrderingComposer({
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

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get montoMinimo => $composableBuilder(
    column: $table.montoMinimo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FondosTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FondosTableTable> {
  $$FondosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<double> get montoMinimo => $composableBuilder(
    column: $table.montoMinimo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoria =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);
}

class $$FondosTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FondosTableTable,
          FondoDb,
          $$FondosTableTableFilterComposer,
          $$FondosTableTableOrderingComposer,
          $$FondosTableTableAnnotationComposer,
          $$FondosTableTableCreateCompanionBuilder,
          $$FondosTableTableUpdateCompanionBuilder,
          (FondoDb, BaseReferences<_$AppDatabase, $FondosTableTable, FondoDb>),
          FondoDb,
          PrefetchHooks Function()
        > {
  $$FondosTableTableTableManager(_$AppDatabase db, $FondosTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FondosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FondosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FondosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<double> montoMinimo = const Value.absent(),
                Value<String> categoria = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FondosTableCompanion(
                id: id,
                nombre: nombre,
                montoMinimo: montoMinimo,
                categoria: categoria,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nombre,
                required double montoMinimo,
                required String categoria,
                Value<int> rowid = const Value.absent(),
              }) => FondosTableCompanion.insert(
                id: id,
                nombre: nombre,
                montoMinimo: montoMinimo,
                categoria: categoria,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FondosTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FondosTableTable,
      FondoDb,
      $$FondosTableTableFilterComposer,
      $$FondosTableTableOrderingComposer,
      $$FondosTableTableAnnotationComposer,
      $$FondosTableTableCreateCompanionBuilder,
      $$FondosTableTableUpdateCompanionBuilder,
      (FondoDb, BaseReferences<_$AppDatabase, $FondosTableTable, FondoDb>),
      FondoDb,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FondosTableTableTableManager get fondosTable =>
      $$FondosTableTableTableManager(_db, _db.fondosTable);
}
