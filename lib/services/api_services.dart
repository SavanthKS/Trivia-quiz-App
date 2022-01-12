import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_app/modals/data_model.dart';

class ApiServices {
  static Future<DataModel?> getData(String url) async {
    late http.Response response;
    try {
      response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return DataModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
