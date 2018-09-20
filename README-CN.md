# common_utils (Flutter常用工具类库)

[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square)](https://pub.dartlang.org/packages/common_utils)

## [README of English][readme]

[common_utils] 工具类包含 日期，屏幕，正则，对象, 数字, Widget.

[Example --> SimpleProject/示例工程](https://github.com/Sky24n/flutter_demos)

## Android扫码下载APK
- ![](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/qrcode.png)

### Add dependency

```yaml
dependencies:
  common_utils: x.x.x  #latest version
```

### APIs

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






