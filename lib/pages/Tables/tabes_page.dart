import 'package:avaliacao/components/item_widet.dart';
import 'package:avaliacao/models/table_model.dart';
import 'package:avaliacao/repositories/tables_repository.dart';
import 'package:flutter/material.dart';

class TablesPage extends StatelessWidget {
  final repository = TablesRepository();

  TablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 18.0, 15.0, 0),
        child: FutureBuilder<List<TableModel>>(
          future: repository.getTable(),
          initialData: const [],
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Erro ao buscar informações das mesas!',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No table in database"),
              );
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return _buildGridTables(snapshot.data!);
            }
            return const Center(child: LinearProgressIndicator
              ());
          },
        ),
      ),
    );
  }

  List<Widget> _buildItemCard(List<TableModel> tablesList) {
    var list = <Widget>[];
    for (var i = 0; i < tablesList.length; i++) {
      var table = tablesList[i];
      list.add(
        ItemWidget(
            status: stringToStatus(table.tableState),
            index: i + 1,
            totalValue: table.tableValue),
      );
    }
    return list;
  }

  GridView _buildGridTables(List<TableModel> tablesList) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      children: _buildItemCard(tablesList),
    );
  }
}
