import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = '454a189d6437929fb747902023850ab5';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var latitude;
  var longitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var data = await networkHelper.getData();
    // if(data){
      print(data['main']['temp']);
    // }
    // var longitude = decodedJson['coord']['lon'];
    // var latitude = decodedJson['coord']['lon'];
    // var cityName = decodedJson['name'];
    // var temperature = jsonDecode(data)['main']['temp'];
    // print(url);
    // print('city name = $cityName , $temperature');
    // print(longitude);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocationData();
            //Get the current location
          },
          child: Text('Get'),
        ),
      ),
    );
  }
}

