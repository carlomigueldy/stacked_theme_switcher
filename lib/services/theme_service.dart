import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:flutter/material.dart';

@lazySingleton
class ThemeService with ReactiveServiceMixin {
  ThemeService() {
    listenToReactiveValues([_theme]);
  }

  RxValue<ThemeMode> _theme = RxValue<ThemeMode>(initial: ThemeMode.light);
  ThemeMode get theme => _theme.value;
  bool get isDark => _theme.value == ThemeMode.dark;
  bool get isLight => _theme.value == ThemeMode.light;

  /// Toggles the theme [ThemeMode]
  ///
  /// @return void
  void toggleTheme() {
    if (_theme.value == ThemeMode.light) {
      _theme.value = ThemeMode.dark;
    } else {
      _theme.value = ThemeMode.light;
    }
  }

  /// Here we define our theme colors for dark mode
  ThemeData get darkTheme {
    return ThemeData(
      backgroundColor: Colors.grey[900],
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        color: Colors.grey[850],
      ),
    );
  }

  /// Here we define our theme colors for light theme
  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
    );
  }
}
