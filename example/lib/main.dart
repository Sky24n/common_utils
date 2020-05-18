import 'dart:convert';

import 'package:common_utils/common_utils.dart';

void main() {
  testDateUtil();
}

void testDateUtil() {
  /**  ----------------DateUtil----------------  */

  DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch,
      format: DataFormats.full); // 2019-07-09 16:51:14
  DateUtil.formatDateStr("2019-07-09 16:51:14",
      format: "yyyy/M/d HH:mm:ss"); // 2019/7/9 16:51:14
  DateUtil.formatDate(DateTime.now(),
      format: "yyyy/MM/dd HH:mm:ss"); // 2019/07/09 16:51:14

  String dateStr = "2019-07-09 16:16:16";
  DateTime dateTime = DateUtil.getDateTime(dateStr);
  DateTime now = DateTime.now();
  int dateMs = DateUtil.getDateMsByTimeStr(dateStr);

  String nowStr1 = DateUtil.formatDateMs(dateMs, format: DataFormats.full);
  String nowStr2 = DateUtil.formatDateStr(dateStr, format: "yyyy/M/d HH:mm:ss");
  String nowStr3 = DateUtil.formatDate(dateTime, format: DataFormats.zh_full);
  String nowStr4 =
      DateUtil.formatDate(dateTime, format: 'yyyy年M月d日 HH时mm分ss秒');

  LogUtil.e('nowStr1: $nowStr1'); //2020-05-15 16:58:47
  LogUtil.e('nowStr2: $nowStr2'); //2019/7/9 16:16:16
  LogUtil.e('nowStr3: $nowStr3'); //2019年07月09日 16时16分16秒
  LogUtil.e('nowStr4: $nowStr4'); //2019年7月9日 16时16分16秒

  DateTime week = DateTime(2020, 5, 6);
  LogUtil.e(
      '2020/5/6 : ${DateUtil.getWeekday(week, short: true)}, toady: ${DateUtil.getWeekdayByMs(now.millisecondsSinceEpoch)}');
  LogUtil.e("Today DayOfYear: " + DateUtil.getDayOfYear(now).toString());
  /**  ----------------DateUtil----------------  */
}

void test() {
  /**  ----------------TimelineUtil----------------  */
  DateTime xxxDateTime = DateTime(2018, 10, 3, 16, 16, 16);
  LogUtil.e("Timeline: " +
      TimelineUtil.formatByDateTime(xxxDateTime, locale: 'zh').toString());
  /**  ----------------TimelineUtil----------------  */

  /**  ----------------MoneyUtil----------------  */
  String yuan = '1.66';
  LogUtil.e(MoneyUtil.changeFStr2YWithUnit("1160",
          format: MoneyFormat.NORMAL, unit: MoneyUnit.YUAN_ZH) +
      "   " +
      MoneyUtil.changeYWithUnit(yuan, MoneyUnit.YUAN_ZH));
  /**  ----------------MoneyUtil----------------  */

  /**  ----------------ObjectUtil----------------  */
  List<String> listA = ["A", "B", "C"];
  List<String> listB = ["A", "B", "C"];
  LogUtil.e("Two List Is Equal: " +
      ObjectUtil.twoListIsEqual(listA, listB).toString());
  /**  ----------------ObjectUtil----------------  */

  /**  ----------------DateUtil----------------  */

  DateTime week = DateTime(2020, 5, 6);
  DateTime now = DateTime.now();
  LogUtil.e(
      '2020/5/6 : ${DateUtil.getWeekday(week, short: true)}, toady: ${DateUtil.getWeekdayByMs(now.millisecondsSinceEpoch)}');
  LogUtil.e("Today DayOfYear: " + DateUtil.getDayOfYear(now).toString());
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
  LogUtil.e("...log...", tag: "test_tag");
  LogUtil.v("...log...", tag: "test_tag ");
  StringBuffer sb = new StringBuffer();
  for (int i = 1; i <= 160; i++) {
    sb.write('$i,');
  }
  LogUtil.e(sb.toString());
  /**  ----------------LogUtil----------------  */

  /**  ----------------NumUtil----------------  */

  double a = 59.89;
  int b = 10000;

  double c = 70.59;
  double d = 10.0;

  LogUtil.e("add    a/b : " +
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
  /**  ----------------NumUtil----------------  */

  LogUtil.e(DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch,
      format: DataFormats.full));
  LogUtil.e(
      DateUtil.formatDateStr("2019-07-09 16:51:14", format: DataFormats.full));
  LogUtil.e(DateUtil.formatDateStr("2019-07-09 16:51:14",
      format: "yyyy/M/d HH:mm:ss"));
  LogUtil.e("yyyy/MM/dd HH:mm:ss  " +
      DateUtil.formatDate(DateTime.now(), format: "yyyy/MM/dd HH:mm:ss"));
  LogUtil.e("HH:mm:ss  " +
      DateUtil.formatDateMs(59 * 1000, format: DataFormats.h_m_s, isUtc: true));

  /**  ----------------TextUtil----------------  */
  String phoneNo = TextUtil.formatSpace4("15845678910");
  LogUtil.e(phoneNo); //1584 5678 910
  LogUtil.e("replace: " + TextUtil.replace(phoneNo, ' ', ''));
  LogUtil.e("formatComma3: " + TextUtil.formatComma3(12345678)); //12,345,678
  LogUtil.e("reverse: " + TextUtil.reverse("12345678")); //87654321
  LogUtil.e("hideNumber: " + TextUtil.hideNumber("15845678910")); //158****8910
  /**  ----------------TextUtil----------------  */

  /**  ----------------JsonUtil----------------  */
  String objStr = "{\"name\":\"成都市\"}";
  City hisCity = JsonUtil.getObj(objStr, (v) => City.fromJson(v));
  String listStr = "[{\"name\":\"成都市\"}, {\"name\":\"北京市\"}]";
  List<City> cityList = JsonUtil.getObjList(listStr, (v) => City.fromJson(v));
  LogUtil.e(
      'JsonUtil -> hisCity: ${hisCity.toString()} ; cityList: ${cityList.toString()}');
  /**  ----------------JsonUtil----------------  */

  /**  ----------------EncryptUtil----------------  */
  const String key = '11, 22, 33, 44, 55, 66';
  String userName = 'Sky24n';
  String encode = EncryptUtil.xorBase64Encode(userName, key); // WH1YHgMs
  String decode = EncryptUtil.xorBase64Decode(encode, key); // Sky24n
  LogUtil.e('EncryptUtil -> encode: $encode, decode: $decode');
  /**  ----------------EncryptUtil----------------  */

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
  //timerCountDown.startCountDown();
  //if (timerCountDown != null) timerCountDown.cancel(); //dispose()
  /**  ----------------TimerUtil----------------  */

  List<String> list = [''];
  LogUtil.e("isEmptyList: ${ObjectUtil.isEmptyList(list)}");
  if (list is Iterable) {
    LogUtil.e("list is Iterable");
  } else {
    LogUtil.e("list is not Iterable");
  }
}

class City {
  String name;

  City(this.name);

  City.fromJson(Map<String, dynamic> json) : name = json['name'] as String;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['name'] = name;
    return map;
  }

  @override
  String toString() {
    return json.encode(this);
  }
}
