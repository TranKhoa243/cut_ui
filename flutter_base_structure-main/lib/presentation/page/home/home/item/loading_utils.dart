// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:driver_app/common/app/global_state/app_controller.dart';

class LoadingUtils {
  static bool isLoading = false;

  static Future<void> loading({required Function callBack}) async {
    openLoadingDialog();
    await callBack.call();
    dismissLoading();
  }

  static void showFullScreenOverlay() {
    BuildContext? context = Get.context;
    if (context == null) return;
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          //  backgroundColor: Colors.black.withOpacity(0.5),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  static openLoadingDialog() {
    BuildContext? context = Get.context;
    if (context == null) return;
    if (isLoading) {
      return;
    } else {
      isLoading = true;
    }
    return Get.dialog(
        barrierDismissible: false,
        // barrierColor: themeData.appColor.primary.withOpacity(0.1),
        WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: SpinKitFadingCircle(
              color: themeData.appColor.primary,
              size: 50.w,
            ),
          ),
        ));
  }

  static loadingData(
      {Color? colorBackground, Color? colorIconRotate, double? size}) {
    return Container(
      color: colorBackground ?? Colors.white,
      child: Center(
        child: SpinKitFadingCircle(
          color: colorIconRotate ?? themeData.appColor.primary,
          size: size ?? 50.w,
        ),
      ),
    );
  }

  static dismissLoading() {
    if (isLoading) {
      isLoading = false;
    } else {
      return;
    }
    Get.back();
  }
}
