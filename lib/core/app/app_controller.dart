import 'package:flutter/material.dart';
import 'package:ebook_name/di/injection.dart';
import 'package:ebook_name/domain/use_case/auth_use_case.dart';
import 'package:ebook_name/generated/locales.g.dart';
import 'package:sli_common/sli_common.dart';
import 'package:get/get.dart';

class AppController {
  Future<void> showSessionEnd() async {
    if (!DialogUtil.isShowingDialog &&
        Injector.getxFind<AuthUseCase>().isLogin) {
      BuildContext? context = Get.context;
      DialogUtil.alert(
        context!,
        content: LocaleKeys.sessionExpired,
        submit: LocaleKeys.logOut,
        onSubmit: () async {
          await Injector.getxFind<AuthUseCase>().logout();
        },
      );
    }
  }
}
