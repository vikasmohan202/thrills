import 'package:geolocator/geolocator.dart';

class getLocationAPI {
  bool servicestatus = false;
  bool haspermission = false;
  late Position position;
  late LocationPermission permission;
  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (!servicestatus) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // await Geolocator.openLocationSettings();
      permission = await Geolocator.requestPermission();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      } else if (permission == LocationPermission.deniedForever) {
        print("'Location permissions are permanently denied");
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }
  }
  // if(haspermission){

  //     getLocation();
  // }
  // return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  getLocation() async {
    checkGps();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    // double long = position.longitude;
    // lat = position.latitude.toString();

    // setState(() {
    //    //refresh UI
    // });

    // LocationSettings locationSettings = LocationSettings(
    //       accuracy: LocationAccuracy.high, //accuracy of the location data
    //       distanceFilter: 100, //minimum distance (measured in meters) a
    //                            //device must move horizontally before an update event is generated;
    // );
    // print(position.longitude);
    return position;
  }
}
