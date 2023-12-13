import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trills/callHelper.dart';
import 'package:trills/urls.dart';

class MessageApi {
  Future<ApiResponseWithData> getChatUser(String uid) async {
    String token = URLS.token;
    var url = Uri.parse(URLS.getChatMessages + '${uid}');
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    print(response.body);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // print();
      // await Auth().setToken(data['token']);
      return ApiResponseWithData(data, true);
    }
    return ApiResponseWithData(data, false);
  }

  Future<ApiResponseWithData> getChatMessages(String uid) async {
    String token = URLS.token;
    var url = Uri.parse(URLS.getChatMessages + '${uid}');
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    print(response.body);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // print();
      // await Auth().setToken(data['token']);
      return ApiResponseWithData(data, true);
    }
    return ApiResponseWithData(data, false);
  }

  Future<ApiResponseWithData> sendMessages(String message) async {
    String token = URLS.token;
    var url = Uri.parse(URLS.sendMessage);

    var response = await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "msg": message
    });
    print(response.statusCode);
    print(response.body);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // print();
      // await Auth().setToken(data['token']);
      return ApiResponseWithData(data, true);
    }
    return ApiResponseWithData(data, false);
  }
}
