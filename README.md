# common_utils (Flutter common utils library)

[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square)](https://pub.dartlang.org/packages/common_utils)

## [README of Chinese][readme-cn]

[common_utils]  is a common tools library for Flutter.
Contains DateUtil, NumUtil, ScreenUtil, RegexUtil, ObjectUtil, WidgetUtil.

[Example --> SimpleProject/示例工程](https://github.com/Sky24n/flutter_demos)

## Android scan code download APK
  ![](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/qrcode.png)

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
getNowDateMilliseconds          : get Now Date Milliseconds.
getNowDateStr                   : get Now DateStr.(yyyy-MM-dd HH:mm:ss)
getDateMillisecondsByTimeStr    : get DateMilliseconds By DateStr.
getDateStrByTimeStr             : get DateStr By DateStr.
getDateStrByMilliseconds        : get DateStr By Milliseconds.
getDateStrByDateTime            : get DateStr By DateTime.
getWeekDay                      : get WeekDay By DateTime.
getZHWeekDay                    : get ZH WeekDay By DateTime.
getWeekDayByMilliseconds        : get WeekDay By Milliseconds.
getZHWeekDayByMilliseconds      : get ZH WeekDay By Milliseconds.
isLeapYearByYear                : whether it is leap year.
```
* #### ScreenUtil
```
screenWidth
screenHeight
screenDensity
appBarHeight
statusBarHeight
getScreenWidth
getScreenHeight
getOrientation
```

* #### WidgetUtil
```
asyncPrepare              : Widget rendering listener.
getWidgetBounds           : get Widget Bounds (width, height).
getWidgetLocalToGlobal    : Get the coordinates of the widget on the screen.
```

* #### RegexUtil
```
isMobileSimple
isMobileExact
isTel
isIDCard
isIDCard15
isIDCard18
isIDCard18Exact
isEmail
isURL
isZh
isDate
isIP
```

* #### ObjectUtil
```
isEmptyString             : String is empty.
isEmptyList               : List is empty.
isEmptyMap                : Map Map empty.
isEmpty                   : Object is empty.(String List Map).
isNotEmpty                : Object is not empty.(String List Map).
twoListIsEqual            : Two List Is Equal.
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






[readme]: https://github.com/Sky24n/common_utils
[readme-cn]: https://github.com/Sky24n/common_utils/blob/master/README-CN.md


