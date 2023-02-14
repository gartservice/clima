import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);
  Future getData()async{
    // String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      String data = response.body;
      var decodedJson = jsonDecode(data);
      return decodedJson;

    } else {
      print(response.statusCode);
      return false;
      print(url);
    }
  }
}