import 'dart:async';
import 'package:avaliacao/models/product_model.dart';

import 'package:avaliacao/repositories/products_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:avaliacao/models/command_model.dart';

class CommandsRepository {
  final productRepository = ProductsRepository();

  getProductsList(listItens) async {
    try {
      List<ProductModel> productsList = [];
      listItens.forEach((item) async {
        ProductModel product =
            await productRepository.getProduct(item.objectId);
        productsList.add(product);
      });
      return productsList;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CommandModel> getCommand(int table) async {
    try {
      QueryBuilder<ParseObject> queryCommand =
          QueryBuilder<ParseObject>(ParseObject('Comanda'))
            ..whereEqualTo('comTable', table);

      final ParseResponse parseResponse = await queryCommand.query();
      final object = (parseResponse.results?.first) as ParseObject;

      final id = object.objectId;
      final comCode = object.get<int>('comCode')!;
      final comTable = object.get<int>('comTable')!;
      final itens = object.get("consumption");

      List<ProductModel> productsList = [];
      for (dynamic item in itens) {
        try {
          ProductModel product =
              await productRepository.getProduct(item.objectId);
          productsList.add(product);
        } catch (e) {
          throw Exception(e);
        }
      }

      CommandModel command = CommandModel(
        objectId: id!,
        comCode: comCode,
        comTable: comTable,
        itens: productsList,
      );

      return command;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> clearCommand(CommandModel command) async {
    try {
      var commandToSet = ParseObject('Comanda')
        ..objectId = command.objectId
        ..set('consumption', [
          {"__type": "Pointer", "className": "_Product", "objectId": ""}
        ]);
      await commandToSet.save();

      QueryBuilder<ParseObject> queryTable =
          QueryBuilder<ParseObject>(ParseObject('Tables'))
            ..whereEqualTo('tableCode', command.comTable);
      final ParseResponse parseResponse = await queryTable.query();
      final object = (parseResponse.results?.first) as ParseObject;
      var tableToClear = ParseObject('Tables')
        ..objectId = object.objectId
        ..set('tableValue', 0)
        ..set('tableState', "A");
      await tableToClear.save();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveCommand(command) async {
    try {} catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateCommand(command) async {
    try {} catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteCommand(command) async {
    try {} catch (e) {
      throw Exception(e);
    }
  }
}
