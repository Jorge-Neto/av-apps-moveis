// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TableStore on _TableStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_TableStore.isLoading'))
      .value;

  late final _$TablesListAtom =
      Atom(name: '_TableStore.TablesList', context: context);

  @override
  ObservableList<TableModel> get TablesList {
    _$TablesListAtom.reportRead();
    return super.TablesList;
  }

  @override
  set TablesList(ObservableList<TableModel> value) {
    _$TablesListAtom.reportWrite(value, super.TablesList, () {
      super.TablesList = value;
    });
  }

  late final _$obsFutureAtom =
      Atom(name: '_TableStore.obsFuture', context: context);

  @override
  ObservableFuture<List<TableModel>> get obsFuture {
    _$obsFutureAtom.reportRead();
    return super.obsFuture;
  }

  @override
  set obsFuture(ObservableFuture<List<TableModel>> value) {
    _$obsFutureAtom.reportWrite(value, super.obsFuture, () {
      super.obsFuture = value;
    });
  }

  late final _$loadTablesAsyncAction =
      AsyncAction('_TableStore.loadTables', context: context);

  @override
  Future<void> loadTables() {
    return _$loadTablesAsyncAction.run(() => super.loadTables());
  }

  @override
  String toString() {
    return '''
TablesList: ${TablesList},
obsFuture: ${obsFuture},
isLoading: ${isLoading}
    ''';
  }
}
