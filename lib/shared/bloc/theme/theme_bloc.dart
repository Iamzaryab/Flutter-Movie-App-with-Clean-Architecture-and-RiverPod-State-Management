import 'dart:developer';

import 'package:filmku/app/app_constants.dart';
import 'package:filmku/shared/bloc/theme/theme_event.dart';
import 'package:filmku/shared/bloc/theme/theme_state.dart';
import 'package:filmku/shared/local/shared_prefs/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filmku/di/Injector.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final sharedPref = injector.get<SharedPref>();

  ThemeBloc() : super(const ThemeState()) {
    on<GetCurrentThemeEvent>(_getDefaultThemeEvent);
    on<SetDarkThemeEvent>(_setDarkTheme);
    on<SetLightThemeEvent>(_setLightTheme);
    on<SetDefaultSystemThemeEvent>(_setDefaultThemeEvent);
  }

  void _setDarkTheme(SetDarkThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(currentTheme: ThemeMode.dark, selectedTheme: 'dark'));
    sharedPref.set(AppConstants.CURRENT_THEME, state.selectedTheme);
  }

  void _setLightTheme(SetLightThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(currentTheme: ThemeMode.light, selectedTheme: 'light'));
    sharedPref.set(AppConstants.CURRENT_THEME, state.selectedTheme);
  }

  void _setDefaultThemeEvent(
      SetDefaultSystemThemeEvent event, Emitter<ThemeState> emit) {
    sharedPref.set(AppConstants.CURRENT_THEME, 'default');
    final defaultThemeMode = WidgetsBinding.instance.window.platformBrightness;
    final value = ThemeMode.values.byName(defaultThemeMode.name);
    emit(state.copyWith(currentTheme: value, selectedTheme: 'default'));
  }

  void _getDefaultThemeEvent(
      GetCurrentThemeEvent event, Emitter<ThemeState> emit) async {

    final String? theme = await sharedPref.get(AppConstants.CURRENT_THEME) as String?;
    if (theme == null || theme == 'default') {
      final defaultThemeMode = WidgetsBinding.instance.window.platformBrightness;
      final value = ThemeMode.values.byName(defaultThemeMode.name);
      emit(state.copyWith(currentTheme: value, selectedTheme: 'default'));
    } else {
      final value = ThemeMode.values.byName(theme);
      emit(state.copyWith(currentTheme: value, selectedTheme: value.name));
    }
  }
}
