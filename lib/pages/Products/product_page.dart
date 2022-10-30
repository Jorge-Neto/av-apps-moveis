import 'package:avaliacao/components/product_widget.dart';
import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final String categoryName;
  final int categoryCode;
  final int tableCode;

  ProductsPage(
      {Key? key,
      required this.categoryName,
      required this.categoryCode,
      required this.tableCode})
      : super(key: key);

  Widget _buildBody() {
    return ListView(
      children: [
        ProductWidget(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${this.categoryName} | Mesa ${this.tableCode.toString().padLeft(2, '0')}",
          style: AppTextStyles.buttonTextBlack,
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }
}
