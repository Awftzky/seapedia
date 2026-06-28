part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  // Core
  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;

  // Auth
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const ROLE_SELECTION = _Paths.ROLE_SELECTION;

  // Catalog
  static const PUBLIC_CATALOG = _Paths.PUBLIC_CATALOG;

  // Dashboards
  static const DASHBOARD_ADMIN = _Paths.DASHBOARD_ADMIN;
  static const DASHBOARD_BUYER = _Paths.DASHBOARD_BUYER;
  static const DASHBOARD_DRIVER = _Paths.DASHBOARD_DRIVER;
  static const DASHBOARD_SELLER = _Paths.DASHBOARD_SELLER;
  static const DASHBOARD_SELLER_STORE_SETUP = _Paths.DASHBOARD_SELLER_STORE_SETUP;
  static const BUYER_CART = _Paths.BUYER_CART;

  // Product
  static const PRODUCT_DETAIL = _Paths.PRODUCT_DETAIL;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';

  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const ROLE_SELECTION = '/role-selection';

  static const PUBLIC_CATALOG = '/public-catalog';

  static const DASHBOARD_ADMIN = '/dashboard/admin';
  static const DASHBOARD_BUYER = '/dashboard/buyer';
  static const DASHBOARD_DRIVER = '/dashboard/driver';
  static const DASHBOARD_SELLER = '/dashboard/seller';
  static const DASHBOARD_SELLER_STORE_SETUP = '/dashboard/seller/store-setup';
  static const BUYER_CART = '/buyer/cart';

  static const PRODUCT_DETAIL = '/product/detail';
}
