// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:avaliacao/core/app_colors.dart';
import 'package:avaliacao/core/app_images.dart';
import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 50.0, 10.0, 0),
          child: Column(
            children: [
              Image.asset(
                AppImages.logo,
                height: 150,
                width: 150,
              ),
              const SizedBox(
                height: 100,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: controllerUsername,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.colorYellow)),
                    labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black)
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: controllerPassword,
                obscureText: true,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.colorYellow)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                width: double.infinity,
                height: 39,
                child: ElevatedButton(
                  onPressed: () {
                    doUserLogin();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.primary),
                  ),
                  child: const Text('Acessar', style: AppTextStyles.buttonTextBlack),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/registration");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.primary),
                    ),
                    child: const Text('Criar conta', style: AppTextStyles.buttonTextBlack),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/home");
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

  void doUserLogin() async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();
    if(username.isEmpty || password.isEmpty) {
      showError("Todos os campos devem ser preenchidos");
    }

    final user = ParseUser(username, password, null);

    var response = await user.login();
    if (response.success) {
      showSuccess("Login efetuado");
    } else {
      showError(response.error!.message);
    }
  }
}
