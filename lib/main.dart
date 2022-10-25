import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:avaliacao/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = 'pxsU3vMp2zkCiSyKQq51jaochb4zqRS9wHECPeCZ';
  const keyClientKey = 'l08Mm96yutZHLF6inKSlOEjb5UkNGVN77xyMMdj6';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(const AppWidget());
}
