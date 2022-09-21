import 'package:avaliacao/components/item_widet.dart';
import 'package:flutter/material.dart';

class TablesPage extends StatelessWidget {
  const TablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 18.0, 15.0, 0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15),
          children: [
            ItemWidget(status: TableStatus.occupied, index: 1, totalValue: 35,),
            ItemWidget(status: TableStatus.free, index: 2, totalValue: 0,),
            ItemWidget(status: TableStatus.closing, index: 3, totalValue: 150,),
            ItemWidget(status: TableStatus.free, index: 4, totalValue: 0,),
            ItemWidget(status: TableStatus.closing, index: 5, totalValue: 10,),
            ItemWidget(status: TableStatus.occupied, index: 6, totalValue: 9,),
            ItemWidget(status: TableStatus.free, index: 7, totalValue: 130,),
            ItemWidget(status: TableStatus.free, index: 8, totalValue: 0,),
            ItemWidget(status: TableStatus.closing, index: 9, totalValue: 10,),
            ItemWidget(status: TableStatus.occupied, index: 10, totalValue: 9,),
          ],
        ),
      ),
    );
  }
}
