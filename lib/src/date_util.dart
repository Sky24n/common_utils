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

/**
 * @Author: thl
 * @GitHub: https://github.com/Sky24n
 * @Description: Date Util.
 * @Date: 2018/9/8
 */

///
class DateUtil {
  ///get DateTime By DateStr.
  static DateTime getDateTime(String dateStr) {
    DateTime dateTime = DateTime.tryParse(dateStr);
    return dateTime;
  }

  ///get DateTime By Milliseconds.
  static DateTime getDateTimeByMilliseconds(int milliseconds,
      {bool isUtc: false}) {
    DateTime dateTime =
        new DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    return dateTime;
  }

  ///get DateMilliseconds By DateStr.
  static int getDateMillisecondsByTimeStr(String dateStr) {
    DateTime dateTime = DateTime.tryParse(dateStr);
    return dateTime == null ? null : dateTime.millisecondsSinceEpoch;
  }

  ///get Now Date Milliseconds.
  static int getNowDateMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  ///get Now Date Str.(yyyy-MM-dd HH:mm:ss)
  static String getNowDateStr() {
    return getDateStrByDateTime(DateTime.now());
  }

  ///get DateStr By DateStr.
  ///dateStr         date String.
  ///format          DateFormat type.
  ///dateSeparate    date separate.
  ///timeSeparate    time separate.
  static String getDateStrByTimeStr(
    String dateStr, {
    DateFormat format: DateFormat.NORMAL,
    String dateSeparate,
    String timeSeparate,
  }) {
    return getDateStrByDateTime(getDateTime(dateStr),
        format: format, dateSeparate: dateSeparate, timeSeparate: timeSeparate);
  }

  ///get DateStr By Milliseconds.
  ///milliseconds    milliseconds.
  ///format          DateFormat type.
  ///dateSeparate    date separate.
  ///timeSeparate    time separate.
  static String getDateStrByMilliseconds(int milliseconds,
      {DateFormat format: DateFormat.NORMAL,
      String dateSeparate,
      String timeSeparate,
      bool isUtc: false}) {
    DateTime dateTime = getDateTimeByMilliseconds(milliseconds, isUtc: isUtc);
    return getDateStrByDateTime(dateTime,
        format: format, dateSeparate: dateSeparate, timeSeparate: timeSeparate);
  }

  ///get DateStr By DateTime.
  ///dateTime        dateTime.
  ///format          DateFormat type.
  ///dateSeparate    date separate.
  ///timeSeparate    time separate.
  static String getDateStrByDateTime(DateTime dateTime,
      {DateFormat format: DateFormat.NORMAL,
      String dateSeparate,
      String timeSeparate}) {
    if (dateTime == null) return null;
    String dateStr = dateTime.toString();
    if (isZHFormat(format)) {
      dateStr = formatZHDateTime(dateStr, format, timeSeparate);
    } else {
      dateStr = formatDateTime(dateStr, format, dateSeparate, timeSeparate);
    }
    return dateStr;
  }

  ///format ZH DateTime.
  ///time            time string.
  ///format          DateFormat type.
  ///timeSeparate    time separate.
  static String formatZHDateTime(
      String time, DateFormat format, String timeSeparate) {
    time = convertToZHDateTimeString(time, timeSeparate);
    switch (format) {
      case DateFormat.ZH_NORMAL: //yyyy年MM月dd日 HH时mm分ss秒
        time = time.substring(
            0,
            "yyyy年MM月dd日 HH时mm分ss秒".length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE: //yyyy年MM月dd日 HH时mm分
        time = time.substring(
            0,
            "yyyy年MM月dd日 HH时mm分".length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.ZH_YEAR_MONTH_DAY: //yyyy年MM月dd日
        time = time.substring(0, "yyyy年MM月dd日".length);
        break;
      case DateFormat.ZH_YEAR_MONTH: //yyyy年MM月
        time = time.substring(0, "yyyy年MM月".length);
        break;
      case DateFormat.ZH_MONTH_DAY: //MM月dd日
        time = time.substring("yyyy年".length, "yyyy年MM月dd日".length);
        break;
      case DateFormat.ZH_MONTH_DAY_HOUR_MINUTE: //MM月dd日 HH时mm分
        time = time.substring(
            "yyyy年".length,
            "yyyy年MM月dd日 HH时mm分".length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.ZH_HOUR_MINUTE_SECOND: //HH时mm分ss秒
        time = time.substring(
            "yyyy年MM月dd日 ".length,
            "yyyy年MM月dd日 HH时mm分ss秒".length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.ZH_HOUR_MINUTE: //HH时mm分
        time = time.substring(
            "yyyy年MM月dd日 ".length,
            "yyyy年MM月dd日 HH时mm分".length -
                (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      default:
        break;
    }
    return time;
  }

  ///format DateTime.
  ///time            time string.
  ///format          DateFormat type.
  ///dateSeparate    date separate.
  ///timeSeparate    time separate.
  static String formatDateTime(String time, DateFormat format,
      String dateSeparate, String timeSeparate) {
    switch (format) {
      case DateFormat.NORMAL: //yyyy-MM-dd HH:mm:ss
        time = time.substring(0, "yyyy-MM-dd HH:mm:ss".length);
        break;
      case DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE: //yyyy-MM-dd HH:mm
        time = time.substring(0, "yyyy-MM-dd HH:mm".length);
        break;
      case DateFormat.YEAR_MONTH_DAY: //yyyy-MM-dd
        time = time.substring(0, "yyyy-MM-dd".length);
        break;
      case DateFormat.YEAR_MONTH: //yyyy-MM
        time = time.substring(0, "yyyy-MM".length);
        break;
      case DateFormat.MONTH_DAY: //MM-dd
        time = time.substring("yyyy-".length, "yyyy-MM-dd".length);
        break;
      case DateFormat.MONTH_DAY_HOUR_MINUTE: //MM-dd HH:mm
        time = time.substring("yyyy-".length, "yyyy-MM-dd HH:mm".length);
        break;
      case DateFormat.HOUR_MINUTE_SECOND: //HH:mm:ss
        time =
            time.substring("yyyy-MM-dd ".length, "yyyy-MM-dd HH:mm:ss".length);
        break;
      case DateFormat.HOUR_MINUTE: //HH:mm
        time = time.substring("yyyy-MM-dd ".length, "yyyy-MM-dd HH:mm".length);
        break;
      default:
        break;
    }
    time = dateTimeSeparate(time, dateSeparate, timeSeparate);
    return time;
  }

  ///is format to ZH DateTime String
  static bool isZHFormat(DateFormat format) {
    return format == DateFormat.ZH_DEFAULT ||
        format == DateFormat.ZH_NORMAL ||
        format == DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE ||
        format == DateFormat.ZH_YEAR_MONTH_DAY ||
        format == DateFormat.ZH_YEAR_MONTH ||
        format == DateFormat.ZH_MONTH_DAY ||
        format == DateFormat.ZH_MONTH_DAY_HOUR_MINUTE ||
        format == DateFormat.ZH_HOUR_MINUTE_SECOND ||
        format == DateFormat.ZH_HOUR_MINUTE;
  }

  ///convert To ZH DateTime String
  static String convertToZHDateTimeString(String time, String timeSeparate) {
    time = time.replaceFirst("-", "年");
    time = time.replaceFirst("-", "月");
    time = time.replaceFirst(" ", "日 ");
    if (timeSeparate == null || timeSeparate.isEmpty) {
      time = time.replaceFirst(":", "时");
      time = time.replaceFirst(":", "分");
      time = time.replaceFirst(".", "秒");
      time = time + "毫秒";
    } else {
      time = time.replaceAll(":", timeSeparate);
    }
    return time;
  }

  ///date Time Separate.
  static String dateTimeSeparate(
      String time, String dateSeparate, String timeSeparate) {
    if (dateSeparate != null) {
      time = time.replaceAll("-", dateSeparate);
    }
    if (timeSeparate != null) {
      time = time.replaceAll(":", timeSeparate);
    }
    return time;
  }

  ///get WeekDay By Milliseconds.
  static String getWeekDayByMilliseconds(int milliseconds,
      {bool isUtc: false}) {
    DateTime dateTime = getDateTimeByMilliseconds(milliseconds, isUtc: isUtc);
    return getWeekDay(dateTime);
  }

  ///get ZH WeekDay By Milliseconds.
  static String getZHWeekDayByMilliseconds(int milliseconds,
      {bool isUtc: false}) {
    DateTime dateTime = getDateTimeByMilliseconds(milliseconds, isUtc: isUtc);
    return getZHWeekDay(dateTime);
  }

  ///get WeekDay.
  static String getWeekDay(DateTime dateTime) {
    if (dateTime == null) return null;
    String weekday;
    switch (dateTime.weekday) {
      case 1:
        weekday = "Monday";
        break;
      case 2:
        weekday = "Tuesday";
        break;
      case 3:
        weekday = "Wednesday";
        break;
      case 4:
        weekday = "Thursday";
        break;
      case 5:
        weekday = "Friday";
        break;
      case 6:
        weekday = "Saturday";
        break;
      case 7:
        weekday = "Sunday";
        break;
      default:
        break;
    }
    return weekday;
  }

  ///get ZH WeekDay.
  static String getZHWeekDay(DateTime dateTime) {
    if (dateTime == null) return null;
    String weekday;
    switch (dateTime.weekday) {
      case 1:
        weekday = "星期一";
        break;
      case 2:
        weekday = "星期二";
        break;
      case 3:
        weekday = "星期三";
        break;
      case 4:
        weekday = "星期四";
        break;
      case 5:
        weekday = "星期五";
        break;
      case 6:
        weekday = "星期六";
        break;
      case 7:
        weekday = "星期日";
        break;
      default:
        break;
    }
    return weekday;
  }

  ///Return whether it is leap year.
  static bool isLeapYearByDateTime(DateTime dateTime) {
    return isLeapYearByYear(dateTime.year);
  }

  ///Return whether it is leap year.
  static bool isLeapYearByYear(int year) {
    return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
  }
}
