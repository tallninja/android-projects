import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/models/location_model.dart';

Future<Location> getLocation() async {
  bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
  Position position;

  if (!locationServiceEnabled) {
    return Future.error('Location services are disabled.');
  }

  LocationPermission locationPermission = await Geolocator.checkPermission();

  if (locationPermission == LocationPermission.denied) {
    locationPermission = await Geolocator.requestPermission();
    if (locationPermission == LocationPermission.denied) {
      return Future.error('Location permisions are denied.');
    }
  }

  if (locationPermission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.low,
  );

  return Location(
    latitude: position.latitude,
    longitude: position.longitude,
  );
}
