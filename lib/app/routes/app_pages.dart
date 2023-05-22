import 'package:get/get.dart';

import '../modules/chatPage/bindings/chat_page_binding.dart';
import '../modules/chatPage/views/chat_page_view.dart';
import '../modules/chatPage/views/chatWidget/bindings/chat_widget_binding.dart';
import '../modules/chatPage/views/chatWidget/views/chat_widget_view.dart';
import '../modules/interestPage/bindings/interest_page_binding.dart';
import '../modules/interestPage/views/interest_page_view.dart';
import '../modules/loginPage/bindings/login_page_binding.dart';
import '../modules/loginPage/views/login_page_view.dart';
import '../modules/rootPage/bindings/root_page_binding.dart';
import '../modules/rootPage/views/root_page_view.dart';
import '../modules/rootPage/views/widgets/productPage/bindings/product_page_binding.dart';
import '../modules/rootPage/views/widgets/productPage/views/product_page_view.dart';
import '../modules/rootPage/views/widgets/profilePage/bindings/profile_page_binding.dart';
import '../modules/rootPage/views/widgets/profilePage/views/profile_page_view.dart';
import '../modules/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.INTEREST_PAGE,
      page: () => const InterestPageView(),
      binding: InterestPageBinding(),
    ),
    GetPage(
      name: _Paths.ROOT_PAGE,
      page: () => const RootPageView(),
      binding: RootPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE,
      page: () => const ProductPageView(),
      binding: ProductPageBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_PAGE,
      page: () => const ChatPageView(),
      binding: ChatPageBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_WIDGET,
      page: () => const ChatWidgetView(),
      binding: ChatWidgetBinding(),
    ),
  ];
}
