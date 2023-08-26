import 'package:filmku/shared/provider/state/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/app/app_constants.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/shared/local/shared_prefs/shared_pref.dart';

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
    sharedPref.set(AppConstants.CURRENT_THEME, state.selectedTheme);
  }

  void setLightTheme() {
    state =
        state.copyWith(currentTheme: ThemeMode.light, selectedTheme: 'light');
    sharedPref.set(AppConstants.CURRENT_THEME, state.selectedTheme);
  }

  void setDefaultTheme() {
    sharedPref.set(AppConstants.CURRENT_THEME, 'default');
    final defaultThemeMode = WidgetsBinding.instance.window.platformBrightness;
    final value = ThemeMode.values.byName(defaultThemeMode.name);
    state = state.copyWith(currentTheme: value, selectedTheme: 'default');
  }

  void getCurrentTheme() async {
    final String? theme =
        await sharedPref.get(AppConstants.CURRENT_THEME) as String?;
    if (theme == null || theme == 'default') {
      final defaultThemeMode =
          WidgetsBinding.instance.window.platformBrightness;
      final value = ThemeMode.values.byName(defaultThemeMode.name);
      state = state.copyWith(currentTheme: value, selectedTheme: 'default');
    } else {
      final value = ThemeMode.values.byName(theme);
      state = state.copyWith(currentTheme: value, selectedTheme: value.name);
    }
  }

}
