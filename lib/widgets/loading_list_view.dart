import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ebook_name/generated/locales.g.dart';

class LoadingListView extends StatelessWidget {
  final LoadingListModel loadingModel;
  final RefreshController refreshController;
  final Widget? emptyWidget;
  final Widget Function(BuildContext, int) builder;
  final VoidCallback? refreshData;
  final VoidCallback? loadMore;
  final bool dismissible;
  final double opacity;
  final Color color;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final int extendItem;

  const LoadingListView({
    Key? key,
    required this.loadingModel,
    required this.refreshController,
    this.emptyWidget,
    required this.builder,
    this.refreshData,
    this.loadMore,
    this.opacity = 0.3,
    this.color = Colors.black,
    this.dismissible = false,
    this.padding,
    this.separatorBuilder,
    this.extendItem = 0,
  }) : super(key: key);

  Widget _buildListResult() {
    return Obx(
      () => ((loadingModel.data.length + extendItem) == 0 &&
              !loadingModel.isLoading.value)
          ? emptyWidget ?? const SizedBox()
          : SmartRefresher(
              controller: refreshController,
              onRefresh: refreshData,
              enablePullUp: loadMore != null,
              onLoading: loadMore,
              header: Platform.isIOS
                  ? ClassicHeader(
                      canTwoLevelText: LocaleKeys.canTwoLevelText.tr,
                      releaseText: LocaleKeys.canRefreshText.tr,
                      idleText: LocaleKeys.idleRefreshText.tr,
                      completeText: LocaleKeys.refreshCompleted.tr,
                      refreshingText: LocaleKeys.refreshingText.tr,
                      failedText: LocaleKeys.refreshFailedText.tr,
                    )
                  : const MaterialClassicHeader(),
              footer: ClassicFooter(
                canLoadingText: LocaleKeys.releaseToLoadMore.tr,
                failedText: LocaleKeys.loadFail.tr,
                loadingText: LocaleKeys.loading.tr,
                noDataText: LocaleKeys.noMoreData.tr,
                idleText: LocaleKeys.pullUpLoadMore.tr,
              ),
              child: ListView.separated(
                itemCount: loadingModel.data.length + extendItem,
                itemBuilder: builder,
                padding: padding,
                separatorBuilder:
                    separatorBuilder ?? (context, index) => const SizedBox(),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildListResult(),
        Obx(() => loadingModel.isLoading.value
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: opacity,
                    child: ModalBarrier(dismissible: dismissible, color: color),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const CupertinoActivityIndicator(
                      radius: 14,
                    ),
                  ),
                ],
              )
            : const SizedBox())
      ],
    );
  }
}

class LoadingListModel<T> {
  RxBool isLoading = false.obs;
  RxList<T> data = <T>[].obs;

  LoadingListModel();

  void addData(T? newData) {
    if (newData != null) {
      data.add(newData);
    }
  }

  void addAllData(List<T>? listNewData) {
    if (listNewData != null) {
      data.addAll(listNewData);
    }
  }

  void startLoading() {
    isLoading.value = true;
  }

  void completeLoading() {
    isLoading.value = false;
  }

  void clear() {
    data.clear();
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    return data.firstWhereOrNull(test);
  }

  T firstWhere(bool Function(T element) test, {T Function()? orElse}) {
    return data.firstWhere(test, orElse: orElse);
  }
}
