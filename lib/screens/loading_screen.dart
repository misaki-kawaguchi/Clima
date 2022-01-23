import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  // 現在の位置を取得
  // async await：時間のかかるタスクを実行できるようにするための方法
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {

    String myMargin = '15';
    double myMarginAsDouble;

    try {
      myMarginAsDouble = double.parse(myMargin);
    }
    catch(e) {
      print(e);
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsDouble ?? 30.0),
        color: Colors.red,

      ),
    );
  }
}
