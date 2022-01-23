import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/api/api.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

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

    latitude = location.latitude;
    longitude = location.longitude;

    // 非同期で取得
    NetWorkHelper networkHelper = NetWorkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$API_KEY');
  }

  // APIのデータを取得
  void getData() async {

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(temperature);
      print(condition);
      print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}