import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

class TablesPage extends StatelessWidget {
  const TablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Mesas',
          style: AppTextStyles.buttonTextBlack,
        ),
      ),
    );
  }
}
