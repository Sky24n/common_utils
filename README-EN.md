# common_utils (Dart common utils library, Platforms: Flutter, web, other)

[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square)](https://pub.dartlang.org/packages/common_utils)

## [README of Chinese][readme]

## Update Description  
```dart
/// DateUtil
DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch, format: DataFormats.full); // 2019-07-09 16:51:14
DateUtil.formatDateStr("2019-07-09 16:51:14", format: "yyyy/M/d HH:mm:ss"); // 2019/7/9 16:51:14
DateUtil.formatDate(DateTime.now(), format: "yyyy/MM/dd HH:mm:ss");  // 2019/07/09 16:51:14
  
/// TextUtil
String phoneNo = TextUtil.formatSpace4("15845678910"); // 1584 5678 910
String num     = TextUtil.formatComma3("1234"); // 123,4
String phoneNo = TextUtil.hideNumber("15845678910")// 158****8910

```

## [common_utils] is a dart common tools library.  
### [common_utils](https://github.com/Sky24n/common_utils)  
 1、TimelineUtil     : timeline util.(new)  
 2、TimerUtil        : countdown，timer.(new)  
 3、MoneyUtil        : fen to yuan, format output.(new)  
 4、LogUtil          : simply encapsulate print logs.(new)  
 5、DateUtil         : date conversion formatted output.  
 6、RegexUtil        : Regular verification of mobile phone numbers, ID cards, mailboxes and so on.  
 7、NumUtil          : Keep [x] decimal places,add subtract multiply divide without loosing precision.  
 8、ObjectUtil       : Object is empty,Two List is equal.  
 9、EnDecodeUtil     : md5 ，Base64.  
10、TextUtil         : hide phoneNo.  
### Flutter Library [flustars](https://github.com/Sky24n/flustars)  
 1、SpUtil           : SharedPreferences Util.  
 2、ScreenUtil       : get screen width height density, appBarHeight, statusBarHeight, Orientation.  
 3、WidgetUtil       : get Widget width height，coordinates. 
 4、DirectoryUtil    : Directory Util.  
 5、DioUtil          : Dio Util(move to[DioUtil](https://github.com/Sky24n/FlutterRepos/blob/master/base_library/lib/src/data/net/dio_util.dart))。 
### Add dependency

```yaml
dependencies:
  common_utils: x.x.x  #latest version
```
### APIs
* #### SpUtil
强大的SharedPreferences工具类，详细使用请参考原仓库[flustars][flustars_github]。
```dart
/// 等待Sp初始化完成。
await SpUtil.getInstance();  
  
/// 同步使用Sp。支付默认值。
String name = SpUtil.putString("key_username", "Sky24n");
bool isShow = SpUtil.getBool("key_show", defValue: true);
  
/// save object example.
/// 存储实体对象示例。
City city = new City();
city.name = "成都市";
SpUtil.putObject("loc_city", city);
    
City hisCity = SpUtil.getObj("loc_city", (v) => City.fromJson(v));
print("City: " + (hisCity == null ? "null" : hisCit.toString()));
  

/// save object list example.
/// 存储实体对象list示例。
List<City> list = new List();
list.add(new City(name: "成都市"));
list.add(new City(name: "北京市"));
SpUtil.putObjectList("loc_city_list", list);
    
List<City> _cityList = SpUtil.getObjList("loc_city_list", (v) => City.fromJson(v));
print("City list: " + (_cityList == null ? "null" : _cityList.toString()));
```
* #### TextUtil
```
isEmpty                     : isEmpty.(new)
formatSpace4                : 每隔4位加空格.(new)
formatComma3                : 每隔3三位加逗号.(new)
hideNumber                   : 隐藏手机号，例如：158****8910.(new)
replace                     : replace.(new)
split                       : split.(new)
  
/// example
String phoneNo = TextUtil.formatSpace4("15845678910"); // 1584 5678 910
String num     = TextUtil.formatComma3("1234"); // 123,4
String phoneNo = TextUtil.hideNumber("15845678910")// 158****8910
```

* #### EnDecodeUtil
```
encodeMd5                   : md5 加密.(new)
encodeBase64                : Base64加密.(new)
decodeBase64()              : Base64解密.(new)
```
### APIs
* #### TimelineUtil
```
///(xx)Configurable output.
enum DayFormat {
  ///(less than 10s->just now)、x minutes、x hours、(Yesterday)、x days.
  Simple,
  ///(less than 10s->just now)、x minutes、x hours、[This year:(Yesterday/a day ago)、(two days age)、MM-dd ]、[past years: yyyy-MM-dd]
  Common,
  ///(less than 10s->just now)、x minutes、x hours、[This year:(Yesterday HH:mm/a day ago)、(two days age)、MM-dd HH:mm]、[past years: yyyy-MM-dd HH:mm]
  Full,
}
///Timeline information configuration.
abstract class TimelineInfo {
  String suffixAgo(); //suffix ago(后缀 后).
  String suffixAfter(); //suffix after(后缀 前).
  String lessThanTenSecond() => ''; //just now(刚刚).
  String customYesterday() => ''; //Yesterday(昨天).优先级高于keepOneDay
  bool keepOneDay(); //保持1天,example: true -> 1天前, false -> MM-dd.
  bool keepTwoDays(); //保持2天,example: true -> 2天前, false -> MM-dd.
  String oneMinute(int minutes); //a minute(1分钟).
  String minutes(int minutes); //x minutes(x分钟).
  String anHour(int hours); //an hour(1小时).
  String hours(int hours); //x hours(x小时).
  String oneDay(int days); //a day(1天).
  String days(int days); //x days(x天).
  DayFormat dayFormat(); //format.
}
setLocaleInfo               : add custom configuration.
formatByDateTime            : timeline format output by DateTime .
format                      : timeline format output.
```

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
changeY2F                   : fen to yuan.
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
isZero                      : is Zero.
add                         : add (without loosing precision).
subtract                    : subtract (without loosing precision).
multiply                    : multiply (without loosing precision).
divide                      : divide (without loosing precision).
remainder                   : 余.
lessThan                    : < .
thanOrEqual                 : <= .
greaterThan                 : > .
greaterOrEqual              : >= .
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
formatDate                      : format Date DateTime.(new)
formatDateStr                   : format Date DateStr.(new)
formatDateMs                    : format Date milliseconds.(new)
getNowDateMs                    : get Now Date milliseconds.
getNowDateStr                   : get Now DateStr.(yyyy-MM-dd HH:mm:ss)
getDateMsByTimeStr              : get DateMilliseconds By DateStr.
getDateStrByTimeStr             : get DateStr By DateStr.
getDateStrByMs                  : get DateStr By milliseconds.
getDateStrByDateTime            : get DateStr By DateTime.
getWeekDay                      : get WeekDay By DateTime.
getZHWeekDay                    : get ZH WeekDay By DateTime.
getWeekDayByMs                  : get WeekDay By Milliseconds.
getZHWeekDayByMs                : get ZH WeekDay By Milliseconds.
isLeapYearByYear                : whether it is leap year.
yearIsEqual                     : year is equal.
getDayOfYear                    : get day of year..
isYesterday                     : is yesterday.
isToday                         : is Today.
isWeek                          : is Week.(new)
  
// example
DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch, format: DataFormats.full); // 2019-07-09 16:51:14
DateUtil.formatDateStr("2019-07-09 16:51:14", format: "yyyy/M/d HH:mm:ss"); // 2019/7/9 16:51:14
DateUtil.formatDate(DateTime.now(), format: "yyyy/MM/dd HH:mm:ss");  // 2019/07/09 16:51:14
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


