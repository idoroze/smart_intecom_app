import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const platform = const MethodChannel('io.getstream/backend');
  static const _baseUrl =
      'http://192.168.1.203:5000/'; // android only, for both platforms use something like: https://ngrok.com/

  Future<String> stat() async {
    var response = await http.get(Uri.parse('$_baseUrl/get_stat'));

    return json.decode(response.body)['data'];
  }

}
