import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import './businessProfileModel.dart';

class BusinessProfileProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  Map<String, dynamic> _bankDetails = {};
  Map<String, dynamic> _businessProfile = {};

  Map<String, dynamic> get bankDetails {
    return {..._bankDetails};
  }

  Map<String, dynamic> get businessProfile {
    return {..._businessProfile};
  }

  Future<void> getBusinessProfile() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/vendor/profile/business/');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    BusinessProfile businessProfile = businessProfileFromJson(response.body);

    _businessProfile = businessProfile.toJson();

    print('Business Profile $_businessProfile');
  }

  Future<void> getBankDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/vendor/profile/bank-details/');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    _bankDetails = json.decode(response.body);
    print(_bankDetails);
  }

  Future<void> postBankDetails(String? bankName, String? branchName,
      String? ifscCode, String? accountNumber) async {
    print('Bank Name $bankName');
    print('Branch Name $branchName');
    print('IFSC $ifscCode');
    print('Account Number $accountNumber');

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/vendor/profile/bank-details/');

    final response = await http.post(url,
        body: json.encode({
          'acc_bank_name': bankName,
          'acc_branch_name': branchName,
          'acc_ifsc': ifscCode,
          'acc_no': accountNumber
        }),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        });

    print(json.decode(response.body));
  }

  Future<dynamic> postOrganisationDetails(
      String? organizationName,
      String? telephoneNumberOne,
      String? telephoneNumberTwo,
      String? companyPanCard,
      PlatformFile? panCard,
      String? aadharUdyamUdoyog,
      PlatformFile? aadharCard,
      String? gstNumber) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/vendor/profile/business/');

    var formData = FormData.fromMap({
      'org_name': organizationName,
      'telephone_1': telephoneNumberOne,
      'telephone_2': telephoneNumberTwo,
      'company_pancard': companyPanCard,
      'company_pancard_doc':
          await MultipartFile.fromFile(panCard!.path.toString()),
      'adhar_udyam_udoyog': aadharUdyamUdoyog,
      'adhar_udyam_udoyog_doc':
          await MultipartFile.fromFile(aadharCard!.path.toString()),
      'gst_number': gstNumber
    });

    print('Form Data $formData');

    final response = await Dio().post(
        'http://3.109.206.91:8000/api/vendor/profile/business/',
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        }));
    print('Response from Dio $response');

    return response;
  }
}
