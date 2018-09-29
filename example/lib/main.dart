import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:common_utils/common_utils.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _sampleUrl = "示例工程地址" +
      "\n" +
      "\n" +
      "Sample project url"
      "\n" +
      "\n" +
      "https://github.com/Sky24n/flutter_demos";
  TimerUtil timerUtil;
  TimerUtil timerCountDown;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    if (timerUtil != null) timerUtil.cancel();
    if (timerCountDown != null) timerCountDown.cancel();
  }

  void init() {
    /**  ----------------MoneyUtil----------------  */
    String yuan = '1.66';
    LogUtil.e(MoneyUtil.changeFStr2YWithUnit("1160",
            format: MoneyFormat.NORMAL, unit: MoneyUnit.YUAN_ZH) +
        "\n" +
        MoneyUtil.changeYWithUnit(yuan, MoneyUnit.YUAN_ZH));
    /**  ----------------MoneyUtil----------------  */

    /**  ----------------TimerUtil----------------  */
    //定时任务test
    timerUtil = new TimerUtil(mInterval: 1000);
    //timerUtil.setInterval(1000);
    timerUtil.setOnTimerTickCallback((int value) {
      LogUtil.e("TimerTick: " + value.toString());
    });
    timerUtil.startTimer();

    //倒计时test
    timerCountDown = new TimerUtil(mInterval: 1000, mTotalTime: 3 * 1000);
//    timerCountDown.setInterval(1000);
//    timerCountDown.setTotalTime(3 * 1000);
    timerCountDown.setOnTimerTickCallback((int value) {
      double tick = (value / 1000);
      LogUtil.e("CountDown: " + tick.toInt().toString());
    });
    timerCountDown.startCountDown();
    /**  ----------------TimerUtil----------------  */

    /**  ----------------ScreenUtil----------------  */
    LogUtil.e("ScreenUtil screenWidth: " +
        ScreenUtil.screenWidth.toString() +
        "   screenHeight: " +
        ScreenUtil.screenHeight.toString() +
        "   statusBarHeight: " +
        ScreenUtil.statusBarHeight.toString() +
        "   screenDensity: " +
        ScreenUtil.screenDensity.toString() +
        "");

    /**  ----------------ScreenUtil----------------  */

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

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);

    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Common Utils'),
          centerTitle: true,
        ),
        body: new Center(
          child: new Text(
            _sampleUrl,
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ));
  }
}
