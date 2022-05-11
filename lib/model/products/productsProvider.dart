import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class ProductsProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';

  Future<dynamic> postProducts(
      String name,
      String shortDescription,
      String description,
      String status,
      String weight,
      String quantity,
      String price,
      String tax,
      File image,
      String brandName,
      String category,
      String size,
      String uom) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var formData = FormData.fromMap({
      'name': name,
      'short_description': shortDescription,
      'description': description,
      'status': status,
      'weight': weight,
      'qty': quantity,
      'price': price,
      'tax': tax,
      'main_image': image,
      'brand_name(id)': brandName,
      'category': category,
      'sizes': size,
      'uom': uom
    });

    print('Form Data $formData');

    final response = await Dio().post(
        'http://3.109.206.91:8000/api/vendor/product/',
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        }));
    print('Response from Dio $response');

    return response;
  }

  Future<void> getProducts() async {}

  Future<dynamic> putProducts(
      String name,
      String shortDescription,
      String description,
      String status,
      String weight,
      String quantity,
      String price,
      String tax,
      File image,
      String brandName,
      String category,
      String size,
      String uom) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var formData = FormData.fromMap({
      'name': name,
      'short_description': shortDescription,
      'description': description,
      'status': status,
      'weight': weight,
      'qty': quantity,
      'price': price,
      'tax': tax,
      'main_image': image,
      'brand_name(id)': brandName,
      'category': category,
      'sizes': size,
      'uom': uom
    });

    print('Form Data $formData');

    final response = await Dio().put(
        'http://3.109.206.91:8000/api/vendor/product/',
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        }));
    print('Response from Dio $response');

    return response;
  }

  Future<void> deleteProduct(String id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/vendor/product/$id');
    final response = await http.delete(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    print('Delete response: ${response.body}');
  }
}
