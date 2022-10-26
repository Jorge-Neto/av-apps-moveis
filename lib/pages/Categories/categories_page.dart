import 'package:avaliacao/core/app_text.dart';
import 'package:avaliacao/models/category_model.dart';
import 'package:avaliacao/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final int tableNumber;
  final repository = CategoryRepository();

  CategoriesPage({Key? key, required this.tableNumber}) : super(key: key);

  Widget _buildCard(String title, String image) {
    return Stack(children: [
      Container(
        width: 155,
        height: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(offset: Offset(2.0, 2.0), blurRadius: 5, spreadRadius: 1)
          ],
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        ),
      ),
      Positioned(
        bottom: 35,
        left: 4,
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

  GridView _buildSuccess(List<CategoryModel> categoriesList) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
      children: categoriesList
          .map((model) => _buildCard(model.name, model.imageUrl))
          .toList(),
    );
  }

  _buildError() {
    return Center(
      child: Text(
        'Erro ao buscar categorias!',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }

  _buildNoData() {
    return Center(
      child: Text(
        'Nenhuma categoria encontrada!',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  _buildLoading() {
    return Center(child: LinearProgressIndicator());
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 30.0, 10.0, 10.0),
      child: FutureBuilder<List<CategoryModel>>(
          initialData: const [],
          future: repository.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return _buildError();
            }
            if (!snapshot.hasData) {
              return _buildNoData();
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return _buildSuccess(snapshot.data!);
            }
            return _buildLoading();
          }),
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
