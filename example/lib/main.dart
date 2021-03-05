import 'dart:convert';

import 'package:common_utils/common_utils.dart';

void main() {
  LogUtil.e("---------------- DateUtil st ----------------");
  String dateStr = "2019-07-09 16:16:16";
  DateTime? dateTime = DateUtil.getDateTime(dateStr);
  DateTime now = DateTime.now();
  int? dateMs = DateUtil.getDateMsByTimeStr(dateStr);
  String nowStr1 = DateUtil.formatDateMs(dateMs!, format: DateFormats.full);
  String nowStr2 = DateUtil.formatDateStr(dateStr, format: "yyyy/M/d HH:mm:ss");
  String nowStr3 = DateUtil.formatDate(dateTime, format: DateFormats.zh_full);
  String nowStr4 = DateUtil.formatDate(dateTime, format: 'yyyy年M月d日 HH时mm分ss秒');
  LogUtil.e('nowStr1: $nowStr1'); //2020-05-15 16:58:47
  LogUtil.e('nowStr2: $nowStr2'); //2019/7/9 16:16:16
  LogUtil.e('nowStr3: $nowStr3'); //2019年07月09日 16时16分16秒
  LogUtil.e('nowStr4: $nowStr4'); //2019年7月9日 16时16分16秒
  DateTime week = DateTime(2020, 5, 6);
  LogUtil.e('2020/5/6 : ${DateUtil.getWeekday(week, short: true)}');
  LogUtil.e('toady: ${DateUtil.getWeekdayByMs(now.millisecondsSinceEpoch)}');
  LogUtil.e("Today DayOfYear: " + DateUtil.getDayOfYear(now).toString());
  LogUtil.e("---------------- DateUtil en ----------------\n");

  LogUtil.e("---------------- EncryptUtil st ----------------");
  const String key = '11, 22, 33, 44, 55, 66';
  String userName = 'Sky24n';
  String encode = EncryptUtil.xorBase64Encode(userName, key); // WH1YHgMs
  String decode = EncryptUtil.xorBase64Decode(encode, key); // Sky24n
  LogUtil.e('EncryptUtil -> encode: $encode, decode: $decode');
  LogUtil.e("---------------- EncryptUtil en ----------------\n");

  LogUtil.e("---------------- JsonUtil st ----------------");
  String intListStr = "[1, 2, 3, 4, 5, 6]";
  List<int>? intList = JsonUtil.getList(intListStr);
  LogUtil.e("JsonUtil getList -> intList: $intList");
  String strListStr = "[\"tom\",\"tony\",\"jacky\"]";
  List<String>? strList = JsonUtil.getList(strListStr);
  LogUtil.e("JsonUtil getList -> strList: $strList");

  String objStr = "{\"name\":\"成都市\"}";
  City? hisCity =
      JsonUtil.getObj(objStr, (v) => City.fromJson(v as Map<String, dynamic>));
  String listStr = "[{\"name\":\"成都市\"}, {\"name\":\"北京市\"}]";
  List<City>? cityList = JsonUtil.getObjList(
      listStr, (v) => City.fromJson(v as Map<String, dynamic>));
  LogUtil.e(
      'JsonUtil -> hisCity: ${hisCity.toString()} ; cityList: ${cityList.toString()}');
  LogUtil.e("---------------- JsonUtil en ----------------\n");

  LogUtil.e("---------------- LogUtil st ----------------");
  //LogUtil.init(isDebug: true, tag: "test", maxLen: 128);
  LogUtil.init(isDebug: true);
  StringBuffer sb = StringBuffer();
  for (int i = 1; i <= 160; i++) {
    sb.write('$i,');
  }
  LogUtil.e(sb.toString());

  LogUtil.d(sb.toString());
  LogUtil.e("---------------- LogUtil en ----------------\n");

  LogUtil.e("---------------- MoneyUtil st ----------------");
  String yuan = '1.66';
  LogUtil.e(MoneyUtil.changeFStr2YWithUnit("1160",
          format: MoneyFormat.NORMAL, unit: MoneyUnit.YUAN_ZH) +
      "   " +
      MoneyUtil.changeYWithUnit(yuan, MoneyUnit.YUAN_ZH));
  LogUtil.e("---------------- MoneyUtil en ----------------\n");

  LogUtil.e("---------------- NumUtil st ----------------");
  //保留小数点后2位数
  String tempStr = "1.5561111";
  num? value = NumUtil.getNumByValueStr(tempStr, fractionDigits: 2);
  LogUtil.e("getDoubleByStr: " + '$value'); //result=1.56
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
  LogUtil.e("---------------- NumUtil en ----------------\n");

  LogUtil.e("---------------- ObjectUtil st ----------------");
  List<String> listA = ["A", "B", "C"];
  List<String> listB = ["A", "B", "C"];
  LogUtil.e("Two List Is Equal: " +
      ObjectUtil.twoListIsEqual(listA, listB).toString());
  LogUtil.e("---------------- ObjectUtil en ----------------\n");

  LogUtil.e("---------------- TextUtil st ----------------");
  String phoneNo = TextUtil.formatSpace4("15845678910");
  LogUtil.e(phoneNo); //1584 5678 910
  LogUtil.e("replace: " + TextUtil.replace(phoneNo, ' ', ''));
  LogUtil.e("formatComma3: " + TextUtil.formatComma3(12345678)); //12,345,678
  LogUtil.e("reverse: " + TextUtil.reverse("12345678")); //87654321
  LogUtil.e("hideNumber: " + TextUtil.hideNumber("15845678910")); //158****8910
  LogUtil.e("---------------- TextUtil en ----------------\n");

  LogUtil.e("---------------- TimelineUtil st ----------------");
  DateTime dateTime1 = DateTime(2020, 5, 20, 22, 30, 00);
  DateTime locDateTime = DateTime(2020, 5, 20, 23, 30, 00);
  LogUtil.e("Timeline: " +
      TimelineUtil.formatByDateTime(
        dateTime1,
        locDateTime: locDateTime,
        //locale: 'zh',
      ).toString());
  LogUtil.e("Timeline: " +
      TimelineUtil.formatByDateTime(
        dateTime1,
        //locDateTime: locDateTime,
      ).toString());
  LogUtil.e("Timeline formatA: " +
      TimelineUtil.formatA(
        dateTime1.millisecondsSinceEpoch,
        languageCode: 'zh',
        short: true,
      ).toString());
  LogUtil.e("---------------- TimelineUtil en ----------------\n");

  LogUtil.e("---------------- TimerUtil st ----------------");
  TimerUtil? timerUtil;
  //定时任务test
  timerUtil = TimerUtil(mInterval: 1000, mTotalTime: 5 * 1000);
  //timerUtil.setInterval(1000);
  timerUtil.setOnTimerTickCallback((int value) {
    LogUtil.e("TimerTick: " + value.toString());
  });
  timerUtil.startTimer();
  if (timerUtil != null) timerUtil.cancel(); //dispose()

  TimerUtil timerCountDown;
  //倒计时test
  timerCountDown = TimerUtil(mInterval: 1000, mTotalTime: 3 * 1000);
//    timerCountDown.setInterval(1000);
//    timerCountDown.setTotalTime(3 * 1000);
  timerCountDown.setOnTimerTickCallback((int value) {
    double tick = (value / 1000);
    LogUtil.e("CountDown: " + tick.toInt().toString());
  });
  //timerCountDown.startCountDown();
  //if (timerCountDown != null) timerCountDown.cancel(); //dispose()
  LogUtil.e("---------------- TimerUtil en ----------------\n");

  LogUtil.e('Regex: ${RegexUtil.isPassport('EG6504900')}');
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
