part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTRATION = _Paths.REGISTRATION;
  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.PROFILE;
  static const PORFOLIO = _Paths.PORFOLIO;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const REGISTRATION = '/registration';
  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const PORFOLIO = '/porfolio';
}
