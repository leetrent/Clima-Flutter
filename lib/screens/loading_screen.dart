import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    print("[LoadingScreen][initState] => BEGIN");
    super.initState();
    getLocation();
    print("[LoadingScreen][initState] => END");
  }

  void getLocation() async {
    print("[LoadingScreen][getLocation] => Instantiating location service");
    Location location = Location();
    print(
        "[LoadingScreen][getLocation] => Calling location service's getCurrentLocation()");
    await location.getCurrentLocation();
    print(
        "[LoadingScreen][getLocation] => Returning from call to location service's getCurrentLocation()");
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    print("[LoadingScreen][getData] => Calling open weather map ...");
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    print("[LoadingScreen][getData] => Returning open weather map ...");
    if (response.statusCode == 200) {
      String data = response.body;
//      print(data);

      var decodedData = jsonDecode(data);

      double longitude = decodedData['coord']['lon'];
      print("[LoadingScreen][getData] => (longitude): $longitude");

      String weatherDesc = decodedData['weather'][0]['description'];
      print("[LoadingScreen][getData] => (weatherDesc): $weatherDesc");

      double temperature = decodedData['main']['temp'];
      print("[LoadingScreen][getData] => (temperature): $temperature");

      int condition = decodedData['weather'][0]['id'];
      print("[LoadingScreen][getData] => (condition): $condition");

      String city = decodedData['name'];
      print("[LoadingScreen][getData] => (city): $city");
    } else {
      print(response.statusCode);
    }
//    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
