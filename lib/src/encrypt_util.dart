import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

/**
 * @Author: Sky24n
 * @GitHub: https://github.com/Sky24n
 * @Description: Encrypt Util.
 * @Date: 2019/07/02
 */

/// Encrypt Util.
class EncryptUtil {
  /// md5 加密
  static String encodeMd5(String data) {
    var content = Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  /// 异或对称加密
  static String xorCode(String res, String key) {
    List<String> keyList = key.split(',');
    List<int> codeUnits = res.codeUnits;
    List<int> codes = [];
    for (int i = 0, length = codeUnits.length; i < length; i++) {
      int code = codeUnits[i] ^ int.parse(keyList[i % keyList.length]);
      codes.add(code);
    }
    return String.fromCharCodes(codes);
  }

  /// 异或对称 Base64 加密
  static String xorBase64Encode(String res, String key) {
    String encode = xorCode(res, key);
    encode = encodeBase64(encode);
    return encode;
  }

  /// 异或对称 Base64 解密
  static String xorBase64Decode(String res, String key) {
    String encode = decodeBase64(res);
    encode = xorCode(encode, key);
    return encode;
  }

  /// Base64加密
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /// Base64解密
  static String decodeBase64(String data) {
    List<int> bytes = base64Decode(data);
    String result = utf8.decode(bytes);
    return result;
  }
}
