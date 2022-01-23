import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'package:clima/api/api.dart';

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

  // APIのデータを取得
  void getData() async {
    Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$API_KEY'));
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
    );
  }
}
