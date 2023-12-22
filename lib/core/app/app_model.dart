class AppModel {
  void showSessionEnd() {
    // if (!(Get.isDialogOpen == true) && dataService.getIdToken().isNotEmpty) {
    //   Get.dialog(ConfirmDialog(
    //       force: true,
    //       title: '',
    //       description: LocaleKeys.sessionExpired.tr,
    //       onConfirm: () async {
    //         await _deleteToken();
    //         await Get.find<AppModel>().dataService.clearAll();
    //         Get.offAllNamed(SLIPage.LOGIN);
    //       },
    //       onCancel: () {}));
    // }
  }

  void showNoInternet() {
    // Get.dialog(ConfirmDialog(
    //     force: true,
    //     title: 'Opp!',
    //     description: LocaleKeys.noInternet.tr,
    //     onConfirm: () {},
    //     onCancel: () {}));
  }
}
