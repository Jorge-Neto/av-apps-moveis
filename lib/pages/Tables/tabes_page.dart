import 'package:avaliacao/components/item_widet.dart';
import 'package:avaliacao/models-views/table_store.dart';
import 'package:avaliacao/models/table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TablesPage extends StatelessWidget {
  TablesPage({Key? key}) : super(key: key);
  final tableStore = TableStore();

  Widget _buildItemCard(TableModel table, index) {
    return ItemWidget(
      status: stringToStatus(table.tableState),
      totalValue: table.tableValue,
      index: index,
    );
  }

  GridView _buildGridTables() {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15),
        itemCount: tableStore.TablesList.length,
        itemBuilder: (context, index) {
          final table = tableStore.TablesList[index];

          ///Serve para atualizar o item
          return Observer(builder: (_) {
            return _buildItemCard(table, index);
          });
        });
  }

  _buildNoData() {
    return Center(
      child: Text(
        'Nenhuma mesa encontrada!',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  _buildLoading() {
    return Center(child: LinearProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (tableStore.isLoading) {
          return _buildLoading();
        }
        if (tableStore.TablesList.isEmpty) {
          return _buildNoData();
        }
        return _buildGridTables();
      }),
    );
  }
}
