// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:avaliacao/components/product_widget.dart';
import 'package:avaliacao/core/app_text.dart';
import 'package:avaliacao/models/product_model.dart';
import 'package:avaliacao/repositories/products_repository.dart';

import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final String categoryName;
  final int categoryCode;
  final int tableCode;
  final repository = ProductsRepository();

  ProductsPage({Key? key,
    required this.categoryName,
    required this.categoryCode,
    required this.tableCode})
      : super(key: key);

  Widget _buildBody(List<ProductModel> productsList) {
    return ListView(
      children: productsList.map((model) =>
          ProductWidget(productModel: model,
          )
      ).toList(),
    );
  }

  _buildError() {
    return const Center(
      child: Text(
        'Erro ao buscar produtos!',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }

  _buildNoData() {
    return const Center(
      child: Text(
        'Nenhum produto encontrado!',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  _buildLoading() {
    return const Center(child: LinearProgressIndicator());
  }

  _builderBottomButton(){
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: () {
        },
        child: const Text(
          "Teste",
          style: AppTextStyles.buttonTextWhite,
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${categoryName} | Mesa ${tableCode.toString().padLeft(
              2, '0')}",
          style: AppTextStyles.buttonTextBlack,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
          future: repository.getProductsByCategory(categoryCode),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return _buildError();
            }
            if (!snapshot.hasData) {
              return _buildNoData();
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return _buildBody(snapshot.data!);
            }
            return _buildLoading();
          }
      ),
    );
  }
}
