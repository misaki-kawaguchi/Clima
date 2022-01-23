import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;

  // 現在地を取得する
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e) {

    }
  }
}