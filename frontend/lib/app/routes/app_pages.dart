import 'package:get/get.dart';

// Auth modules
import 'package:seapedia/app/modules/auth/login/bindings/login_binding.dart';
import 'package:seapedia/app/modules/auth/login/views/login_view.dart';
import 'package:seapedia/app/modules/auth/register/bindings/register_binding.dart';
import 'package:seapedia/app/modules/auth/register/views/register_view.dart';
import 'package:seapedia/app/modules/auth/role_selection/bindings/role_selection_binding.dart';
import 'package:seapedia/app/modules/auth/role_selection/views/role_selection_view.dart';

// Catalog modules
import 'package:seapedia/app/modules/catalog/public_catalog/bindings/public_catalog_binding.dart';
import 'package:seapedia/app/modules/catalog/public_catalog/views/public_catalog_view.dart';

// Dashboard modules
import 'package:seapedia/app/modules/dashboard/admin_dashboard/bindings/admin_dashboard_binding.dart';
import 'package:seapedia/app/modules/dashboard/admin_dashboard/views/admin_dashboard_view.dart';
import 'package:seapedia/app/modules/dashboard/buyer_dashboard/bindings/buyer_dashboard_binding.dart';
import 'package:seapedia/app/modules/dashboard/buyer_dashboard/views/buyer_dashboard_view.dart';
import 'package:seapedia/app/modules/dashboard/buyer_dashboard/views/cart_view.dart';
import 'package:seapedia/app/modules/dashboard/driver_dashboard/bindings/driver_dashboard_binding.dart';
import 'package:seapedia/app/modules/dashboard/driver_dashboard/views/driver_dashboard_view.dart';
import 'package:seapedia/app/modules/dashboard/seller_dashboard/bindings/seller_dashboard_binding.dart';
import 'package:seapedia/app/modules/dashboard/seller_dashboard/views/seller_dashboard_view.dart';

// Product modules
import 'package:seapedia/app/modules/product/product_detail/bindings/product_detail_binding.dart';
import 'package:seapedia/app/modules/product/product_detail/views/product_detail_view.dart';

// Other modules
import 'package:seapedia/app/modules/splash/bindings/splash_binding.dart';
import 'package:seapedia/app/modules/splash/views/splash_view.dart';
import 'package:seapedia/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:seapedia/app/modules/onboarding/views/onboarding_view.dart';
import 'package:seapedia/app/routes/auth_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH; // Usually splash is the initial route

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.ROLE_SELECTION,
      page: () => const RoleSelectionView(),
      binding: RoleSelectionBinding(),
    ),
    GetPage(
      name: Routes.PUBLIC_CATALOG,
      page: () => const PublicCatalogView(),
      binding: PublicCatalogBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD_BUYER,
      page: () => const BuyerDashboardView(),
      binding: BuyerDashboardBinding(),
      middlewares: [AuthMiddleware()], // 👈 tambahin ini
    ),
    GetPage(
      name: Routes.BUYER_CART,
      page: () => const CartView(),
      binding: BuyerDashboardBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD_SELLER,
      page: () => const SellerDashboardView(),
      binding: SellerDashboardBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD_DRIVER,
      page: () => const DriverDashboardView(),
      binding: DriverDashboardBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD_ADMIN,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
