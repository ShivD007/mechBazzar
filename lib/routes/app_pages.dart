import 'package:admin_jandhara/modules/splash/bindings/splash_binding.dart';
import 'package:admin_jandhara/modules/splash/views/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      binding: HomeBinding(),
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      binding: SplashBinding(),
      page: () => const SplashView(),
    ),
  ];
}
