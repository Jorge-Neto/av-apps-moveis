import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Items',
          style: AppTextStyles.buttonTextBlack,
        ),
      ),
    );
  }
}
