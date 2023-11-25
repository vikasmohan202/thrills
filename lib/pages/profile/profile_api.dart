import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trills/urls.dart';


class ProfileAPI {

   getUserData() async {


    var url = Uri.parse(URLS.getUserData);
    String token = URLS.token;
    var response = await http.get(url, 
    headers:  {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }


  }
}
