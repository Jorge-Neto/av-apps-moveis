import 'dart:async';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:avaliacao/models/product_model.dart';

class ProductsRepository {

  Future<List<ProductModel>> getProductsByCategory(int category) async {
    try {
      QueryBuilder<ParseObject> queryProducts =
      QueryBuilder<ParseObject>(ParseObject('Products'))..whereEqualTo('category', category);

      final ParseResponse parseResponse = await queryProducts.query();
      List<ProductModel> productsList = [];

      if (parseResponse.success && parseResponse.results != null) {
        final objects = parseResponse.results as List<ParseObject>;
        for (ParseObject object in objects) {
          final id = object.objectId;
          final code = object.get<int>('code')!;
          final name = object.get<String>('name')!;
          final value = object.get('value')!;
          final imageUrl = object.get<String>('imageUrl')!;

          ProductModel product = ProductModel(
            objectId: id!,
            code: code,
            name: name,
            value: value.toDouble(),
            imageUrl: imageUrl,
          );

          productsList.add(product);
        }
      }

      return productsList;

    } catch (e) {
      throw Exception(e);
    }
  }

}
