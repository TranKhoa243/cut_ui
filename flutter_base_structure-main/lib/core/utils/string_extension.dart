import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_structure/data/remote/api/index.dart';
import 'package:intl/intl.dart';

extension StringToBool on String {
  bool toBoolValue() {
    if (isNotEmpty) {
      return toLowerCase() == 'true' || toLowerCase() == '1';
    }
    return false;
  }

  double? toDoubleValue() {
    if (isNotEmpty) {
      return double.tryParse(this);
    }
    return null;
  }

  int? toIntValue() {
    if (isNotEmpty) {
      return int.tryParse(this);
    }
    return null;
  }
}

extension DateTimeToString on DateTime {
  String formatToDayMonthYearString() {
    final _stringToDateTime = DateFormat('dd/MM/yyyy');
    return _stringToDateTime.format(this).toString();
  }

  String formatToDateTimeVn({String? format = 'EEEE, dd MMMM yyyy'}) {
    return DateFormat(format, 'vi_VN').format(this);
  }

  String formatToDateTime({String? format = 'HH:mm dd-MM-yyyy'}) {
    return DateFormat(format).format(this);
  }
}

extension StringToDateTime on String {
  DateTime convertToDateTime() {
    final _stringToDateTime = DateFormat('yyyy-MM-dd HH:mm');
    return _stringToDateTime.parse(this);
  }

  DateTime convertToDateTimeddMMYY() {
    final _stringToDateTime = DateFormat('dd/MM/yyyy');
    return _stringToDateTime.parse(this);
  }

  DateTime convertToYearMonthDay() {
    try {
      final _stringToDateTime = DateFormat('yyyy-MM-dd');
      return _stringToDateTime.parse(this);
    } catch (e) {}

    return DateTime.now();
  }

  String formatToYearMonthDayString() {
    final _stringToDateTime = DateFormat('yyyy/MM/dd');
    return _stringToDateTime.format(DateTime.parse(this)).toString();
  }

  String formatToTimeString() {
    final _stringToTime = DateFormat('HH:mm');
    return _stringToTime.format(DateTime.parse(this)).toString();
  }

  DateTime convertToTime() {
    final _stringToTime = DateFormat('HH:mm');
    return _stringToTime.parse(this);
  }
}

Image imageFromBase64String(String base64String, {double? width, double? height}) {
  return Image.memory(base64Decode(base64String), fit: BoxFit.cover,  width: width,
    height: height,);
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

extension LongToDateString on int {
  String formatLongToDateTimeString() {
    var dt = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat('dd/MM/yyyy HH:mm').format(dt); // 31/12/2000, 22:00
  }
}

String getFileExtension(String fileName) {
  return fileName.split('.').last;
}

String cutLastTwoCharacters(String inputString) {
  if (inputString.length >= 2) {
    return inputString.substring(inputString.length - 2, inputString.length);
  } else {
    return inputString;
  }
}
