Language: [English](README-EN.md) | 中文简体

[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square&color=009688)](https://pub.dartlang.org/packages/common_utils)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square&color=2196F3)](https://pub.flutter-io.cn/packages/common_utils)

Dart常用工具类库。包含日期，正则，倒计时，时间轴等工具类。如果你有好的工具类欢迎PR.

1、如果您是纯Dart项目，可以直接引用本库。
```yaml
dependencies:
  common_utils: ^2.1.0
```
2、如果您是Flutter项目，请使用Flutter常用工具类库 [flustars][flustars_github]，该库依赖于本项目。[flustars][flustars_github]库为大家提供更多的工具类，例如SpUtil，ScreenUtil, DirectoryUtil等等。
```yaml
dependencies:
  flustars: ^2.0.1  
```

Dart常用工具类库 [common_utils][common_utils_github]
1. TimelineUtil     : 时间轴.
2. TimerUtil        : 倒计时，定时任务.
3. MoneyUtil        : 精确转换，元转分，分转元，支持格式输出.
4. LogUtil          : 简单封装打印日志.
5. DateUtil         : 日期转换格式化输出.
6. RegexUtil        : 正则验证手机号，身份证，邮箱等等.
7. NumUtil          : 保留x位小数, 精确加、减、乘、除, 防止精度丢失.
8. ObjectUtil       : 判断对象是否为空(String List Map),判断两个List是否相等.
9. EncryptUtil      : 异或对称加/解密，md5加密，Base64加/解密.
10. TextUtil        : 银行卡号每隔4位加空格，每隔3三位加逗号，隐藏手机号等等.
11. JsonUtil        : 简单封装json字符串转对象.

Flutter常用工具类库 [flustars][flustars_github]
1. SpUtil           : 单例"同步"SharedPreferences工具类。支持get传入默认值，支持存储对象，支持存储对象数组。
2. ScreenUtil       : 屏幕适配，获取屏幕宽、高、密度，AppBar高，状态栏高度，屏幕方向.
3. WidgetUtil       : 监听Widget渲染状态，获取Widget宽高，在屏幕上的坐标，获取网络/本地图片尺寸.
4. ImageUtil        : 获取网络/本地图片尺寸.
5. DirectoryUtil    : 文件目录工具类.
6. DioUtil          : 单例Dio网络工具类(已迁移至此处[DioUtil](https://github.com/Sky24n/FlutterRepos/blob/master/base_library/lib/src/data/net/dio_util.dart))。
 

### APIs
* SpUtil
强大易用的SharedPreferences工具类，详细使用请参考原仓库[flustars][flustars_github]。
```dart
/// 等待Sp初始化完成。
await SpUtil.getInstance();  
  
/// 同步使用Sp。支付默认值。
String name = SpUtil.putString("key_username", "Sky24n");
bool isShow = SpUtil.getBool("key_show", defValue: true);
  
/// 存储实体对象示例。
City city = new City();
city.name = "成都市";
SpUtil.putObject("loc_city", city);
    
City hisCity = SpUtil.getObj("loc_city", (v) => City.fromJson(v));
print("City: " + (hisCity == null ? "null" : hisCit.toString()));
  
/// 存储实体对象list示例。
List<City> list = new List();
list.add(new City(name: "成都市"));
list.add(new City(name: "北京市"));
SpUtil.putObjectList("loc_city_list", list);
    
List<City> _cityList = SpUtil.getObjList("loc_city_list", (v) => City.fromJson(v));
print("City list: " + (_cityList == null ? "null" : _cityList.toString()));
```

* DateUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/date_page.dart)
```
/// 一些常用格式参照。可以自定义格式，例如："yyyy/MM/dd HH:mm:ss"，"yyyy/M/d HH:mm:ss"。
/// 格式要求
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

getDateTimeByMs                 : .
getDateMsByTimeStr              : .
getNowDateMs                    : 获取现在 毫秒.
getNowDateStr                   : 获取现在 日期字符串.(yyyy-MM-dd HH:mm:ss)
formatDate                      : 格式化日期 DateTime.
formatDateStr                   : 格式化日期 字符串.
formatDateMs                    : 格式化日期 毫秒.
getWeekday                      : 获取星期几.
getDayOfYear                    : 在今年的第几天.
isToday                         : 是否是今天.
isYesterday                     : 是否是昨天.
isWeek                          : 是否是本周.
yearIsEqual                     : 是否同年.
isLeapYear                      : 是否是闰年.

// example
DateUtil.formatDateMs(dateMs, format: DateFormats.full); //2019-07-09 16:16:16
DateUtil.formatDateStr('2019-07-09 16:16:16', format: "yyyy/M/d HH:mm:ss"); //2019/7/9 16:16:16
DateUtil.formatDate(DateTime.now(), format: DateFormats.zh_full); //2019年07月09日 16时16分16秒
```

* EncryptUtil
```
encodeMd5                   : md5 加密.
encodeBase64                : Base64加密.
decodeBase64()              : Base64解密.
xorCode()                   : 异或对称加密.
xorBase64Encode()           : 异或对称 Base64 加密.
xorBase64Decode()           : 异或对称 Base64 解密.

const String key = '11, 22, 33, 44, 55, 66';
String userName = 'Sky24n';
String encode = EncryptUtil.xorBase64Encode(userName, key); // WH1YHgMs
String decode = EncryptUtil.xorBase64Decode(encode, key); // Sky24n
```

* JsonUtil
```
encodeObj                   : object to json string.
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
init(tag, isDebug, maxLen)  : tag 标签, isDebug: 模式, maxLen 每行最大长度.
e(object, tag)              : 日志e
v(object, tag)              : 日志v，只在debug模式输出.

//超长log查看
common_utils e  — — — — — — — — — — — — — — — — st — — — — — — — — — — — — — — — —
common_utils e | 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,
common_utils e | 7,988,989,990,991,992,993,994,995,996,997,998,999,
common_utils e  — — — — — — — — — — — — — — — — ed — — — — — — — — — — — — — — — —
```

* MoneyUtil 精确转换,防止精度丢失 -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/money_page.dart)
```
changeF2Y                   : 分 转 元, format格式输出.
changeFStr2YWithUnit        : 分字符串 转 元, format 与 unit 格式 输出.
changeF2YWithUnit           : 分 转 元, format 与 unit 格式 输出.
changeYWithUnit             : 元, format 与 unit 格式 输出.
changeY2F                   : 元 转 分. 
```

* NumUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/num_util_page.dart)
```
getIntByValueStr            : 数字字符串转int.
getDoubleByValueStr         : 数字字符串转double.
getNumByValueStr            : 保留x位小数 by 数字字符串.
getNumByValueDouble         : 保留x位小数 by double.
isZero                      : 是否为0.
add                         : 加(精确相加,防止精度丢失).
subtract                    : 减(精确相减,防止精度丢失).
multiply                    : 乘(精确相乘,防止精度丢失).
divide                      : 除(精确相除,防止精度丢失).
remainder                   : 余.
lessThan                    : < .
thanOrEqual                 : <= .
greaterThan                 : > .
greaterOrEqual              : >= .
```

* ObjectUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/object_util_page.dart)
```
isEmptyString             : 判断String是否为空.
isEmptyList               : 判断List是否为空.
isEmptyMap                : 判断Map是否为空.
isEmpty                   : 判断对象是否为空.(String List Map).
isNotEmpty                : 判断对象是否非空.(String List Map).
twoListIsEqual            : 判断两个List是否相等.
```

* RegexUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/regex_page.dart)
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
isUserName                : 验证用户名
isQQ                      : 验证 QQ
```

* TextUtil
```
isEmpty                     : isEmpty.
formatSpace4                : 每隔4位加空格，格式化银行卡.
formatComma3                : 每隔3三位加逗号.
formatDoubleComma3          : 每隔3三位加逗号.
hideNumber                  : 隐藏号码.
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
///(xx)为可配置输出
enum DayFormat {
  ///(小于30s->刚刚)、x分钟、x小时、(昨天)、x天.
  Simple,
  ///(小于30s->刚刚)、x分钟、x小时、[今年: (昨天/1天前)、(2天前)、MM-dd],[往年: yyyy-MM-dd].
  Common,
  ///小于30s->刚刚)、x分钟、x小时、[今年: (昨天 HH:mm/1天前)、(2天前)、MM-dd HH:mm],[往年: yyyy-MM-dd HH:mm].
  Full,
}
///Timeline信息配置.
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
setLocaleInfo               : 自定义设置配置信息.
formatByDateTime            : 格式输出时间轴信息 by DateTime .
format                      : 格式输出时间轴信息.
formatA                     : 格式输出时间轴信息. like QQ.
```

* TimerUtil -> [Example](https://github.com/Sky24n/flutter_wanandroid/blob/master/lib/demos/timer_page.dart)
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

### [Flutter Demos](https://github.com/Sky24n/flutter_wanandroid/tree/master/lib/demos)   
 
>- |--demos
>    - |-- city_select_page.dart 城市列表(索引&悬停)示例
>    - |-- date_page.dart 日期格式化示例
>    - |-- image_size_page.dart 获取网络/本地图片尺寸示例
>    - |-- money_page.dart 金额(元转分/分转元)示例
>    - |-- pinyin_page.dart 汉字转拼音示例
>    - |-- regex_page.dart 正则工具类示例
>    - |-- round_portrait_page.dart 圆形圆角头像示例
>    - |-- timeline_page.dart 时间轴示例
>    - |-- timer_page.dart 倒计时/定时器示例
>    - |-- widget_page.dart 获取Widget尺寸/屏幕坐标示例

### Thanks
本库部分源码参考，正则，时间轴。  
Blankj [AndroidUtilCode](https://github.com/Blankj/AndroidUtilCode) 强大易用的安卓工具类库。   
Andres Araujo [timeago](https://github.com/andresaraujo/timeago.dart) Dart时间轴库。   
a14n [decimal](https://github.com/a14n/dart-decimal) 精确运算，避免精度丢失。

### 关于作者
GitHub : [Sky24n](https://github.com/Sky24n)  
掘金 &nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://juejin.im/user/5b9e8a92e51d453df0440422/posts)  
简书 &nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://www.jianshu.com/u/cbf2ad25d33a)

### Changelog
Please see the [Changelog](CHANGELOG.md) page to know what's recently changed.

### Apps
[flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)  
[Moss](https://github.com/Sky24n/Moss).  
A GitHub client app developed with Flutter, which supports Android iOS Web.  
Web ：[Flutter Web](https://sky24n.github.io/Sky24n/moss).

|![](https://z3.ax1x.com/2021/04/26/gp1hm6.jpg)|![](https://z3.ax1x.com/2021/04/26/gp1Tte.jpg)|![](https://z3.ax1x.com/2021/04/26/gp17fH.jpg)|
|:---:|:---:|:---:|


[flutter_wanandroid_qr]: https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/qrcode.png

[common_utils_github]: https://github.com/Sky24n/common_utils

[flustars_github]: https://github.com/Sky24n/flustars


