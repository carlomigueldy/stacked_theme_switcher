import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_theme_switcher/app/locator.dart';
import 'package:stacked_theme_switcher/ui/views/home/home_view.dart';

import 'services/theme_service.dart';

void main() {
  setupLocator();
  runApp(MainView());
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stacked Theme Switcher',
        themeMode: model.themeMode,
        theme: model.themeData,
        home: HomeView(),
      ),
    );
  }
}

class MainViewModel extends ReactiveViewModel {
  final _themeService = locator<ThemeService>();

  ThemeMode get themeMode => _themeService.theme;
  ThemeData get themeData => _themeService.isLight
      ? _themeService.lightTheme
      : _themeService.darkTheme;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_themeService];
}
