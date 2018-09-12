# common_utils (Flutter common utils library)

[![Pub](https://img.shields.io/pub/v/common_utils.svg?style=flat-square)](https://pub.dartlang.org/packages/common_utils)

[common_utils]  is a common tools library for Flutter.
Contains ScreenUtil, RegexUtil, ObjectUtil, WidgetUtil.

[Example --> SimpleProject/示例工程](https://github.com/Sky24n/flutter_demos) https://github.com/Sky24n/flutter_demos


### Add dependency

```yaml
dependencies:
  common_utils: x.x.x  #latest version
```

### APIs

* #### ScreenUtil
```
screenWidth
screenHeight
screenDensity
appBarHeight
statusBarHeight
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

//Widgets must be rendered completely. Otherwise return Offset.zero.
Rect rect = WidgetUtil.getWidgetBounds(context);
double width = rect.width;
double height = rect.height;

//Widgets must be rendered completely. Otherwise return Offset.zero.
Offset offset = WidgetUtil.getWidgetLocalToGlobal(context);
double dx = offset.dx  
double dx = offset.dy
```





