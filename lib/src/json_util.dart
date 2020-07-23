import 'dart:convert';

/**
 * @Author: Sky24n
 * @GitHub: https://github.com/Sky24n
 * @Description: Date Util.
 * @Date: 2020/01/06
 */

/// Json Util.
class JsonUtil {
  /// Converts object [value] to a JSON string.
  static String encodeObj(Object value) {
    return value == null ? null : json.encode(value);
  }

  /// Converts JSON string [source] to object.
  static T getObj<T>(String source, T f(Map v)) {
    if (source == null || source.isEmpty) return null;
    try {
      Map map = json.decode(source);
      return map == null ? null : f(map);
    } catch (e) {
      print('JsonUtil convert error, Exception：${e.toString()}');
    }
    return null;
  }

  /// Converts JSON string or JSON map [source] to object.
  static T getObject<T>(Object source, T f(Map v)) {
    if (source == null || source.toString().isEmpty) return null;
    try {
      Map map;
      if (source is String) {
        map = json.decode(source);
      } else {
        map = source;
      }
      return map == null ? null : f(map);
    } catch (e) {
      print('JsonUtil convert error, Exception：${e.toString()}');
    }
    return null;
  }

  /// Converts JSON string list [source] to object list.
  static List<T> getObjList<T>(String source, T f(Map v)) {
    if (source == null || source.isEmpty) return null;
    try {
      List list = json.decode(source);
      return list?.map((value) {
        return f(value);
      })?.toList();
    } catch (e) {
      print('JsonUtil convert error, Exception：${e.toString()}');
    }
    return null;
  }

  /// Converts JSON string or JSON map list [source] to object list.
  static List<T> getObjectList<T>(Object source, T f(Map v)) {
    if (source == null || source.toString().isEmpty) return null;
    try {
      List list;
      if (source is String) {
        list = json.decode(source);
      } else {
        list = source;
      }
      return list?.map((value) {
        return f(value);
      })?.toList();
    } catch (e) {
      print('JsonUtil convert error, Exception：${e.toString()}');
    }
    return null;
  }
}
