import 'package:ebook_name/core/app/app.dart';
import 'package:ebook_name/generated/fonts.gen.dart';
import 'package:ebook_name/generated/locales.g.dart';
import 'package:ebook_name/widgets/check_box_widget.dart';
import 'package:sli_common/sli_common.dart';
import 'package:ebook_name/presentation/sign_in/controller/sign_in_controller.dart';
import 'package:ebook_name/widgets/ebook_button.dart';
import 'package:ebook_name/widgets/loading_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController _controller = Get.find<SignInController>();

  Widget _buildInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => CommonTextField(
            title: LocaleKeys.userName.tr,
            controller: _controller.emailController,
            hint: LocaleKeys.userNameInstruction.tr,
            keyboardType: TextInputType.emailAddress,
            error: _controller.errEmail.value,
            suffixConstraints: BoxConstraints(
              minHeight: 48.h,
              maxWidth: 335.w,
            ),
            hintStyle: App.appStyle!.medium15?.copyWith(
              fontFamily: FontFamily.proximaNova,
              fontWeight: FontWeight.w400,
              color: App.appColor?.grayScale300,
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Obx(
          () => CommonTextField(
            title: LocaleKeys.password.tr,
            controller: _controller.passController,
            keyboardType: TextInputType.visiblePassword,
            hint: LocaleKeys.password.tr,
            error: _controller.errPass.value,
            obscureText: (!_controller.showPass.value ?? false),
            suffixConstraints: BoxConstraints(
              minHeight: 36.h,
            ),
            suffix: GestureDetector(
              onTap: () => _controller.onTapShowPass(),
              child: Padding(
                padding: EdgeInsets.only(right: 11.0.w),
                child: Icon(
                  _controller.showPass.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xFF130F26),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return LoadingArea(
      isLoading: _controller.isLoading,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 54.h,
                    width: 428.w,
                  ),
                  SizedBox(
                    height: 54.h,
                  ),
                  Text(
                    LocaleKeys.welcome.tr,
                    textAlign: TextAlign.center,
                    style: App.appStyle?.medium16?.copyWith(
                      color: App.appColor?.purple500,
                      fontSize: 32.sp,
                      fontFamily: FontFamily.philosopher,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  _buildInput(),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  EBookButton(
                    title: LocaleKeys.signIn.tr,
                    height: 46.h,
                    width: 335.w,
                    onTap: () => _controller.onTapSignInEmail,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.forgotPassword.tr,
                      style: App.appStyle?.medium16?.copyWith(
                        color: App.appColor?.purple300,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        fontFamily: FontFamily.philosopher,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
