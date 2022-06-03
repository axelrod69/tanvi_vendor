import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import './businessProfileModel.dart';

class BusinessProfileProvider with ChangeNotifier {
  String baseUrl = 'http://54.80.135.220:8000/';
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

    // BusinessProfile businessProfile = businessProfileFromJson(response.body);

    // _businessProfile = businessProfile.toJson();

    var res = json.decode(response.body);

    _businessProfile = res;

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

    final response = await Dio()
        .post('http://54.80.135.220:8000/api/vendor/profile/business/',
            data: formData,
            options: Options(headers: {
              'Authorization': 'Bearer ${localStorage.getString('token')}',
              'Content-Type': 'application/json'
            }));
    print('Response from Dio $response');

    return response;
  }

  Future<void> postMethod(
      String? organizationName,
      String? telephoneNumberOne,
      String? telephoneNumberTwo,
      String? companyPanCard,
      File? panCard,
      String? aadharUdyamUdoyog,
      File? aadharCard,
      String? gstNumber) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // final File filePanCard = File(panCard!.path.toString());
    // final File fileAadharCard = File(aadharCard!.path.toString());
    final url = Uri.parse(baseUrl + 'api/vendor/profile/business/');
    var request = http.MultipartRequest('POST', url);
    request.headers
        .addAll({'Authorization': 'Bearer ${localStorage.getString('token')}'});
    request.fields['org_name'] = organizationName!;
    request.fields['telephone_1'] = telephoneNumberOne!;
    request.fields['telephone_2'] = telephoneNumberTwo!;
    request.fields['company_pancard'] = companyPanCard!;
    request.files.add(await http.MultipartFile.fromPath(
        'company_pancard_doc', panCard!.path));
    request.files.add(await http.MultipartFile.fromPath(
        'adhar_udyam_udoyog', aadharCard!.path));

    // request.files.add(http.MultipartFile.fromBytes(
    //     'company_pancard_doc', File(panCard!.toString()).readAsBytesSync()));
    // request.fields['adhar_udyam_udoyog'] = aadharUdyamUdoyog!;
    // request.files.add(http.MultipartFile.fromBytes('adhar_udyam_udoyog_doc',
    //     File(aadharCard!.toString()).readAsBytesSync()));

    request.fields['gst_number'] = gstNumber!;

    var response = await request.send();

    print('Response: $response');

    if (response.statusCode == 200) {
      print('Uploaded');
    } else {
      print('Failed');
    }
  }
}
