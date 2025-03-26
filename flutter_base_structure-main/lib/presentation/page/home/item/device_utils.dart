import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/page/home/item/device_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_udid/flutter_udid.dart';

MediaQueryData ?_mediaQueryData;
class DeviceUtils {
  const DeviceUtils._();

  static DeviceType deviceType = _getDeviceType();

  static Future<String> getDeviceId() async {
    if (Platform.isIOS) {
      return await FlutterUdid.udid; // unique ID on iOS
    } else {
      const androidIdPlugin = AndroidId();

      final androidID = await androidIdPlugin.getId();

      return androidID ?? ''; // unique ID on Android
    }
  }

  static Future<String> getDeviceModelName() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      return iosInfo.name;
    } else {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      return '${androidInfo.brand} ${androidInfo.device}';
    }
  }

  static DeviceType _getDeviceType() {
    return MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .shortestSide <
        DeviceConstants.maxMobileWidthForDeviceType
        ? DeviceType.mobile
        : DeviceType.tablet;
  }
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }

  static double get safeHeight => size.height - padding.bottom - padding.top;

  static EdgeInsets get padding => _mediaQueryData!.padding;

  static EdgeInsets get viewInsets => _mediaQueryData!.viewInsets;

  static Size get size => _mediaQueryData!.size;
}
