import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_theme_switcher/ui/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Theme Switcher'),
        ),
        body: SafeArea(
          child: Center(
            child: RaisedButton(
              child: Text('Toggle'),
              onPressed: () => model.toggleTheme(),
            ),
          ),
        ),
      ),
    );
  }
}
