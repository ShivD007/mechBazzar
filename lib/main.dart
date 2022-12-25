import 'package:admin_jandhara/app_launch.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'core/di/injection_container.dart' as di;
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(const AppLaunch());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
  }
}
