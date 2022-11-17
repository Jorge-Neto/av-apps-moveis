import 'package:avaliacao/core/app_colors.dart';
import 'package:avaliacao/models/product_arguments_model.dart';
import 'package:avaliacao/pages/Categories/categories_page.dart';
import 'package:avaliacao/pages/Consumption/consumption_page.dart';
import 'package:avaliacao/pages/Home/home_page.dart';
import 'package:avaliacao/pages/Login/login_page.dart';
import 'package:avaliacao/pages/Products/product_page.dart';
import 'package:avaliacao/pages/Registraion/registration_page.dart';
import 'package:avaliacao/pages/Settings/settings_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lanchonete',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
        "/categories": (context) => CategoriesPage(
            tableNumber: ModalRoute.of(context)!.settings.arguments as int),
        "/consumption": (context) => ConsumptionPage(
            tableNumber: ModalRoute.of(context)!.settings.arguments as int),
        "/registration": (context) => const RegistrationPage(),
        "/settings": (context) => const SettingsPage(),
        "/products": (context) {
          final arguments =
              ModalRoute.of(context)!.settings.arguments as ProductArguments;
          return ProductsPage(
            categoryName: arguments.categoryName,
            categoryCode: arguments.categoryCode,
            tableCode: arguments.tableCode,
          );
        },
      },
    );
  }
}
