import 'package:common_utils/common_utils.dart';

void main() {
  /// 示例工程地址
  /// Sample project url.
  /// https://github.com/Sky24n/flutter_demos

  /**  ----------------TimelineUtil----------------  */
  DateTime xxxDateTime = DateTime(2018, 10, 3, 16, 16, 16);
  LogUtil.e("Timeline: " +
      TimelineUtil.formatByDateTime(xxxDateTime, locale: 'zh').toString());
  /**  ----------------TimelineUtil----------------  */

  /**  ----------------MoneyUtil----------------  */
  String yuan = '1.66';
  LogUtil.e(MoneyUtil.changeFStr2YWithUnit("1160",
          format: MoneyFormat.NORMAL, unit: MoneyUnit.YUAN_ZH) +
      "\n" +
      MoneyUtil.changeYWithUnit(yuan, MoneyUnit.YUAN_ZH));
  /**  ----------------MoneyUtil----------------  */

  /**  ----------------TimerUtil----------------  */
  TimerUtil timerUtil;
  //定时任务test
  timerUtil = new TimerUtil(mInterval: 1000);
  //timerUtil.setInterval(1000);
  timerUtil.setOnTimerTickCallback((int value) {
    LogUtil.e("TimerTick: " + value.toString());
  });
  timerUtil.startTimer();
  if (timerUtil != null) timerUtil.cancel(); //dispose()

  TimerUtil timerCountDown;
  //倒计时test
  timerCountDown = new TimerUtil(mInterval: 1000, mTotalTime: 3 * 1000);
//    timerCountDown.setInterval(1000);
//    timerCountDown.setTotalTime(3 * 1000);
  timerCountDown.setOnTimerTickCallback((int value) {
    double tick = (value / 1000);
    LogUtil.e("CountDown: " + tick.toInt().toString());
  });
  timerCountDown.startCountDown();
  if (timerCountDown != null) timerCountDown.cancel(); //dispose()
  /**  ----------------TimerUtil----------------  */

  /**  ----------------ObjectUtil----------------  */
  List<String> listA = ["A", "B", "C"];
  List<String> listB = ["A", "B", "C"];
  LogUtil.e("Two List Is Equal: " +
      ObjectUtil.twoListIsEqual(listA, listB).toString());
  /**  ----------------ObjectUtil----------------  */

  /**  ----------------DateUtil----------------  */
  LogUtil.e("getTimeByDateTime: " +
      DateUtil.getDateStrByDateTime(DateTime.now(),
          format: DateFormat.NORMAL, dateSeparate: "/", timeSeparate: ":") +
      "\n" +
      DateUtil.getZHWeekDay(DateTime.parse("2018-09-16")) +
      "\n" +
      DateUtil.getDateStrByDateTime(DateTime.now()) +
      "\n" +
      DateUtil.getDateStrByDateTime(DateTime.now(),
          format: DateFormat.ZH_NORMAL) +
      "\n" +
      DateUtil.getNowDateStr() +
      "");
  /**  ----------------DateUtil----------------  */

  /**  ----------------NumUtil----------------  */
  //保留小数点后2位数
  String tempStr = "1.5561111";
  num value = NumUtil.getNumByValueStr(tempStr, fractionDigits: 0);
  LogUtil.e("getDoubleByStr: " + '$value'); //result=1.56
  /**  ----------------NumUtil----------------  */

  /**  ----------------LogUtil----------------  */
//  LogUtil.init(isDebug: true, tag: "test");
  LogUtil.init(isDebug: true);
  LogUtil.e("...log...", tag: "test");
  LogUtil.v("...log...", tag: "test");
  /**  ----------------LogUtil----------------  */

  /**  ----------------Util----------------  */

  double a = 59.89;
  int b = 10000;

  double c = 70.59;
  double d = 10.0;

  LogUtil.e("add    a+b : " +
      (a / b).toString() +
      "    add: " +
      NumUtil.divide(a, b).toString()); // a+b : 0.30000000000000004    add: 0.3
  LogUtil.e("mul    c*d : " +
      (c * d).toString() +
      "    mul: " +
      NumUtil.multiply(c, d).toString() +
      "    greaterThan: " +
      NumUtil.greaterThan(a, b)
          .toString()); //c*d : 705.9000000000001    mul: 705.9    greaterThan: false

  LogUtil.e("DayOfYear: " +
      DateUtil.getDayOfYear(new DateTime(2012, 3, 1)).toString());

  /**  ----------------Util----------------  */
  StringBuffer sb = new StringBuffer();
  for (int i = 0; i < 1000; i++) {
    sb.write('$i,');
  }
  LogUtil.e(sb.toString());

  LogUtil.e(DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch,
      format: DataFormats.full));
  LogUtil.e(
      DateUtil.formatDateStr("2019-07-09 16:51:14", format: DataFormats.full));
  LogUtil.e(DateUtil.formatDateStr("2019-07-09 16:51:14",
      format: "yyyy/M/d HH:mm:ss"));
  LogUtil.e(DateUtil.formatDate(DateTime.now(), format: "yyyy/MM/dd HH:mm:ss"));

  String phoneNo = TextUtil.formatSpace4("15845678910");
  LogUtil.e(phoneNo);
  LogUtil.e("replace: " + TextUtil.replace(phoneNo, ' ', ''));
  LogUtil.e("formatComma3: " + TextUtil.formatComma3(1234567)); //1,234,567
  LogUtil.e("reverse: " + TextUtil.reverse("1234567")); //7654321

  LogUtil.e("hideNumber: " + TextUtil.hideNumber("15845678910"));
}
