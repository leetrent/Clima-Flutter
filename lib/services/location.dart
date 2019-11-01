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

      print(
          "[Location][getCurrentLocation] => (position.latitude.toString()).: " +
              position.latitude.toString());
      print(
          "[Location][getCurrentLocation] => (position.longitude.toString()): " +
              position.longitude.toString());

      this.latitude = position.latitude;
      this.longitude = position.longitude;

      print("[Location][getCurrentLocation] => (this.latitude.toString()).: " +
          this.latitude.toString());
      print(this.latitude);

      print("[Location][getCurrentLocation] => (this.longitude.toString()).: " +
          this.longitude.toString());
      print(this.longitude);
    } catch (exc) {
      print(exc);
    }
    print("[Location][getCurrentLocation] => END");
  }
}
