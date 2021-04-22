import 'dart:convert';
import 'package:testing/global.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const platform = const MethodChannel('io.getstream/backend');
  // String _baseUrl =
  //     'http://$url:5000/'; // android only, for both platforms use something like: https://ngrok.com/

  Future<String> stat() async {
    var response = await http.get(Uri.parse('http://$url:5000/get_stat'));

    return json.decode(response.body)['data'];
  }
}
