import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trills/urls.dart';

import '../../location_api.dart';

class LoginAPI {
  Future<dynamic> login(String phone, String otp) async {
    // var response = await Dio()
    //     .post(URLS.loginURL, data: {"phone": phone, "otp": password});
    print(phone);
    print(otp);
    var url = Uri.parse(URLS.validateOTP);
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "phone_number": "+91${phone}",
          "otp": otp,
        }));
    print(response.statusCode);
    print(response.body);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      print(data['token']);
      // await Auth().setToken(data['token']);
      return true;
    }
    return false;
  }

  Future register(String phone, String name) async {
    // Dio dio = Dio();
    // dio.options.headers['content-Type'] = 'application/json';

    var location = await getLocationAPI().getLocation();
    location = json.decode(location);

    print(location);
// //  = location.latitude;
// //    location.longitude;

    print(json.encode({
      'name': name,
      'phone_number': "+91" + phone,
      "location": {
        "longitude": location.longitude,
        "lattitude": location.latitude
      },
    }));
    var url = Uri.parse(URLS.registerUser);
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'phone_number': "+91" + phone,
          'location': {'longitude': 18.622836, 'lattitude': 73.808684},
          'name': name,
        }));

    print(response.statusCode);

    if (json.decode(response.body)['status'] == 201) {
      return true;
    }
    return false;
  }

  Future<void> sendOTP(String phone) async {
    // print('send otp');
    // // print(phone);
    // print(
    //   URLS.genrateURL + "+91" + phone,

    var response = await http.get(
      Uri.parse(URLS.generateOTP + "+91" + phone),
    );

    print(response.body);

    // return response.data;
  }
}
