import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    print("[Location][getCurrentLocation] => BEGIN");
    try {
      print(
          "[Location][getCurrentLocation] => Calling Geolocator.getCurrentPosition()");
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(
          "[Location][getCurrentLocation] => Returning Geolocator.getCurrentPosition()");
      this.latitude = position.latitude;
      this.longitude = position.longitude;
      print(this.latitude);
      print(this.longitude);
    } catch (exc) {
      print(exc);
    }
    print("[Location][getCurrentLocation] => END");
  }
}
