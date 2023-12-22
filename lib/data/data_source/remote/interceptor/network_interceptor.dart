import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ebook_name/core/helper/network/network_checker.dart';
import 'package:ebook_name/widgets/no_internet_screen.dart';

class NetworkInterceptor extends QueuedInterceptor {
  final NetworkChecker _networkChecker = Get.find<NetworkChecker>();

  NetworkInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_networkChecker.isConnected.value) {
      super.onRequest(options, handler);
    } else {
      Get.to(NoInternetScreen(onRetry: () {
        Get.back();
        super.onRequest(options, handler);
      }));
    }
  }
}
