import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trills/model/post_model.dart';
import 'package:trills/urls.dart';
import 'package:trills/util/toast.dart';

class PostAPI {
  addPost(Post post) async {
    String token = URLS.token;
    var url = Uri.parse(URLS.addPost);
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(post.toMap()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      toast("Post successful");
      return true;
    } else {
      toast("Post Failed");
    }
    return false;
  }
}
