import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../services/theme_service.dart';

class HomeViewModel extends ReactiveViewModel {
  final _themeService = locator<ThemeService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_themeService];

  toggleTheme() {
    _themeService.toggleTheme();
    notifyListeners();
  }
}
