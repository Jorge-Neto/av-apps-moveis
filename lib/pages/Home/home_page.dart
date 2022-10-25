import 'package:avaliacao/core/app_colors.dart';
import 'package:avaliacao/pages/Items/items_page.dart';
import 'package:avaliacao/pages/Settings/settings_page.dart';
import 'package:avaliacao/pages/Tables/tabes_page.dart';
import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

enum Pages { initial, tables, items, settings }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  final _pages = <Widget>[
    const initialScreen(),
    TablesPage(),
    const ItemsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mesas | Comandas',
            style: AppTextStyles.buttonTextBlack),
      ),
      body: _pages.elementAt(_tabIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (index) {
          _tabIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.apps_sharp), label: "Mesas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_sharp), label: "Itens"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Configs"),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class initialScreen extends StatelessWidget {
  const initialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              "Comanda ou Mesa",
              style: AppTextStyles.textGrey,
            ),
            TextFormField(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomButtons(title: 'Inserir Item'),
                  CustomButtons(title: 'Ver detalhes'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButtons extends StatelessWidget {
  final String title;

  const CustomButtons({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 59,
        width: 110,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.primary)),
            onPressed: () {},
            child: Text(
              title,
              style: AppTextStyles.buttonTextBlack,
              textAlign: TextAlign.center,
            )));
  }
}
