import 'package:get/get.dart';
import 'package:ebook_name/presentation/splash/binding/splash_binding.dart';
import 'package:ebook_name/presentation/splash/view/splash_screen.dart';

class AppPage {
  static const String SPLASH = '/splash';
  static const String SIGN_IN = '/sign_in';

  static final List<GetPage> pages = [
    GetPage(
      name: SIGN_IN,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
