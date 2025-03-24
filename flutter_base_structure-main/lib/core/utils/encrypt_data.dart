import 'package:encrypt/encrypt.dart';

class EncryptData {
  static Encrypted? encrypted;
  static var decrypted;
  static const cryptKey = 'encrypto_key_000';

  static encryptAES(plainText) {
    final key = Key.fromUtf8(cryptKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(plainText, iv: iv);
    print('=====================encryptAES' + encrypted!.base64);
  }

  static decryptAES({required Encrypted encrpt}) {
    final key = Key.fromUtf8(cryptKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(encrpt, iv: iv);
  }
}
