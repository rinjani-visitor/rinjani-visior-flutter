import 'dart:convert';

import 'package:crypto/crypto.dart';

class Crypto {
  static String encrypt(String data) {
    return data;
  }

  static String decrypt(String data) {
    return data;
  }

  static String toMd5(String data) {
    final raw = utf8.encode(data);
    final result = md5.convert(raw);
    return result.toString();
  }
}
