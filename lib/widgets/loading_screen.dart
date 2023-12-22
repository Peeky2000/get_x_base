import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  static Widget? defaultLoadingWidget;

  final RxBool isLoading;
  final Widget child;
  final bool dismissible;
  final double opacity;
  final Color color;
  final Widget? loadingWidget;

  const LoadingScreen({
    Key? key,
    required this.isLoading,
    required this.child,
    this.opacity = 0.3,
    this.color = Colors.black,
    this.dismissible = false,
    this.loadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Obx(() => isLoading.value
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: opacity,
                    child: ModalBarrier(dismissible: dismissible, color: color),
                  ),
                  loadingWidget ??
                      defaultLoadingWidget ??
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
