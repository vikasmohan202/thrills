import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trills/callHelper.dart';
import 'package:trills/urls.dart';

class MatchesAPI {
  Future<ApiResponseWithData> getMatches() async {
    String token = URLS.token;
    var url = Uri.parse(URLS.getIncomingRequests);
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
}
