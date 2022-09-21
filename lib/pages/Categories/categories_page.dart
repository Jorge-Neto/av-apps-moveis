import 'package:avaliacao/core/app_images.dart';
import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final int tableNumber;
  const CategoriesPage({Key? key, required this.tableNumber}) : super(key: key);

  _buildCard(String title, String image) {
    return Stack(children: [
      Container(
        width: 155,
        height: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            const BoxShadow(offset: Offset(2.0, 2.0), blurRadius: 5, spreadRadius: 1)
          ],
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
      Positioned(
        bottom: 30,
        left: 5,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: AppTextStyles.categoryTitle,
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          children: <Widget>[
            _buildCard('BEBIDAS', AppImages.drinkCategory),
            _buildCard('LANCHES', AppImages.burguerCategory),
            _buildCard('PIZZAS', AppImages.pizzaCategory),
            _buildCard('DOCES', AppImages.candyCategory),
            _buildCard('SORVETES', AppImages.iceCreamCategory),
            _buildCard('PORÇÕES', AppImages.portionsCategory
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categorias | Mesa ${tableNumber.toString().padLeft(2, "0")}',
          style: AppTextStyles.buttonTextBlack,
        ),
      ),
      body: _buildBody(),
    );
  }
}
