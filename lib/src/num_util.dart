import 'package:decimal/decimal.dart';

/**
 * @Author: thl
 * @GitHub: https://github.com/Sky24n
 * @Description: Num Util.
 * @Date: 2018/9/18
 */
class NumUtil {
  /**
   *  * The parameter [fractionDigits] must be an integer satisfying:
   * `0 <= fractionDigits <= 20`.
   */
  static num getNumByValueStr(String valueStr, {int fractionDigits}) {
    double value = double.tryParse(valueStr);
    return fractionDigits == null
        ? value
        : getNumByValueDouble(value, fractionDigits);
  }

  /**
   *  The parameter [fractionDigits] must be an integer satisfying:
   * `0 <= fractionDigits <= 20`.
   */
  static num getNumByValueDouble(double value, int fractionDigits) {
    if (value == null) return null;
    String valueStr = value.toStringAsFixed(fractionDigits);
    return fractionDigits == 0
        ? int.tryParse(valueStr)
        : double.tryParse(valueStr);
  }

  static int getIntByValueStr(String valueStr) {
    return int.tryParse(valueStr);
  }

  static double getDoubleByValueStr(String valueStr) {
    return double.tryParse(valueStr);
  }

  /// 加(精确相加,防止精度丢失).
  /// add (without loosing precision).
  static Decimal add(num a, num b) {
    return addDec(a.toString(), b.toString());
  }

  /// 减(精确相减,防止精度丢失).
  /// subtract (without loosing precision).
  static Decimal subtract(num a, num b) {
    return subtractDec(a.toString(), b.toString());
  }

  /// 乘(精确相乘,防止精度丢失).
  /// multiply (without loosing precision).
  static Decimal multiply(num a, num b) {
    return multiplyDec(a.toString(), b.toString());
  }

  /// 除(精确相除,防止精度丢失).
  /// divide (without loosing precision).
  static Decimal divide(num a, num b) {
    return divideDec(a.toString(), b.toString());
  }

  /// 余数
  static Decimal remainder(num a, num b) {
    return remainderDec(a.toString(), b.toString());
  }

  /// Relational less than operator.
  static bool lessThan(num a, num b) {
    return lessThanDec(a.toString(), b.toString());
  }

  /// Relational less than or equal operator.
  static bool thanOrEqual(num a, num b) {
    return thanOrEqualDec(a.toString(), b.toString());
  }

  /// Relational greater than operator.
  static bool greaterThan(num a, num b) {
    return greaterThanDec(a.toString(), b.toString());
  }

  /// Relational greater than or equal operator.
  static bool greaterOrEqual(num a, num b) {
    return greaterOrEqualDec(a.toString(), b.toString());
  }

  /// 加
  static Decimal addDec(String a, String b) {
    return Decimal.parse(a) + Decimal.parse(b);
  }

  /// 减
  static Decimal subtractDec(String a, String b) {
    return Decimal.parse(a) - Decimal.parse(b);
  }

  /// 乘
  static Decimal multiplyDec(String a, String b) {
    return Decimal.parse(a) * Decimal.parse(b);
  }

  /// 除
  static Decimal divideDec(String a, String b) {
    return Decimal.parse(a) / Decimal.parse(b);
  }

  /// 余数
  static Decimal remainderDec(String a, String b) {
    return Decimal.parse(a) % Decimal.parse(b);
  }

  /// Relational less than operator.
  static bool lessThanDec(String a, String b) {
    return Decimal.parse(a) < Decimal.parse(b);
  }

  /// Relational less than or equal operator.
  static bool thanOrEqualDec(String a, String b) {
    return Decimal.parse(a) <= Decimal.parse(b);
  }

  /// Relational greater than operator.
  static bool greaterThanDec(String a, String b) {
    return Decimal.parse(a) > Decimal.parse(b);
  }

  /// Relational greater than or equal operator.
  static bool greaterOrEqualDec(String a, String b) {
    return Decimal.parse(a) >= Decimal.parse(b);
  }
}
