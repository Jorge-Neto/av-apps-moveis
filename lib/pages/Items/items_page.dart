import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'Página em construção',
              style: AppTextStyles.buttonTextBlack,
            ),
          ),
          Icon(Icons.close),
        ],
      ),
    );
  }
}
