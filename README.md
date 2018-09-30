# common_utils (Flutter常用工具类库)

[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square)](https://pub.dartlang.org/packages/common_utils)

## [README of English][readme-en]

## [common_utils] Flutter常用工具类库. 如果你有好的工具类欢迎PR.
 1、TimerUtil    : 倒计时，定时任务.(新)  
 2、MoneyUtil    : 分转元，支持格式输出.(新)  
 3、LogUtil      : 简单封装打印日志.(新)  
 4、DateUtil     : 日期转换格式化输出.  
 5、ScreenUtil   : 获取屏幕宽、高、密度，AppBar高，状态栏高度，屏幕方向.  
 6、RegexUtil    : 正则验证手机号，身份证，邮箱等等.  
 7、NumUtil      : 保留x位小数.  
 8、WidgetUtil   : 获取Widget宽高，在屏幕上的坐标.  
 9、ObjectUtil   : 判断对象是否为空(String List Map),判断两个List是否相等.  
 
## Demo: [flutter_demos](https://github.com/Sky24n/flutter_demos).
## APK:[点击下载v1.0.1](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_demos.apk)
## Android扫码下载APK
  ![](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/qrcode.png)

### Screenshot
<img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180930-012302.jpg" width="200">   <img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180930-012431.jpg" width="200">  <img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180919-231618.jpg" width="200">   <img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180926-144840.png" width="200"> 
<img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180919-224204.jpg" width="200">   <img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180919-224146.jpg" width="200">   <img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180919-224231.jpg" width="200">   

### Add dependency

```yaml
dependencies:
  common_utils: x.x.x  #latest version
```

### APIs

* #### TimerUtil
```
setInterval                 : 设置Timer间隔.
setTotalTime                : 设置倒计时总时间.
startTimer()                : 启动定时Timer.
startCountDown              : 启动倒计时Timer.
updateTotalTime             : 重设倒计时总时间.
cancel                      : 取消计时器.
setOnTimerTickCallback      : 计时器回调.
isActive                    : Timer是否启动.
```

* #### MoneyUtil
```
changeF2Y                   : 分 转 元, format格式输出.
changeFStr2YWithUnit        : 分字符串 转 元, format 与 unit 格式 输出.
changeF2YWithUnit           : 分 转 元, format 与 unit 格式 输出.
changeYWithUnit             : 元, format 与 unit 格式 输出.
```

* #### LogUtil
```
init(isDebug, tag)          : isDebug: 模式, tag 标签.
e(object, tag)              : 日志e
v(object, tag)              : 日志v，只在debug模式输出.
```

* #### NumUtil
```
getIntByValueStr            : 数字字符串转int.
getDoubleByValueStr         : 数字字符串转double.
getNumByValueStr            : 保留x位小数 by 数字字符串.
getNumByValueDouble         : 保留x位小数 by double.
```

* #### DateUtil
```
enum DateFormat {
  DEFAULT, //yyyy-MM-dd HH:mm:ss.SSS
  NORMAL, //yyyy-MM-dd HH:mm:ss
  YEAR_MONTH_DAY_HOUR_MINUTE, //yyyy-MM-dd HH:mm
  YEAR_MONTH_DAY, //yyyy-MM-dd
  YEAR_MONTH, //yyyy-MM
  MONTH_DAY, //MM-dd
  MONTH_DAY_HOUR_MINUTE, //MM-dd HH:mm
  HOUR_MINUTE_SECOND, //HH:mm:ss
  HOUR_MINUTE, //HH:mm

  ZH_DEFAULT, //yyyy年MM月dd日 HH时mm分ss秒SSS毫秒
  ZH_NORMAL, //yyyy年MM月dd日 HH时mm分ss秒  /  timeSeparate: ":" --> yyyy年MM月dd日 HH:mm:ss
  ZH_YEAR_MONTH_DAY_HOUR_MINUTE, //yyyy年MM月dd日 HH时mm分  /  timeSeparate: ":" --> yyyy年MM月dd日 HH:mm
  ZH_YEAR_MONTH_DAY, //yyyy年MM月dd日
  ZH_YEAR_MONTH, //yyyy年MM月
  ZH_MONTH_DAY, //MM月dd日
  ZH_MONTH_DAY_HOUR_MINUTE, //MM月dd日 HH时mm分  /  timeSeparate: ":" --> MM月dd日 HH:mm
  ZH_HOUR_MINUTE_SECOND, //HH时mm分ss秒
  ZH_HOUR_MINUTE, //HH时mm分
}
getNowDateMilliseconds          : 获取现在 毫秒.
getNowDateStr                   : 获取现在 日期字符串.(yyyy-MM-dd HH:mm:ss)
getDateMillisecondsByTimeStr    : 获取毫秒 By 日期字符串(Format格式输出).
getDateStrByTimeStr             : 获取日期字符串 By 日期字符串(Format格式输出).
getDateStrByMilliseconds        : 获取日期字符串 By 毫秒(Format格式输出).
getDateStrByDateTime            : 获取日期字符串 By DateTime(Format格式输出).
getWeekDay                      : 获取WeekDay By DateTime.
getZHWeekDay                    : 获取星期 By DateTime.
getWeekDayByMilliseconds        : 获取WeekDay By 毫秒.
getZHWeekDayByMilliseconds      : 获取星期 By 毫秒.
isLeapYearByYear                : 是否是闰年.
```
* #### ScreenUtil
```
screenWidth               : 获取屏幕宽.
screenHeight              : 获取屏幕高.
screenDensity             : 获取屏幕密度.
appBarHeight              : 获取系统AppBar高度.
statusBarHeight           : 获取系统状态栏高度.
getScreenWidth            : 获取当前屏幕宽.
getScreenHeight           : 获取当前屏幕高.
getOrientation            : 获取当前屏幕方向.
```

* #### WidgetUtil
```
asyncPrepare              : 监听widget宽高变化,callback返回宽高等参数.
getWidgetBounds           : 获取widget 宽高.
getWidgetLocalToGlobal    : 获取widget在屏幕上的坐标.
```

* #### RegexUtil
```
isMobileSimple            : 简单验证手机号
isMobileExact             : 精确验证手机号
isTel                     : 验证电话号码
isIDCard                  : 验证身份证号码
isIDCard15                : 验证身份证号码 15 位
isIDCard18                : 简单验证身份证号码 18 位
isIDCard18Exact           : 精确验证身份证号码 18 位
isEmail                   : 验证邮箱
isURL                     : 验证 URL
isZh                      : 验证汉字
isDate                    : 验证 yyyy-MM-dd 格式的日期校验，已考虑平闰年
isIP                      : 验证 IP 地址
```

* #### ObjectUtil
```
isEmptyString             : 判断String是否为空.
isEmptyList               : 判断List是否为空.
isEmptyMap                : 判断Map是否为空.
isEmpty                   : 判断对象是否为空.(String List Map).
isNotEmpty                : 判断对象是否非空.(String List Map).
twoListIsEqual            : 判断两个List是否相等.
```

### Example

``` dart

// Import package
import 'package:common_utils/common_utils.dart';

//MoneyUtil example
String moneyTxt = MoneyUtil.changeFStr2YWithUnit("1160", format: MoneyFormat.NORMAL, unit: MoneyUnit.YUAN_ZH);
String moneyTxt = MoneyUtil.changeYWithUnit("1.66", unit: MoneyUnit.YUAN_ZH);

//TimerUtil example
TimerUtil timerUtil;
  //定时任务test
  timerUtil = new TimerUtil(mInterval: 1000);
  //timerUtil.setInterval(1000);
  timerUtil.setOnTimerTickCallback((int value) {
      LogUtil.e("TimerTick: " + value.toString());
  });
  timerUtil.startTimer();
  //timerUtil.cancel();
 
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
    //timerUtil.cancel();

//LogUtil example
LogUtil.init(isDebug: true, tag: "test");
LogUtil.e("...log...", tag: "test");
LogUtil.v("...log...", tag: "test");
    
//DateUtil example
String timeNow = DateUtil.getDateStrByDateTime(DateTime.now());//2018-09-16 23:14:56
String timeNow = DateUtil.getDateStrByDateTime(DateTime.now(),format: DateFormat.ZH_NORMAL);//2018年09月16日 23时16分15秒
String weekday = DateUtil.getWeekDay(DateTime.parse("2018-09-16"));//Sunday
String weekdayZh = DateUtil.getZHWeekDay(DateTime.parse("2018-09-16"));//星期日

//First Page init. Notice!!!
ScreenUtil.getInstance().init(context);

ScreenUtil.screenWidth
ScreenUtil.screenHeight
ScreenUtil.statusBarHeight
ScreenUtil.screenDensity

List listA = ["A", "B", "C"];
List listB = ["A", "B", "C"];
print("Two List Is Equal: " + ObjectUtil.twoListIsEqual(listA, listB).toString());

// Global variable，Reference example
WidgetUtil widgetUtil = new WidgetUtil();

@override
Widget build(BuildContext context) {
  widgetUtil.asyncPrepare(context, false, (Rect rect) {
     double width = rect.width;
     double height = rect.height;
  });
    return ;
 }

//Widgets must be rendered completely. Otherwise return Rect.zero.
Rect rect = WidgetUtil.getWidgetBounds(context);
double width = rect.width;
double height = rect.height;

//Widgets must be rendered completely. Otherwise return Offset.zero.
Offset offset = WidgetUtil.getWidgetLocalToGlobal(context);
double dx = offset.dx  
double dx = offset.dy

```





[readme]: https://github.com/Sky24n/common_utils
[readme-en]: https://github.com/Sky24n/common_utils/blob/master/README-EN.md





