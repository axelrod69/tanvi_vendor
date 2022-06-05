import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MonthlyStatsProvider with ChangeNotifier {
  String baseUrl = 'http://54.80.135.220/';
  Map<String, dynamic> _stats = {};

  Map<String, dynamic> get stats {
    return {..._stats};
  }

  Future<void> getStats() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/vendor/business-summary/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
    });

    var res = json.decode(response.body);

    _stats = res;

    print('Monthly Stats: $_stats');
  }
}
