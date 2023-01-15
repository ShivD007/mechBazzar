import 'package:mechBazzar/modules/brand/bindings/brand_binding.dart';
import 'package:mechBazzar/modules/brand/views/brand_view.dart';
import 'package:mechBazzar/modules/cart/bindings/cart_binding.dart';
import 'package:mechBazzar/modules/cart/views/cart_view.dart';
import 'package:mechBazzar/modules/category/bindings/category_binding.dart';
import 'package:mechBazzar/modules/category/views/category_view.dart';
import 'package:mechBazzar/modules/profile/bindings/forget_password_bindings.dart';
import 'package:mechBazzar/modules/profile/bindings/profile_bindings.dart';
import 'package:mechBazzar/modules/profile/bindings/signup_binding.dart';
import 'package:mechBazzar/modules/profile/controllers/login_controller.dart';
import 'package:mechBazzar/modules/profile/views/forget_password_view.dart';
import 'package:mechBazzar/modules/profile/views/profile_view.dart';
import 'package:mechBazzar/modules/profile/views/signup_view.dart';
import 'package:mechBazzar/modules/splash/bindings/splash_binding.dart';
import 'package:mechBazzar/modules/splash/views/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/profile/bindings/login_bindings.dart';
import '../modules/profile/views/login_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.splash,
      binding: SplashBinding(),
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.login,
      binding: LoginBinding(),
      page: () => LoginView(),
    ),
    GetPage(
      name: Routes.forgetPassword,
      binding: ForgetPasswordBinding(),
      page: () => ForgetPasswordView(),
    ),
    GetPage(
      name: Routes.signup,
      binding: SignUpBinding(),
      page: () => SignUpView(),
    ),
    GetPage(
      name: Routes.profile,
      binding: ProfileBindings(),
      page: () => ProfileView(),
    ),
    GetPage(
      name: Routes.productDetail,
      binding: ProductDetailBinding(),
      page: () => ProductDetailView(),
    ),
    GetPage(
      name: Routes.category,
      binding: CategoryBinding(),
      page: () => CategoryView(),
    ),
    GetPage(
      name: Routes.brand,
      binding: BrandBinding(),
      page: () => BrandView(),
    ),
    GetPage(
      name: Routes.cart,
      binding: CartBinding(),
      page: () => CartView(),
    ),
  ];
}
