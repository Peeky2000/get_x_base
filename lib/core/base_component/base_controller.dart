import 'package:get/get.dart';
import 'package:ebook_name/core/error/error_to_string_mapper.dart';
import 'package:ebook_name/generated/locales.g.dart';
import 'package:sli_common/sli_common.dart';

class BaseController extends GetxController {
  RxBool isLoading = false.obs;
  bool isHasNexData = false;
  int page = 1;

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }

  Future<void> refreshData() async {}

  Future<void> getNextData() async {}

  void handleErrorResponse(dynamic error, {Function()? onRetry}) {
    isLoading.value = false;
    if (!DialogUtil.isShowingDialog) {
      DialogUtil.error(Get.context!,
          content: ErrorMapper.parse(error),
          closeText: LocaleKeys.close.tr,
          retryText: LocaleKeys.retry.tr,
          isShowRetry: onRetry != null, onTapRetry: () async {
        if (onRetry != null) {
          if (!isLoading.value) {
            isLoading.value = true;
          }
          await onRetry();
          isLoading.value = false;
        }
      });
    }
  }
}
