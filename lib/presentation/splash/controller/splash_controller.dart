import 'package:get/get.dart';
import 'package:ebook_name/domain/use_case/auth_use_case.dart';

class SplashController extends GetxController {
  final AuthUseCase _authUseCase = Get.find<AuthUseCase>();
  bool isLogin = false;

  @override
  void onInit() {
    super.onInit();
    directApp();
  }

  void directApp() {
    isLogin = _authUseCase.isLogin;
    Future.delayed(
      const Duration(milliseconds: 1400),
      () {
        if (!isLogin) {
          // TODO: Go to Sign in page
        } else {
          // TODO: Go to Home page
        }
      },
    );
  }
}
