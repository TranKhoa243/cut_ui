import 'dart:async';

const userNameRegex = ".+"; //r"^[a-zA-Z0-9_\\-\\.]+$";
const passwordRegex =
    r'^[a-zA-Z0-9\u0027\|\{\}@#$%^&+=*.,\-_!`\[\]";:<>?/\\]+$';
const onlyNumbersRegex = r'[^\d]';
const emailRegex =
    r'[a-zA-Z0-9\+\.\_\%\-]{1,256}\@[a-zA-Z0-9][a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25}){1,2}';
const passwordRegister = r'^[a-zA-Z0-9@#$%^&+=*.\-_]{6,}$';
const phoneNumberRegex = r'^\+?[1-9]{3}-?[0-9]{6,12}$';

typedef ValidatorFunction = bool Function(String, String?);

const int MIN_LENGTH_PASSWORD = 6;
const int MAX_LENGTH_PASSWORD = 6;
const int MAX_LENGTH_NAME = 256;
const int MAX_LENGTH_KANA_NAME = 50;
const int MAX_LENGTH_OCCUPATION = 50;
const int VALID_LENGTH_ZIPCODE = 7;
const int MAX_LENGTH_ADDRESS = 100;
const int MAX_LENGTH_PHONE = 11;
const int MAX_LENGTH_EMAIL = 256;
const int MAX_LENGTH_SALON_NAME = 256;
const int MAX_LENGTH_ID_CARD = 12;

class Validators {

  final validatePasswordTransformer =
      StreamTransformer<String, bool>.fromHandlers(
          handleData: (password, sink) {
    RegExp regex = RegExp(passwordRegex);
    sink.add(regex.hasMatch(password));
  });

  final validateOrgId =
  StreamTransformer<String, bool>.fromHandlers(
      handleData: (id, sink) {
        sink.add(isOrganizationIdValid(id));
      });

  final validateBillIdTransformer =
      StreamTransformer<String, bool>.fromHandlers(handleData: (billId, sink) {
    sink.add(billId.isNotEmpty);
  });

  final validateEmailTransformer =
      StreamTransformer<String, bool>.fromHandlers(handleData: (email, sink) {
    sink.add(email.isNotEmpty ? isEmailValid(email) : true);
  });

  final validateNotEmptyTransformer =
      StreamTransformer<String, bool>.fromHandlers(handleData: (text, sink) {
    sink.add(text.isNotEmpty);
  });

  final validateOTPCodeTransformer =
      StreamTransformer<String, bool>.fromHandlers(handleData: (otp, sink) {
    sink.add(otp.length == 6);
  });

  static bool isPasswordValid(String inputPassword, String? text) {
    RegExp regex = RegExp(passwordRegister);
    return regex.hasMatch(inputPassword);
  }

  static bool isOrganizationIdValid(String id) {
    return id.isNotEmpty;
  }

  static bool isEmailValid(String email) {
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }

  static bool isTheSameText(String password, String? passwordConfirm) {
    return password == passwordConfirm;
  }

  static bool isFullNameValid(String inputFullName, String? text) {
    return inputFullName.isNotEmpty;
  }

  final validateTotalBillMoneyTransformer =
  StreamTransformer<String, bool>.fromHandlers(handleData: (totalBillMoney, sink) {
    RegExp numeric = RegExp(r'^-?[0-9]+$');
    sink.add(totalBillMoney.isNotEmpty&&numeric.hasMatch(totalBillMoney));
  });
}
