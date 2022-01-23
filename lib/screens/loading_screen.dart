import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {

    String myMargin = 'abc';
    double myMarginAsDouble;

    try {
      myMarginAsDouble = double.parse(myMargin);
    }
    catch(e) {
      print(e);
      myMarginAsDouble = 30.0;
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsDouble),
        color: Colors.red,

      ),
    );
  }
}
