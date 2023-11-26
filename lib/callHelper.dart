import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;



class ApiResponse {
  final String message;
  final bool success;

  ApiResponse(this.message, this.success);
}

class ApiResponseWithData<T> {
  final T data;
  final bool success;
  final String message;

  ApiResponseWithData(this.data, this.success, {this.message = "none"});
}


