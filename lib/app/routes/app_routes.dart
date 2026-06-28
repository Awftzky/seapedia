part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const ROLE_SELECTION = _Paths.ROLE_SELECTION;
  static const PUBLIC_CATALOG = _Paths.PUBLIC_CATALOG;
  static const PRODUCT_DETAIL = _Paths.PRODUCT_DETAIL;
  static const BUYER_DASHBOARD = _Paths.BUYER_DASHBOARD;
  static const SELLER_DASHBOARD = _Paths.SELLER_DASHBOARD;
  static const DRIVER_DASHBOARD = _Paths.DRIVER_DASHBOARD;
  static const ADMIN_DASHBOARD = _Paths.ADMIN_DASHBOARD;
  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const ROLE_SELECTION = '/role-selection';
  static const PUBLIC_CATALOG = '/public-catalog';
  static const PRODUCT_DETAIL = '/product-detail';
  static const BUYER_DASHBOARD = '/buyer-dashboard';
  static const SELLER_DASHBOARD = '/seller-dashboard';
  static const DRIVER_DASHBOARD = '/driver-dashboard';
  static const ADMIN_DASHBOARD = '/admin-dashboard';
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
}