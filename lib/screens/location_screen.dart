import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({@required this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;

  @override
  void initState() {
    print("[_LocationScreenState][initState] => BEGIN");

    super.initState();
    this.updateUI(widget.locationWeather);

    print("[_LocationScreenState][initState] => END");
  }

  void updateUI(dynamic weatherData) {
    print("[_LocationScreenState][updateUI] => BEGIN");
    //this.temperature = weatherData['main']['temp'];

    double tempAsDouble = weatherData['main']['temp'];
    this.temperature = tempAsDouble.toInt();

    print("[_LocationScreenState][updateUI] => (this.temperature): " +
        this.temperature.toString());

    var condition = weatherData['weather'][0]['id'];
    this.weatherIcon = weather.getWeatherIcon(condition);

    print("[_LocationScreenState][updateUI] => (this.weatherIcon): " +
        this.weatherIcon);

    this.cityName = weatherData['name'];
    print("[_LocationScreenState][updateUI] => (this.cityName): " +
        this.cityName);

    print("[_LocationScreenState][updateUI] => END");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${this.temperature}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      this.weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
