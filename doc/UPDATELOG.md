## 更新说明  
v1.1.2 (2019.07.08) 暂未发布到pub。   
1、新增TextUtil 银行卡号每隔4位加空格，每隔3三位加逗号，隐藏手机号等等.   
2、新增EnDecodeUtil md5加密，Base64加/解密.   
3、DateUtil 新增日期格式化，支持自定义格式输出。  
4、LogUtil 支持输出超长log。  
5、RegexUtil 支持199号段。
```dart
/// DateUtil
DateUtil.formatDateMs(DateTime.now().millisecondsSinceEpoch, format: DataFormats.full); // 2019-07-09 16:51:14
DateUtil.formatDateStr("2019-07-09 16:51:14", format: "yyyy/M/d HH:mm:ss"); // 2019/7/9 16:51:14
DateUtil.formatDate(DateTime.now(), format: "yyyy/MM/dd HH:mm:ss");  // 2019/07/09 16:51:14
  
/// TextUtil
String phoneNo = TextUtil.formatSpace4("15845678910"); // 1584 5678 910
String num     = TextUtil.formatComma3("1234"); // 123,4
String phoneNo = TextUtil.hidePhone("15845678910")// 158****8910

```
(2018.10.31)  
NumUtil更新, 精确加、减、乘、除, 防止精度丢失.  
MoneyUtil更新, 精确转换, 防止精度丢失.  
  
common_utils库不再有平台限制.  
WidgetUtil,ScreenUtil迁移至[flustars][flustars_github]库。


## Flutter工具类库[flustars][flustars_github]更新说明
#### v0.1.8(2018.12.29)   
ScreenUtil 屏幕适配更新。  
方案一、不依赖context
```
步骤 1
//如果设计稿尺寸默认配置一致，无需该设置。  配置设计稿尺寸 默认 360.0 / 640.0 / 3.0
setDesignWHD(_designW,_designH,_designD);  
  
步骤 2
// 在MainPageState build 调用MediaQuery.of(context)
class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
  
    // 在 MainPageState build 调用 MediaQuery.of(context)
    MediaQuery.of(context);
    
    double width = ScreenUtil.getInstance().screenWidth;
    double height = ScreenUtil.getInstance().screenHeight;
    return new Scaffold(
      appBar: new AppBar(),
    );
  }
}  
  
步骤 3
ScreenUtil.getInstance().screenWidth
ScreenUtil.getInstance().screenHeight
ScreenUtil.getInstance().screenDensity
ScreenUtil.getInstance().statusBarHeight
ScreenUtil.getInstance().bottomBarHeight
//屏幕适配相关  
ScreenUtil.getInstance().getWidth(size); //返回根据屏幕宽适配后尺寸（单位 dp or pt）
ScreenUtil.getInstance().getHeight(size); //返回根据屏幕高适配后尺寸 （单位 dp or pt）
ScreenUtil.getInstance().getWidthPx(sizePx); //sizePx 单位px
ScreenUtil.getInstance().getHeightPx(sizePx); //sizePx 单位px
ScreenUtil.getInstance().getSp(fontSize); //返回根据屏幕宽适配后字体尺寸

```
方案二、依赖context
```
//如果设计稿尺寸默认配置一致，无需该设置。  配置设计稿尺寸 默认 360.0 / 640.0 / 3.0
setDesignWHD(_designW,_designH,_designD);  

ScreenUtil.getScreenW(context); //屏幕 宽
ScreenUtil.getScreenH(context); //屏幕 高
ScreenUtil.getScreenDensity(context); //屏幕 像素密度
ScreenUtil.getStatusBarH(context); //状态栏高度
ScreenUtil.getBottomBarH(context); //bottombar 高度
//屏幕适配相关  
ScreenUtil.getScaleW(context, size); //返回根据屏幕宽适配后尺寸（单位 dp or pt）
ScreenUtil.getScaleH(context, size); //返回根据屏幕高适配后尺寸 （单位 dp or pt）
ScreenUtil.getScaleSp(context, size) ;//返回根据屏幕宽适配后字体尺寸
```
#### v0.1.6(2018.12.20)  
新增网络请求工具DioUtil, 单例模式，可输出请求日志。详细请求+解析请参考[flutter_wanandroid][flutter_wanandroid_github]项目。
```
// 打开debug模式.
DioUtil.openDebug(); 

// 配置网络参数.
Options options = DioUtil.getDefOptions();
options.baseUrl = "http://www.wanandroid.com/";
HttpConfig config = new HttpConfig(options: options);
DioUtil().setConfig(config);
  
// 两种单例请求方式.
DioUtil().request<List>(Method.get, "banner/json");
DioUtil.getInstance().request(Method.get, "banner/json");
  
//示例
LoginReq req = new LoginReq('username', 'password');
DioUtil().request(Method.post, "user/login",data: req.toJson());
  
//示例
FormData formData = new FormData.from({
      "username": "username",
      "password": "password",
    });
DioUtil().requestR(Method.post, "user/login",data: rformData);
  
// 网络请求日志  
I/flutter ( 5922): ----------------Http Log----------------
I/flutter ( 5922): [statusCode]:   200
I/flutter ( 5922): [request   ]:   method: GET  baseUrl: http://www.wanandroid.com/  path: lg/collect/list/0/json
I/flutter ( 5922): [reqdata   ]:   null
I/flutter ( 5922): [response  ]:   {data: {curPage: 1, datas: [], offset: 0, over: true, pageCount: 0, size: 20, total: 0}, errorCode: 0, errorMsg: }
```

#### v0.1.5(2018.12.14)  
ScreenUtil 新增屏幕适配，不依赖context。
```
//如果设计稿尺寸默认配置一致，无需该设置。  配置设计稿尺寸 默认 360.0 / 640.0 / 3.0
setDesignWHD(_designW,_designH,_designD);

//返回根据屏幕宽适配后尺寸（单位 dp or pt）
ScreenUtil.getInstance().getWidth(100.0);  

//返回根据屏幕高适配后尺寸（单位 dp or pt）
ScreenUtil.getInstance().getHeight(100.0); 

//返回根据屏幕宽适配后字体尺寸
ScreenUtil.getInstance().getSp(12.0); 
```




[flutter_wanandroid_github]: https://github.com/Sky24n/flutter_wanandroid
[common_utils_github]: https://github.com/Sky24n/common_utils
[flustars_github]: https://github.com/Sky24n/flustars