import 'package:avaliacao/core/app_colors.dart';
import 'package:avaliacao/core/app_images.dart';
import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 50.0, 10.0, 0),
        child: Column(
          children: [
            Image.asset(
              AppImages.logo,
              height: 150,
              width: 150,
            ),
            const Text(
              'Usuário',
              style: AppTextStyles.textWhite,
            ),
            TextFormField(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 39,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/home");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.primary),
                ),
                child: const Text('Acessar', style: AppTextStyles.buttonTextBlack),
              ),
            )
          ],
        ),
      ),
    );
  }
}
