import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Settings',
          style: AppTextStyles.buttonTextBlack,
        ),
      ),
    );
  }
}
