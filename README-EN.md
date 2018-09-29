# common_utils (Flutter common utils library)

[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square)](https://pub.dartlang.org/packages/common_utils)

## [README of Chinese][readme]

[common_utils]  is a common tools library for Flutter.
 1、TimerUtil    : countdown，timer.(new)  
 2、MoneyUtil    : fen to yuan, format output.(new)  
 3、LogUtil      : simply encapsulate print logs.(new)  
 4、DateUtil     : date conversion formatted output.  
 5、ScreenUtil   : get screen width height density, appBarHeight, statusBarHeight, Orientation.  
 6、RegexUtil    : Regular verification of mobile phone numbers, ID cards, mailboxes and so on.  
 7、NumUtil      : Keep [x] decimal places.  
 8、WidgetUtil   : get Widget width height，coordinates.  
 9、ObjectUtil   : Object is empty,Two List is equal.  

## Demo: [flutter_demos](https://github.com/Sky24n/flutter_demos).

## Android scan code download APK
  ![](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/qrcode.png)

### Screenshot
  <img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180920-215011.jpg" width="200">" <img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180919-231618.jpg" width="200">  <img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180919-224146.jpg" width="200">   <img src="https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_demos/Screenshot_20180919-224231.jpg" width="200">

### Add dependency

```yaml
dependencies:
  common_utils: x.x.x  #latest version
```

### APIs

* #### TimerUtil
```
setInterval                 : set Timer interval.
setTotalTime                : set countdown totalTime.
startTimer()                : start Timer.
startCountDown              : start countdown Timer.
updateTotalTime             : update countdown totalTime.
cancel                      : cancels the timer.
setOnTimerTickCallback      : set timer callback.
isActive                    : timer is Active.
```

* #### MoneyUtil
```
changeF2Y                   : fen to yuan, format output.
changeFStr2YWithUnit        : fen str to yuan, format & unit  output.
changeF2YWithUnit           : fen to yuan, format & unit  output.
changeYWithUnit             : yuan, format & unit  output.(yuan is int,double,str).
```

* #### LogUtil
```
init(isDebug, tag)          : isDebug , tag.
e(object, tag)              : Log e.
v(object, tag)              : Log v. debug output.
```

* #### NumUtil
```
getIntByValueStr            : get int By value string.
getDoubleByValueStr         : get double By value string.
getNumByValueStr            : Keep [x] decimal places by value string.
getNumByValueDouble         : Keep [x] decimal places by double.
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
[readme-en]: https://github.com/Sky24n/common_utils/blob/master/README-EN.md


