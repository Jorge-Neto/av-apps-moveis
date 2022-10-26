import 'dart:async';

import 'package:avaliacao/models/category_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getCategories() async {
    try {
      QueryBuilder<ParseObject> queryCategories =
          QueryBuilder<ParseObject>(ParseObject('Categories'));
      final ParseResponse parseResponse = await queryCategories.query();
      List<CategoryModel> categoryList = [];

      if (parseResponse.success && parseResponse.results != null) {
        final objects = parseResponse.results as List<ParseObject>;
        for (ParseObject object in objects) {
          final id = object.objectId;
          final code = object.get<int>('code')!;
          final name = object.get<String>('name')!;
          final imageUrl = object.get<String>('imageUrl')!;

          CategoryModel category = CategoryModel(
            objectId: id!,
            code: code,
            name: name,
            imageUrl: imageUrl,
          );

          categoryList.add(category);
        }
      }

      return categoryList;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveCategory(category) async {
    try {

    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateCategory(category) async {
    try {

    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
    } catch (e) {
      throw Exception(e);
    }
  }
}
