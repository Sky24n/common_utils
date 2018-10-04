import 'package:common_utils/common_utils.dart';

void main() {
  /// 示例工程地址
  /// Sample project url.
  /// https://github.com/Sky24n/flutter_demos

  /**  ----------------TimelineUtil----------------  */
  DateTime xxxDateTime = DateTime(2018, 10, 3, 16, 16, 16);
  LogUtil.e("Timeline: " +
      TimelineUtil.formatByDateTime(xxxDateTime, locale: 'zh')
          .toString());
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
  double value = NumUtil.getNumByValueStr(tempStr, fractionDigits: 2);
  LogUtil.e("getDoubleByStr: " + '$value'); //result=1.56
  /**  ----------------NumUtil----------------  */

  /**  ----------------LogUtil----------------  */
  LogUtil.init(isDebug: true, tag: "test");
  LogUtil.e("...log...", tag: "test");
  LogUtil.v("...log...", tag: "test");
  /**  ----------------LogUtil----------------  */

  /**  ----------------Util----------------  */
  /**  ----------------Util----------------  */
}
