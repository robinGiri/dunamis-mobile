import 'package:flutter/material.dart';
import 'package:dunamis/app/app.dart';
import 'package:dunamis/app/di/di.dart';
import 'package:dunamis/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  await initDependencies();

  runApp(
    App(),
  );
}
