import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

/**
 * @Author: Sky24n
 * @GitHub: https://github.com/Sky24n
 * @Description: EnDecode Util.
 * @Date: 2019/7/02
 */

/// EnDecode Util.
class EnDecodeUtil {
  /// md5 加密
  static String encodeMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  /// Base64加密
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /// Base64解密
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }
}
