// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:avaliacao/models/table_model.dart';
import 'package:avaliacao/repositories/tables_repository.dart';
import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'table_store.g.dart';

class TableStore = _TableStore with _$TableStore;

abstract class _TableStore with Store {

  _TableStore(){
    loadTables();
  }

  TablesRepository repository = TablesRepository();

  @observable
  ObservableList<TableModel> TablesList = ObservableList();

  @observable
  ObservableFuture<List<TableModel>> obsFuture = ObservableFuture.value([]);

  @computed
  bool get isLoading{
    return obsFuture.status == FutureStatus.pending;
  }

  @action
  Future<void> loadTables() async {
    final futureList = repository.getTable();
    obsFuture = ObservableFuture(futureList);
    final tables = await futureList;
    TablesList.addAll(tables);
  }
}