import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({@required this.url});
  final String url;

  Future getData() async {
    print("[NetworkHelper][getData] => (this.url): " + this.url);

    http.Response response = await http.get(url);

    print("[NetworkHelper][getData] => (response.statusCode): " +
        response.statusCode.toString());

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
