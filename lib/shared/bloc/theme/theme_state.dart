import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeMode currentTheme;
  final String selectedTheme;

  const ThemeState({
    this.currentTheme = ThemeMode.light,
    this.selectedTheme = 'light'
  });

  ThemeState copyWith({ThemeMode? currentTheme, String? selectedTheme}) {
    return ThemeState(
        currentTheme: currentTheme ?? this.currentTheme,
        selectedTheme: selectedTheme ?? this.selectedTheme
    );
  }


  @override
  List<Object?> get props => [currentTheme,selectedTheme];
}
