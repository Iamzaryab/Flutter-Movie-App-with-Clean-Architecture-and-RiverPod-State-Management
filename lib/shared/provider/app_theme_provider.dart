import 'package:filmku/app/app_constants.dart';
import 'package:filmku/di/injector.dart';
import 'package:filmku/shared/local/shared_prefs/shared_pref.dart';
import 'package:filmku/shared/provider/state/theme_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider =
    StateNotifierProvider<AppThemeChangeNotifier, ThemeState>((ref) {
  final sharedPref = injector.get<SharedPref>();
  return AppThemeChangeNotifier(sharedPref);
});

class AppThemeChangeNotifier extends StateNotifier<ThemeState> {
  final SharedPref sharedPref;

  ThemeMode currentTheme = ThemeMode.light;

  AppThemeChangeNotifier(this.sharedPref) : super(const ThemeState()) {
    getCurrentTheme();
  }

  void setDarkTheme() {
    state = state.copyWith(currentTheme: ThemeMode.dark, selectedTheme: 'dark');
    sharedPref.set(AppConstants.currentTheme, state.selectedTheme);
  }

  void setLightTheme() {
    state =
        state.copyWith(currentTheme: ThemeMode.light, selectedTheme: 'light');
    sharedPref.set(AppConstants.currentTheme, state.selectedTheme);
  }

  void setDefaultTheme() {
    sharedPref.set(AppConstants.currentTheme, 'default');
    final defaultThemeMode = PlatformDispatcher.instance.platformBrightness;
    final value = ThemeMode.values.byName(defaultThemeMode.name);
    state = state.copyWith(currentTheme: value, selectedTheme: 'default');
  }

  void getCurrentTheme() async {
    final String? theme =
        await sharedPref.get(AppConstants.currentTheme) as String?;
    if (theme == null || theme == 'default') {
      final defaultThemeMode = PlatformDispatcher.instance.platformBrightness;

      final value = ThemeMode.values.byName(defaultThemeMode.name);
      state = state.copyWith(currentTheme: value, selectedTheme: 'default');
    } else {
      final value = ThemeMode.values.byName(theme);
      state = state.copyWith(currentTheme: value, selectedTheme: value.name);
    }
  }
}
