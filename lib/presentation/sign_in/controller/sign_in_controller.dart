import 'package:ebook_name/core/base_component/base_controller.dart';
import 'package:ebook_name/core/common/constant.dart';
import 'package:ebook_name/core/common/route.dart';
import 'package:ebook_name/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends BaseController {
  RxBool showPass = false.obs;
  RxBool? isRemember = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  RxnString errEmail = RxnString(null);
  RxnString errPass = RxnString(null);

  void onTapShowPass() {
    showPass.value = !showPass.value;
  }

  Future<void> onTapSignInEmail() async {
    bool isValid = true;
    String? email = emailController.text.trim();
    String? password = passController.text.trim();
    errEmail.value = null;
    errPass.value = null;
    if (email.isEmpty) {
      errEmail.value = LocaleKeys.emailRequired.tr;
      isValid = false;
    }
    if (password.isEmpty) {
      errPass.value = LocaleKeys.passRequired.tr;
    }
    // else if (!Constant.passwordRegexp.hasMatch(password)) {
    //   errPass.value = LocaleKeys.passwordInvalid.tr;
    //   isValid = false;
    // }

    if (isValid) {
      try {
        isLoading.value = true;
        //await useCases.authUseCase
            //.signInEmail(email: email, password: password , isRemember : isRemember);
        isLoading.value = false;
        Get.offAllNamed(AppPage.MAIN);
      } catch (ex) {
        handleErrorResponse(ex, onRetry: () => onTapSignInEmail());
      }
    }
  }
}
