import 'package:avaliacao/core/app_colors.dart';
import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

class ConsumptionPage extends StatelessWidget {
  final int tableNumber;

  const ConsumptionPage({Key? key, required this.tableNumber})
      : super(key: key);

  _buildList() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Cola-Cola", style: AppTextStyles.consumptionItemTitle),
            trailing: Text(
                "R\$ 5.00", style: AppTextStyles.consumptionItemValue),
          );
        }
    );
  }

  _buildTotal(){
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Total:", style: AppTextStyles.consumptionItemValue,),
          Text("R\$ 15.00", style: AppTextStyles.consumptionItemValue)
        ],
      ),
    );
  }

  _buidButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Container(
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {},
            child: Text("Encerrar", style: AppTextStyles.buttonTextWhite,)),
      ),
    );
  }

  _buildBody() {
    return Column(
      children: [
        Expanded(child: _buildList()),
        _buildTotal(),
        _buidButton(),
        SizedBox(height: 30,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Produtos | Mesa ${tableNumber.toString().padLeft(2, "0")}",
            style: AppTextStyles.buttonTextBlack),
      ),
      body: _buildBody(),
    );
  }
}
