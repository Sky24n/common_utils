Language: English | [中文简体](https://github.com/Sky24n/common_utils)

[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square&color=009688)](https://pub.dartlang.org/packages/common_utils)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square&color=2196F3)](https://pub.flutter-io.cn/packages/common_utils)

## common_utils is a Dart common utils library.

1、Dart project dependencies.
```yaml
dependencies:
  common_utils: ^2.1.0
```
2、Dart project dependencies, [flustars][flustars_github] is a Flutter common utils library. More SpUtil, ScreenUtil, DirectoryUtil.
```yaml
dependencies:
  flustars: ^2.0.1  
```

Dart utils Library [common_utils][common_utils_github]
1. TimelineUtil     : timeline util.
2. TimerUtil        : countdown，timer.
3. MoneyUtil        : fen to yuan, format output.
4. LogUtil          : simply encapsulate print logs.
5. DateUtil         : date conversion formatted output.
6. RegexUtil        : regular verification of mobile phone numbers, ID cards, mailboxes and so on.
7. NumUtil          : keep [x] decimal places, add subtract multiply divide without loosing precision.
8. ObjectUtil       : object is empty, two List is equal.
9. EncryptUtil      : xor, md5 ，Base64..
10. TextUtil        : hide phoneNo.
11. JsonUtil        : json to object.

Flutter utils Library [flustars][flustars_github]
1. SpUtil           : SharedPreferences Util.
2. ScreenUtil       : get screen width height density, appBarHeight, statusBarHeight, orientation.
3. WidgetUtil       : get Widget width height，coordinates.
4. ImageUtil        : get image size.
5. DirectoryUtil    : Directory Util.
6. DioUtil          : Dio Util(move to[DioUtil](https://github.com/Sky24n/FlutterRepos/blob/master/base_library/lib/src/data/net/dio_util.dart))。

### APIs
* SpUtil
SharedPreferences util.
```dart
/// await sp initialized。
await SpUtil.getInstance();  
  
/// support default value.
String name = SpUtil.putString("key_username", "Sky24n");
bool isShow = SpUtil.getBool("key_show", defValue: true);
  
/// save object example.
City city = new City();
city.name = "成都市";
SpUtil.putObject("loc_city", city);
    
City hisCity = SpUtil.getObj("loc_city", (v) => City.fromJson(v));
print("City: " + (hisCity == null ? "null" : hisCit.toString()));
  

/// save object list example.
List<City> list = new List();
list.add(new City(name: "成都市"));
list.add(new City(name: "北京市"));
SpUtil.putObjectList("loc_city_list", list);
    
List<City> _cityList = SpUtil.getObjList("loc_city_list", (v) => City.fromJson(v));
print("City list: " + (_cityList == null ? "null" : _cityList.toString()));
```

* DateUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/date_page.dart)
```
/// common format。example："yyyy/MM/dd HH:mm:ss"，"yyyy/M/d HH:mm:ss"。
/// year -> yyyy/yy   month -> MM/M    day -> dd/d
/// hour -> HH/H      minute -> mm/m   second -> ss/s
class DataFormats {
  static String full = "yyyy-MM-dd HH:mm:ss";
  static String y_mo_d_h_m = "yyyy-MM-dd HH:mm";
  static String y_mo_d = "yyyy-MM-dd";
  static String y_mo = "yyyy-MM";
  static String mo_d = "MM-dd";
  static String mo_d_h_m = "MM-dd HH:mm";
  static String h_m_s = "HH:mm:ss";
  static String h_m = "HH:mm";

  static String zh_full = "yyyy年MM月dd日 HH时mm分ss秒";
  static String zh_y_mo_d_h_m = "yyyy年MM月dd日 HH时mm分";
  static String zh_y_mo_d = "yyyy年MM月dd日";
  static String zh_y_mo = "yyyy年MM月";
  static String zh_mo_d = "MM月dd日";
  static String zh_mo_d_h_m = "MM月dd日 HH时mm分";
  static String zh_h_m_s = "HH时mm分ss秒";
  static String zh_h_m = "HH时mm分";
}

getDateTimeByMs                 : 
getDateMsByTimeStr              : 
getNowDateMs                    : get Now Date milliseconds.
getNowDateStr                   : get Now DateStr.(yyyy-MM-dd HH:mm:ss)
formatDate                      : format Date by DateTime.
formatDateStr                   : format Date by DateStr.
formatDateMs                    : format Date by milliseconds.
getWeekday                      : get weekDay.
getDayOfYear                    : get day of year.
isToday                         : is today.
isYesterday                     : is yesterday.
isWeek                          : is week.
yearIsEqual                     : whether it is leap year.
isLeapYear                      : year is equal.

// example
DateUtil.formatDateMs(dateMs, format: DateFormats.full); //2019-07-09 16:16:16
DateUtil.formatDateStr('2019-07-09 16:16:16', format: "yyyy/M/d HH:mm:ss"); //2019/7/9 16:16:16
DateUtil.formatDate(DateTime.now(), format: DateFormats.zh_full); //2019年07月09日 16时16分16秒
```

* EncryptUtil
```
encodeMd5                   : md5.
encodeBase64                : Base64 encode.
decodeBase64()              : Base64 decode.
xorCode()                   : xor.
xorBase64Encode()           : xor Base64 encode.
xorBase64Decode()           : xor Base64 decode.

const String key = '11, 22, 33, 44, 55, 66';
String userName = 'Sky24n';
String encode = EncryptUtil.xorBase64Encode(userName, key); // WH1YHgMs
String decode = EncryptUtil.xorBase64Decode(encode, key); // Sky24n
```

* JsonUtil
```
encodeObj                   : Obj to json string.
getObj                      : json string to object.
getObject                   : json string / map to object.
getObjList                  : json string list to object list.
getObjectList               : json string / map list to object list.

String objStr = "{\"name\":\"成都市\"}";
City hisCity = JsonUtil.getObj(objStr, (v) => City.fromJson(v));
String listStr = "[{\"name\":\"成都市\"}, {\"name\":\"北京市\"}]";
List<City> cityList = JsonUtil.getObjList(listStr, (v) => City.fromJson(v));
```

* LogUtil
```
init(tag, isDebug, maxLen)  : tag, isDebug, maxLen.
e(object, tag)              : Log e.
v(object, tag)              : Log v,debug output.

//超长log查看
common_utils e  — — — — — — — — — — — — — — — — st — — — — — — — — — — — — — — — —
common_utils e | 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,
common_utils e | 7,988,989,990,991,992,993,994,995,996,997,998,999,
common_utils e  — — — — — — — — — — — — — — — — ed — — — — — — — — — — — — — — — —
```

* MoneyUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/money_page.dart)
```
changeF2Y                   : fen to yuan, format output.
changeFStr2YWithUnit        : fen str to yuan, format & unit  output.
changeF2YWithUnit           : fen to yuan, format & unit  output.
changeYWithUnit             : yuan, format & unit  output.(yuan is int,double,str).
changeY2F                   : fen to yuan.
```

* NumUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/num_util_page.dart)
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

* ObjectUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/object_util_page.dart)
```
isEmptyString             : String is empty.
isEmptyList               : List is empty.
isEmptyMap                : Map Map empty.
isEmpty                   : Object is empty.(String List Map).
isNotEmpty                : Object is not empty.(String List Map).
twoListIsEqual            : Two List Is Equal.
```

* RegexUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/regex_page.dart)
```
isMobileSimple            : 
isMobileExact             : 
isTel                     : 
isIDCard                  : 
isIDCard15                : 
isIDCard18                : 
isIDCard18Exact           : 
isEmail                   : 
isURL                     : 
isZh                      : 
isDate                    : 
isIP                      : 
isUserName                :
isQQ                      :
```

* TextUtil
```
isEmpty                     : isEmpty.
formatSpace4                : format Space 4.
formatComma3                : format Comma 3.
formatDoubleComma3          : format Double Comma3.
hideNumber                  : hide number.
replace                     : replace.
split                       : split.
reverse                     : reverse.
  
/// example
String phoneNo = TextUtil.formatSpace4("15845678910"); // 1584 5678 910
String num     = TextUtil.formatComma3("1234"); // 123,4
String phoneNo = TextUtil.hideNumber("15845678910")// 158****8910
```

* TimelineUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/timeline_page.dart)
```
///(xx)Configurable output.
enum DayFormat {
  ///(less than 30s->just now)、x minutes、x hours、(Yesterday)、x days.
  Simple,
  ///(less than 30s->just now)、x minutes、x hours、[This year:(Yesterday/a day ago)、(two days age)、MM-dd ]、[past years: yyyy-MM-dd]
  Common,
  ///(less than 30s->just now)、x minutes、x hours、[This year:(Yesterday HH:mm/a day ago)、(two days age)、MM-dd HH:mm]、[past years: yyyy-MM-dd HH:mm]
  Full,
}
///Timeline information configuration.
abstract class TimelineInfo {
  String suffixAgo(); //suffix ago(后缀 后).
  String suffixAfter(); //suffix after(后缀 前).
  int maxJustNowSecond() => 30; // max just now second.
  String lessThanOneMinute() => ''; //just now(刚刚).
  String customYesterday() => ''; //Yesterday(昨天).优先级高于keepOneDay
  bool keepOneDay(); //保持1天,example: true -> 1天前, false -> MM-dd.
  bool keepTwoDays(); //保持2天,example: true -> 2天前, false -> MM-dd.
  String oneMinute(int minutes); //a minute(1分钟).
  String minutes(int minutes); //x minutes(x分钟).
  String anHour(int hours); //an hour(1小时).
  String hours(int hours); //x hours(x小时).
  String oneDay(int days); //a day(1天).
  String days(int days); //x days(x天).
}
setLocaleInfo               : add custom configuration.
formatByDateTime            : timeline format output by DateTime .
format                      : timeline format output.
formatA                     : timeline format output. like QQ.

```

* TimerUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/timer_page.dart)
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

### [Flutter Demos](https://github.com/Sky24n/flutter_wanandroid/tree/master/lib/demos)

>- |--demos
>    - |-- city_select_page.dart
>    - |-- date_page.dart
>    - |-- image_size_page.dart
>    - |-- money_page.dart
>    - |-- pinyin_page.dart
>    - |-- regex_page.dart
>    - |-- round_portrait_page.dart
>    - |-- timeline_page.dart
>    - |-- timer_page.dart
>    - |-- widget_page.dart

### Demo Apk : [flutter_wanandroid](https://github.com/Sky24n/Doc)

### Thanks
Blankj [AndroidUtilCode](https://github.com/Blankj/AndroidUtilCode)。  
Andres Araujo [timeago](https://github.com/andresaraujo/timeago.dart)。  
a14n [decimal](https://github.com/a14n/dart-decimal)。

### Apps
[flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)  
[Moss App](https://github.com/Sky24n/Moss)

### [Change Log](CHANGELOG.md)
v1.2.1 (2020.05.29)  
1、fix DataFormats -> DateFormats。  
2、fix TimelineInfo bugs。



[flustars_github]: https://github.com/Sky24n/flustars
[common_utils_github]: https://github.com/Sky24n/common_utils