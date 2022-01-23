import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/api/api.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // 現在の位置を取得
  // async await：時間のかかるタスクを実行できるようにするための方法
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    // NetWorkHelperクラスを代入
    NetWorkHelper networkHelper = NetWorkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$API_KEY&units=metric');

    // 非同期でJSONデータを取得
    var weatherData = await networkHelper.getData();

    // location_screenページに遷移する
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
