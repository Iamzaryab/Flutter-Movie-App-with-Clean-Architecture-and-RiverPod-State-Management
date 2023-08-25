//
// import 'package:flutter/material.dart';
// import 'package:filmku/app/app_constants.dart';
// import 'package:filmku/di/Injector.dart';
// import 'package:filmku/shared/local/shared_prefs/shared_pref.dart';
// final appThemeProvider = StateNotifierProvider<AppThemeChangeNotifier, ThemeMode>((ref) {
//   final sharedPref = injector.get<SharedPref>();
//   return AppThemeChangeNotifier(sharedPref);
// });
//
// class AppThemeChangeNotifier extends StateNotifier<ThemeMode> {
//   final SharedPref sharedPref;
//
//   ThemeMode currentTheme = ThemeMode.light;
//
//   AppThemeChangeNotifier(this.sharedPref) : super(ThemeMode.light) {
//     getCurrentTheme();
//   }
//
//   void toggleTheme() {
//     state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
//     sharedPref.set(AppConstants.CURRENT_THEME, state.name);
//   }
//
//   void setDefaultTheme() {
//     sharedPref.set(AppConstants.CURRENT_THEME, 'default');
//   }
//
//   void getCurrentTheme() async {
//     final theme = await sharedPref.get(AppConstants.CURRENT_THEME);
//     if (theme==null) {
//       final defaultThemeMode = WidgetsBinding.instance.window.platformBrightness;
//       final value = ThemeMode.values.byName(defaultThemeMode.name);
//       state = value;
//     } else {
//       final value = ThemeMode.values.byName(theme as String);
//       state = value;
//     }
//   }
// }
