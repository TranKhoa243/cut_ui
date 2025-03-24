import 'package:flutter_base_structure/core/utils/consts.dart';
import 'package:flutter_base_structure/core/utils/validations.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

List<TextInputFormatter> nameFormatter = [
  LengthLimitingTextInputFormatter(MAX_LENGTH_NAME),
];

List<TextInputFormatter> nameKanaFormatter = [
  LengthLimitingTextInputFormatter(MAX_LENGTH_KANA_NAME),
];

List<TextInputFormatter> occupationFormatter = [
  LengthLimitingTextInputFormatter(MAX_LENGTH_OCCUPATION),
];

List<TextInputFormatter> phoneNumberFormatter = [
  LengthLimitingTextInputFormatter(MAX_LENGTH_PHONE),
  FilteringTextInputFormatter.allow(
      RegExp(phoneNumberRegex)), // only allow number
];

List<TextInputFormatter> onlyNumberFormatter = [
  FilteringTextInputFormatter.allow(
      RegExp(phoneNumberRegex)), // only allow number
];

List<TextInputFormatter> passwordFormatter = [
  FilteringTextInputFormatter.deny(RegExp(r"[ ]")),
  LengthLimitingTextInputFormatter(MAX_LENGTH_PASSWORD),
  FilteringTextInputFormatter.allow(RegExp(phoneNumberRegex))
];

List<TextInputFormatter> emailFormatter = [
  FilteringTextInputFormatter.deny(RegExp(r"[ ]")),
  LengthLimitingTextInputFormatter(MAX_LENGTH_EMAIL),
];

List<TextInputFormatter> commonInputFormatter = [
  LengthLimitingTextInputFormatter(MAX_LENGTH_NAME),
];

List<TextInputFormatter> commonIdCard = [
  LengthLimitingTextInputFormatter(MAX_LENGTH_ID_CARD),
  FilteringTextInputFormatter.allow(RegExp(phoneNumberRegex)),
];

String formatMoney(int s) {
  return NumberFormat.decimalPattern('vi_VN').format(s);
}

DateTime stringToDate(String s) {
  try {
    DateTime parseDate =
        DateFormat(DATE_TIME_FORMAT_FROM_SERVER).parse(s, true);
    return parseDate;
  } catch (e) {
    print('aaaaaaaa: ${e.toString()}');
  }
  return DateTime.now();
}

DateTime stringSimpleFormatToDate(String s) {
  DateTime parseDate = DateFormat(DATE_TIME_SIMPLE_FORMAT).parse(s, true);
  return parseDate;
}

DateTime stringVnToDate(String s) {
  DateTime p = DateFormat(DATE_TIME_FORMAT).parse(s, true);
  return p;
}
