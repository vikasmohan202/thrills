import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trills/urls.dart';

class ProfileDetailAPI {
  Future<bool> addDetails(String name, String DOB) async {
    var url = Uri.parse(URLS.updateUserData);
    print(url);
    String token = URLS.token;
    var response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      },
      body: json.encode({
        "name": name,
        "DOB": DOB,
      }),
    );
    print(response.statusCode);
    print(response.body);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // await Auth().setToken(data['token']);
      return true;
    }
    return false;
  }

  Future<bool> addGender(String gender) async {
    var url = Uri.parse(URLS.updateUserData);
    print(url);
    String token = URLS.token;
    var response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      },
      body: json.encode({"gender": gender}),
    );
    print(response.statusCode);
    print(response.body);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // await Auth().setToken(data['token']);
      return true;
    }
    return false;
  }

  Future<bool> addInterests(List interests) async {
    var url = Uri.parse(URLS.updateUserData);
    print(url);
    String token = URLS.token;
    var response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      },
      body: json.encode({"interests": interests}),
    );
    print(response.statusCode);
    print(response.body);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // await Auth().setToken(data['token']);
      return true;
    }
    return false;
  }
}
