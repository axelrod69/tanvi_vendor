import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ProfileProvider with ChangeNotifier {
  String baseUrl = 'http://54.80.135.220/';
  Map<String, dynamic> _profile = {};

  Map<String, dynamic> get profile {
    return {..._profile};
  }

  Future<void> fetchProfileDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/vendor/profile/basic/');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    _profile = json.decode(response.body);

    print(_profile);
  }

  Future<dynamic> postProfileUpdate(
      String? firstName,
      String? lastName,
      String? email,
      String? alternateEmail,
      String? mobileNo,
      File? image) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    print('Provider First Name $firstName');
    print('Provider Last Name $lastName');
    print('Provder Email $email');
    print('Provider Alternate Email $alternateEmail');
    print('Provider Mobile Number $mobileNo');

    var formData = FormData.fromMap({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'alternate_email': alternateEmail,
      'mobile': mobileNo,
      'profile_pic': await MultipartFile.fromFile(
        image!.path,
        // contentType: MediaType("image", "jpeg")
      )
    });

    print('Form Data: $formData');

    final response = await Dio().post(
        'http://54.80.135.220/api/vendor/profile/basic/',
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        }));

    print('Response from Dio $response');

    return response;
  }
}
