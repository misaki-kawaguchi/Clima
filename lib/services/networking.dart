import 'package:http/http.dart' as http;
import 'dart:convert';

class NetWorkHelper {

  NetWorkHelper(this.url);

  final String url;

  // データを非同期で取得する
  void getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}