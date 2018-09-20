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
}
