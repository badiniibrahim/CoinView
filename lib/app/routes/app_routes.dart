part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static Future<String> get INITIAL async {
    return Routes.HOME;
  }

  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  _Paths._();
  static const HOME = "/home";
}
