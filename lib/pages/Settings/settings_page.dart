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
  final controllerNewPassword = TextEditingController();

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
                Navigator.of(context).pushReplacementNamed("/");
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

  void resetUserPassword() async {
    final password = controllerNewPassword.text.trim();
    final user = await ParseUser.currentUser() as ParseUser;
    user.password = password;
    var response = await user.save();
    if (response.success) {
      showSuccess("Você será deslogado!");
    } else {
      showError(response.error!.message);
    }
  }

  void doUserLogout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();
    if (response.success) {
      showSuccess("Você foi deslogado!");
    } else {
      showError(response.error!.message);
    }
  }

  void deleteUser() async {
    try {
      final currentUser = await ParseUser.currentUser() as ParseUser;
      var response = await currentUser.destroy();
      if (response!.success) {
        await currentUser.logout();
        showSuccess("Este usuário foi deletado!");
      } else {
        showError(response.error!.message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Deseja alterar sua senha?',
          style: AppTextStyles.buttonTextBlack,
        ),
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
          child: TextField(
            style: const TextStyle(color: Colors.black),
            controller: controllerNewPassword,
            obscureText: true,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.none,
            autocorrect: false,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.colorYellow)),
                labelText: 'Insira a nova senha aqui',
                labelStyle: TextStyle(color: Colors.black)),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 39,
          child: ElevatedButton(
            onPressed: () {
              resetUserPassword();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.primary),
            ),
            child: const Text('Resetar senha', style: AppTextStyles.buttonTextBlack),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 50, 10, 5),
          child: Center(
              child: ElevatedButton(
                onPressed: () {
                  doUserLogout();
                },
                child: const Text('Log Out', style: AppTextStyles.buttonTextBlack),
              )),
        ),
        Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.colorRed),
              onPressed: () {
                deleteUser();
              },
              child: const Text('Apagar conta',
                  style: AppTextStyles.buttonTextBlack),
            )),
      ],
    );
  }
}
