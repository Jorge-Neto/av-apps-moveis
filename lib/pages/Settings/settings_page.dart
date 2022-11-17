// ignore_for_file: use_build_context_synchronously

import 'package:avaliacao/core/app_colors.dart';
import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Center(
              child: ElevatedButton(
            onPressed: () {
              doUserLogout();
            },
            child: const Text('Log Out', style: AppTextStyles.buttonTextBlack),
          )),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: AppColors.colorRed),
            onPressed: () {
              deleteUser();
            },
            child: const Text('Apagar conta',
                style: AppTextStyles.buttonTextBlack),
          )),
        ),
      ],
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sucesso!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Erro!"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserLogout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();
    if (response.success) {
      showSuccess("Você foi deslogado!");
      Navigator.of(context).pushReplacementNamed("/");
    } else {
      showError(response.error!.message);
    }
  }

  void deleteUser() async {
    try {
      final currentUser = await ParseUser.currentUser() as ParseUser;
      var userToDelete = ParseObject('User')..objectId = currentUser.objectId;
      await userToDelete.delete();
      showSuccess("O usuário foi deletado!");
      Navigator.of(context).pushReplacementNamed("/");
    } catch (e) {
      throw Exception(e);
    }
  }
}
