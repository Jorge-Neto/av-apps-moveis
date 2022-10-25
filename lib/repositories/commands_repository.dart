import 'dart:async';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:avaliacao/models/command_model.dart';

class CommandsRepository {
  Future<CommandModel> getCommand(int table) async {
    try {
      QueryBuilder<ParseObject> queryCommands =
      QueryBuilder<ParseObject>(ParseObject('Comanda'))..whereEqualTo('objectId', "UnFqIrar4A");
      final ParseResponse parseResponse = await queryCommands.query();
      final object = (parseResponse.results!.first) as ParseObject;

      final id = object.objectId;
      final comCode = object.get<int>('comCode')!;
      final comTable = object.get<int>('comTable')!;
      final comValue = object.get('comValue')!;
      final itens = object.get('itens')! ?? [];

      CommandModel command = CommandModel(
        objectId: id!,
        comCode: comCode,
        comTable: comTable,
        comValue: comValue.toDouble(),
        itens: itens,
      );

      return command;
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
        ..set('tableJunction', tableJunction)
        ..set('tableValue', tableValue);
      await table.save();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteTable(String id) async {
    try {
      var table = ParseObject('Table')..objectId = id;
      await table.delete();
    } catch (e) {
      throw Exception(e);
    }
  }
}
