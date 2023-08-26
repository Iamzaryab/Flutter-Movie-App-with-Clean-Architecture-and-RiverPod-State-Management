import 'package:equatable/equatable.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrentThemeEvent extends ThemeEvent {
  const GetCurrentThemeEvent();
}

class SetDarkThemeEvent extends ThemeEvent {
  const SetDarkThemeEvent();
}

class SetLightThemeEvent extends ThemeEvent {
  const SetLightThemeEvent();
}

class SetDefaultSystemThemeEvent extends ThemeEvent {
  const SetDefaultSystemThemeEvent();
}
