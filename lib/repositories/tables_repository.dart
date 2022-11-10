import 'dart:async';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:avaliacao/models/table_model.dart';

class TablesRepository {
  Future<List<TableModel>> getTable() async {
    try {
      QueryBuilder<ParseObject> queryTable =
          QueryBuilder<ParseObject>(ParseObject('Tables'));
      final ParseResponse apiResponse = await queryTable.query();

      List<TableModel> tableList = [];
      if (apiResponse.success && apiResponse.results != null) {
        final objects = apiResponse.results as List<ParseObject>;
        for (ParseObject object in objects) {
          final id = object.objectId;
          final tableName = object.get<String>('tableName')!;
          final tableState = object.get<String>('tableState')!;
          final tableValue = object.get('tableValue')!;
          final tableCode = object.get<int>('tableCode')!;

          TableModel table = TableModel(
            objectId: id!,
            tableName: tableName,
            tableState: tableState,
            tableValue: tableValue.toDouble(),
            tableCode: tableCode,
          );

          tableList.add(table);
        }
        return tableList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveTable(String tableState, String tableName, int tableJunction,
      double tableValue) async {
    try {
      final table = ParseObject('Tables')
        ..set('tableState', tableState)
        ..set('tableName', tableName)
        ..set('tableJunction', tableJunction)
        ..set('tableValue', tableValue);
      await table.save();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateTable(String id, String tableState, int tableJunction,
      double tableValue) async {
    try {
      var table = ParseObject('Table')
        ..objectId = id
        ..set('tableState', tableState)
        ..set('tableValue', tableValue);
      await table.save();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> deleteTable(String id) async {
    try {
      var table = ParseObject('Table')..objectId = id;
      await table.delete();
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
