import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import './productsModel.dart';

class ProductsProvider with ChangeNotifier {
  String baseUrl = 'http://54.80.135.220/';
  Map<String, dynamic> _vendorProducts = {};

  Map<String, dynamic> get vendorProducts {
    return {..._vendorProducts};
  }

  Future<dynamic> postProducts(
      String? name,
      String? shortDescription,
      String? description,
      String? status,
      String? weight,
      String? quantity,
      String? price,
      String? tax,
      File? image,
      String? category,
      String? size,
      String? uom) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    print('name $name');
    print('shortDescription $shortDescription');
    print('description $description');
    print('status $status');
    print('weight $weight');
    print('quantity $quantity');
    print('price $price');
    print('tax $tax');
    print('image $image');
    print('category $category');
    print('size $size');
    print('uom $uom');

    var formData = FormData.fromMap({
      'name': name,
      'short_description': shortDescription,
      'description': description,
      'status': status == 'Available' ? 'in_stock' : 'out_of_stock',
      'weight': weight,
      'qty': quantity,
      'price': price,
      'tax': tax,
      'main_image': await MultipartFile.fromFile(image!.path),
      'brand_name': 1,
      'category': category,
      'sizes': size,
      'uom': uom
    });

    print('Form Data $formData');

    final response = await Dio().post(
        'http://54.80.135.220/api/vendor/product/',
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        }));
    print('Response from Dio $response');

    return response;
  }

  Future<void> getProducts() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/vendor/product/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });
    // ProductsModel productsModel = productsModelFromJson(response.body);
    // _vendorProducts = productsModel.toJson();
    // print('Vendor Products: $_vendorProducts');
    _vendorProducts = json.decode(response.body);
    print('Vendor Products: $_vendorProducts');
  }

  Future<dynamic> putProducts(
      String? id,
      String? name,
      String? shortDescription,
      String? description,
      String? status,
      String? weight,
      String? quantity,
      String? price,
      String? tax,
      File image,
      String? category,
      String? size,
      String? uom) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var formData;

    print('name $name');
    print('image $image');
    print('shortDescription $shortDescription');
    print('description $description');
    print('status $status');
    print('weight $weight');
    print('quantity $quantity');
    print('price $price');
    print('tax $tax');
    print('image $image');
    print('category $category');
    print('size $size');
    print('uom $uom');

    if (image == null) {
      formData = FormData.fromMap({
        'id': id,
        'name': name,
        'short_description': shortDescription,
        'description': description,
        'status': status == 'Available' ? 'in_stock' : 'out_of_stock',
        'weight': weight,
        'qty': quantity,
        'price': price,
        'tax': tax,
        // 'main_image': await MultipartFile.fromFile(image!.path),
        'brand_name': 1,
        'category': category,
        'sizes': size,
        'uom': uom
      });
    } else {
      formData = FormData.fromMap({
        'id': id,
        'name': name,
        'short_description': shortDescription,
        'description': description,
        'status': status == 'Available' ? 'in_stock' : 'out_of_stock',
        'weight': weight,
        'qty': quantity,
        'price': price,
        'tax': tax,
        'main_image': await MultipartFile.fromFile(image.path),
        'brand_name': 1,
        'category': category,
        'sizes': size,
        'uom': uom
      });
    }

    print('Form Data $formData');

    final response = await Dio().put('http://54.80.135.220/api/vendor/product/',
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        }));
    print('Response from Dio $response');

    return response;
  }

  Future<void> deleteProduct(String id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/vendor/product/');
    final response =
        await http.delete(url, body: json.encode({'id': id}), headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    print('Delete response: ${response.body}');
  }
}
