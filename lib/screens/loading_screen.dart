import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
