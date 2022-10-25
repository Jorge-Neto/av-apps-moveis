import 'package:avaliacao/core/app_text.dart';
import 'package:avaliacao/models/command_model.dart';
import 'package:avaliacao/repositories/commands_repository.dart';
import 'package:flutter/material.dart';

class ConsumptionPage extends StatelessWidget {
  final repository = CommandsRepository();
  final int tableNumber;

  ConsumptionPage({Key? key, required this.tableNumber}) : super(key: key);

  _buildList(CommandModel model) {
    return ListView.builder(
        itemCount: model.itens?.length,
        itemBuilder: (context, index) {
          final item = model.itens![index];
          return ListTile(
            title:
                Text(item.itemName, style: AppTextStyles.consumptionItemTitle),
            trailing: Text("R\$ ${item.itemValue.toStringAsFixed(2)}",
                style: AppTextStyles.consumptionItemValue),
          );
        });
  }

  _buildTotal(CommandModel model) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Total:",
            style: AppTextStyles.consumptionItemValue,
          ),
          Text("R\$ ${model.total.toStringAsFixed(2)}", style: AppTextStyles.consumptionItemValue)
        ],
      ),
    );
  }

  _buidButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {},
            child: const Text(
              "Encerrar",
              style: AppTextStyles.buttonTextWhite,
            )),
      ),
    );
  }

  _buildBody(CommandModel model) {
    return Column(
      children: [
        Expanded(flex: 3, child: _buildList(model)),
        Expanded(flex: 1, child: _buildTotal(model)),
        _buidButton(),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  _buildLoading() {
    return Center(child: LinearProgressIndicator());
  }

  _buildError() {
    return Center(
      child: Text(
        'Erro ao buscar informações do consumo!',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
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
      body: FutureBuilder<CommandModel>(
          future: repository.getCommand(tableNumber),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return _buildError();
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Nenhum dado foi encontrado"),
              );
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final comanda = snapshot.data!;
              return _buildBody(comanda);
            }
            return _buildLoading();
          }),
    );
  }
}
