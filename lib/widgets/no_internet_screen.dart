import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ebook_name/core/app/app.dart';
import 'package:ebook_name/core/helper/network/network_checker.dart';
import 'package:ebook_name/generated/assets.gen.dart';
import 'package:ebook_name/generated/locales.g.dart';
import 'package:sli_common/sli_common.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({Key? key, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.imgDisconnect.svg(),
              SizedBox(
                height: 16.0.h,
              ),
              Obx(
                () => Text(
                  Get.find<NetworkChecker>().isConnected.value == false
                      ? LocaleKeys.noInternetShort.tr
                      : LocaleKeys.reconnectInternet.tr,
                  style: App.appStyle?.bold18?.copyWith(
                    color: App.appColor?.borderColor,
                  ),
                ),
              ),
              SizedBox(
                height: 32.0.h,
              ),
              Obx(
                () => InkWellButton(
                  title: LocaleKeys.retry.tr,
                  width: 180.w,
                  onTap: Get.find<NetworkChecker>().isConnected.value == false
                      ? null
                      : () {
                          if (Get.find<NetworkChecker>().isConnected.value) {
                            onRetry();
                          }
                        },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
