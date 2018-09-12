import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:common_utils/common_utils.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _sampleUrl = "示例工程地址" +
      "\n" +
      "\n" +
      "Sample project url"
      "\n" +
      "\n" +
      "https://github.com/Sky24n/flutter_demos";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);

    print("ScreenUtil screenWidth: " +
        ScreenUtil.screenWidth.toString() +
        "   screenHeight: " +
        ScreenUtil.screenHeight.toString() +
        "   statusBarHeight: " +
        ScreenUtil.statusBarHeight.toString() +
        "   screenDensity: " +
        ScreenUtil.screenDensity.toString() +
        "");

    String ddd;
    print("Object is empty: " + ObjectUtil.isEmpty(ddd).toString());

    List listA = ["A", "B", "C"];
    List listB = ["A", "B", "C"];
    print("Two List Is Equal: " +
        ObjectUtil.twoListIsEqual(listA, listB).toString());
    DateTime dateTime = DateTime.parse("2012-02-27 13:27:00");
    print("DateTime: " +
        new DateTime.fromMillisecondsSinceEpoch(1536720535748).toString() +
        "\n" +
        "  parse: " +
        dateTime.toLocal().toString());

    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Common Utils'),
          centerTitle: true,
        ),
        body: new Center(
          child: new Text(
            _sampleUrl,
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 16.0,color: Colors.blue),
          ),
        ));
  }
}
