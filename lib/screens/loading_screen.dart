import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

const String apiKey = '1c5cf4d1aa66327e028a1cae708b3532';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    print("[_LoadingScreenState][initState] => BEGIN");
    super.initState();
    getLocationData();
    print("[_LoadingScreenState][initState] => END");
  }

  void getLocationData() async {
    print("[_LoadingScreenState][getLocationData] => BEGIN");

    Location location = Location();
    await location.getCurrentLocation();

    print(
        "[_LoadingScreenState][getLocationData] => (this.latitude): ${location.latitude}");
    print(
        "[_LoadingScreenState][getLocationData] => (this.latitude.toString()).: " +
            location.latitude.toString());

    print(
        "[_LoadingScreenState][getLocationData] => (this.longitude): ${location.longitude}");
    print(
        "[_LoadingScreenState][getLocationData] => (this.longitude.toString()).: " +
            location.longitude.toString());

    String openWeatherMapUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=$location.latitude&lon=$location.longitude&appid=$apiKey';

    print(
        "[_LoadingScreenState][getLocationData] => (openWeatherMapUrl): $openWeatherMapUrl");

    openWeatherMapUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${apiKey}';

    print(
        "[_LoadingScreenState][getLocationData] => (openWeatherMapUrl): $openWeatherMapUrl");

    openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=';
    openWeatherMapUrl += location.latitude.toString();
    openWeatherMapUrl += '&lon=';
    openWeatherMapUrl += location.longitude.toString();
    openWeatherMapUrl += '&appid=';
    openWeatherMapUrl += apiKey;
    openWeatherMapUrl += '&units=metric';

    print(
        "[_LoadingScreenState][getLocationData] => (openWeatherMapUrl): $openWeatherMapUrl");

    NetworkHelper networkHelper = NetworkHelper(url: openWeatherMapUrl);

    var weatherData = await networkHelper.getData();

    print(
        "[_LoadingScreenState][getLocationData] => (weatherData): $weatherData");

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
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
