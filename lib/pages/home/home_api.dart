import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trills/urls.dart';

class HomeAPI {
  getAllPosts() async {
    var url = Uri.parse(URLS.getAllPosts);
    print(url);
    String token = URLS.token;
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      },
    );

    return json.decode(response.body);
  }

  sendUserRequest(String id) async {
    var url = Uri.parse(URLS.sendUserRequest);
    print(url);
    String token = URLS.token;
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}'
        },
        body: json.encode({
          "kind": "CONNECTION",
          "description": "Hey i want to connec with you ",
          "to": id
        }));
    print(response.body);
    return json.decode(response.body);
  }

  likeThePOst(String id) async {
    var url = Uri.parse(URLS.likePost + id);
    print(url);
    String token = URLS.token;

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      },
    );

    return json.decode(response.body);
  }
}
