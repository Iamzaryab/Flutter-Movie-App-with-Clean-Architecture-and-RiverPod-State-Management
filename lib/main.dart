import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/core/observers.dart';

import 'core/app.dart';
import 'di/Injector.dart';

void main() => runMain();

Future<void> runMain() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await initSingletons();
  provideDataSources();
  provideRepositories();
  provideUseCases();
  // Setting Device Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //status bar color
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
  //   statusBarColor: AppColors.white,
  //   statusBarBrightness: Brightness.light,
  // ));

  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: const MyApp(),
  ));
}
