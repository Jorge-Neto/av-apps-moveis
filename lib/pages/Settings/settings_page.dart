import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Servidor',
            hintText: 'Informe o IP do servidor',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
        ),
      ),
    );
  }
}
