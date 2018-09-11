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
  List<ItemModel> mItemList = new List();

  @override
  void initState() {
    super.initState();
    mItemList.add(new ItemModel("Regex Util"));
    mItemList.add(new ItemModel("Widget Util"));
  }

  Widget buildItem(ItemModel model) {
    return new InkWell(
        onTap: () {
        },
        child: new Container(
            height: 50.0,
            child: new Center(
              child: new Text(
                model.title,
                style: new TextStyle(fontSize: 14.0, color: Color(0xFF666666)),
              ),
            ),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
                color: Colors.white,
                border:
                    new Border.all(width: 0.33, color: Color(0XFFEFEFEF)))));
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

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Common Utils'),
        centerTitle: true,
      ),
      body: new ListView.builder(
          shrinkWrap: true,
          itemCount: mItemList.length,
          itemBuilder: (BuildContext context, int index) {
            ItemModel model = mItemList[index];
            return buildItem(model);
          }),
      backgroundColor: Colors.white,
    );
  }
}

class ItemModel {
  String title;

  ItemModel(this.title);
}
