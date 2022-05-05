import 'package:flutter/material.dart';
// import '../../model/profile/profileProvider.dart';
import 'package:provider/provider.dart';
import '../../../model/profile/businessProfileProvider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class EditProfile extends StatefulWidget {
  final String bankName;
  final String branchName;
  final String ifscCode;
  final String accountNumber;
  final String organisationName;
  final String telephoneOne;
  final String telephoneTwo;
  final String companyPancard;
  final String companyPancardDoc;
  final String aadharUdyog;
  final String aadharUdyogDoc;
  final String gstNumber;

  EditProfileState createState() => EditProfileState();

  EditProfile(
      this.bankName,
      this.branchName,
      this.ifscCode,
      this.accountNumber,
      this.organisationName,
      this.telephoneOne,
      this.telephoneTwo,
      this.companyPancard,
      this.companyPancardDoc,
      this.aadharUdyog,
      this.aadharUdyogDoc,
      this.gstNumber);
}

class EditProfileState extends State<EditProfile> {
  final key = GlobalKey<FormState>();
  // final _emailFocus = FocusNode();
  // final _mobileNoFocus = FocusNode();
  // final _addressFocus = FocusNode();
  // final _pincodeFocus = FocusNode();
  // final _passwordFocus = FocusNode();
  // final _confirmPasswordFocus = FocusNode();
  TextEditingController orgName = TextEditingController();
  TextEditingController telephoneNumberOne = TextEditingController();
  TextEditingController telephoneNumberTwo = TextEditingController();
  TextEditingController companyPanCard = TextEditingController();
  TextEditingController aadharUdyamUdoyog = TextEditingController();
  TextEditingController gstNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController branchName = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController accountNumber = TextEditingController();

  String? organisation;
  String? teleOne;
  String? teleTwo;
  String? panCard;
  String? aadharUdyom;
  String? gstNo;
  String? nameOfBank;
  String? nameOfBranch;
  String? ifsc;
  String? accountNo;
  PlatformFile? panDoc;
  PlatformFile? aadharDoc;

  String fileOneName = '';
  String fileTwoName = '';

  @override
  void dispose() {
    // TODO: implement dispose
    // _emailFocus.dispose();
    // _mobileNoFocus.dispose();
    // _addressFocus.dispose();
    // _pincodeFocus.dispose();
    // _passwordFocus.dispose();
    // _confirmPasswordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    // final provider = Provider.of<ProfileProvider>(context).profile;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
      child: Center(
        child: Form(
          key: key,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: orgName,
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Siddhartha Chatterjee',
                        label: Text(
                          'Organization Name',
                          // textScaleFactor: textScale,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    validator: (org) {
                      if (org!.isEmpty) {
                        return 'Please Enter Organisation Name';
                      } else {
                        organisation = org;
                        return null;
                      }
                    },
                  )),
              SizedBox(height: height * 0.02),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: telephoneNumberOne,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Siddhartha Chatterjee',
                        label: Text(
                          'Telephone Number 1',
                          // textScaleFactor: textScale,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    validator: (tele1) {
                      if (tele1!.isEmpty) {
                        return 'Please Enter Phone Number';
                      } else {
                        teleOne = tele1;
                      }
                    },
                  )),
              SizedBox(height: height * 0.02),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: telephoneNumberTwo,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Siddhartha Chatterjee',
                        label: Text(
                          'Telephone Number 2',
                          // textScaleFactor: textScale,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    validator: (tele2) {
                      if (tele2!.isEmpty) {
                        return 'Please Enter Phone Number';
                      } else {
                        teleTwo = tele2;
                      }
                    },
                  )),
              SizedBox(height: height * 0.02),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: companyPanCard,
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Siddhartha Chatterjee',
                        label: Text(
                          'Company Pan Card',
                          // textScaleFactor: textScale,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    validator: (pancard) {
                      if (pancard!.isEmpty) {
                        return 'Please Enter Pan Card Number';
                      } else {
                        panCard = panCard;
                      }
                    },
                  )),
              SizedBox(height: height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: height * 0.04,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        // Text('Upload Pan Card Document'),
                        InkWell(
                          onTap: () async {
                            final filePickerOne = await FilePicker.platform
                                .pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: [
                                  'pdf',
                                  'jpg',
                                  'jpeg',
                                  'png'
                                ]);
                            if (filePickerOne == null) return;

                            final fileOne = filePickerOne.files.first;
                            openFile(fileOne);
                            print('Name: ${fileOne.name}');

                            setState(() {
                              fileOneName = fileOne.name;
                              panDoc = fileOne;
                            });

                            print('Bytes: ${fileOne.bytes}');
                            print('Size: ${fileOne.size}');
                            print('Extension: ${fileOne.extension}');
                            print('Path: ${fileOne.path}');

                            final newFile = await saveFile(fileOne);

                            print('From Path: ${fileOne.path!}');
                            print('To Path: ${fileOne.path}');
                          },
                          child: Container(
                            width: width * 0.25,
                            height: height * 0.035,
                            margin: EdgeInsets.only(left: width * 0.02),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 36, 71, 100),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 8,
                                      offset: Offset(1, 2))
                                ]),
                            child: const Center(
                              child: Text('Upload Pan Card',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                          ),
                        ),
                        fileOneName.length == 0
                            ? const Text('No File Selected')
                            : Text(fileOneName)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.03),
                    child: const Text('PDF Only',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                  )
                ],
              ),
              SizedBox(height: height * 0.02),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    // autofocus: true,
                    controller: aadharUdyamUdoyog,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Aadhar Udyam Udoyog',
                          // textScaleFactor: textScale,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    validator: (aadhar) {
                      if (aadhar!.isEmpty) {
                        return 'Please Enter Aadhar';
                      } else {
                        aadharUdyom = aadhar;
                      }
                    },
                  )),
              SizedBox(height: height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: height * 0.04,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        // Text('Upload Pan Card Document'),
                        InkWell(
                          onTap: () async {
                            final filePickerTwo = await FilePicker.platform
                                .pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: [
                                  'pdf',
                                  'jpg',
                                  'jpeg',
                                  'png'
                                ]);
                            if (filePickerTwo == null) return;

                            final fileTwo = filePickerTwo.files.first;
                            openFile(fileTwo);
                            print('Name: ${fileTwo.name}');

                            setState(() {
                              fileTwoName = fileTwo.name;
                              aadharDoc = fileTwo;
                            });

                            print('Bytes: ${fileTwo.bytes}');
                            print('Size: ${fileTwo.size}');
                            print('Extension: ${fileTwo.extension}');
                            print('Path: ${fileTwo.path}');

                            final newFile = await saveFile(fileTwo);

                            print('From Path: ${fileTwo.path!}');
                            print('To Path: ${fileTwo.path}');
                          },
                          child: Container(
                            width: width * 0.25,
                            height: height * 0.035,
                            margin: EdgeInsets.only(left: width * 0.02),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 36, 71, 100),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 8,
                                      offset: Offset(1, 2))
                                ]),
                            child: const Center(
                              child: Text('Upload Aadhar Udyam Udoyog',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11)),
                            ),
                          ),
                        ),
                        fileTwoName.length == 0
                            ? const Text('No File Selected')
                            : Text(fileTwoName)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.03),
                    child: const Text('PDF Only',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                  )
                ],
              ),
              SizedBox(height: height * 0.02),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: gstNumber,
                    // autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'GST Number',
                          // textScaleFactor: textScale,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    validator: (gst) {
                      if (gst!.isEmpty) {
                        return 'Please Enter GST Number';
                      } else {
                        gstNo = gst;
                      }
                    },
                  )),
              SizedBox(height: height * 0.02),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    // autofocus: true,
                    controller: bankName,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Bank Name',
                          // textScaleFactor: textScale,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    validator: (nameBank) {
                      if (nameBank!.isEmpty) {
                        return 'Please Enter Bank Name';
                      } else {
                        nameOfBank = nameBank;
                        return null;
                      }
                    },
                  )),
              SizedBox(height: height * 0.02),
              Container(
                  width: double.infinity,
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: branchName,
                    // autofocus: true,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Branch Name',
                          // textScaleFactor: textScale,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    validator: (nameBranch) {
                      if (nameBranch!.isEmpty) {
                        return 'Please Enter Branch Name';
                      } else {
                        nameOfBranch = nameBranch;
                        return null;
                      }
                    },
                  )),
              SizedBox(height: height * 0.02),
              Container(
                width: double.infinity,
                height: height * 0.06,
                padding: EdgeInsets.only(left: width * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: TextFormField(
                    controller: ifscCode,
                    // autofocus: true,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Branch IFSC Code',
                          // textScaleFactor: textScale,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    validator: (ifscNo) {
                      if (ifscNo!.isEmpty) {
                        return 'Please Enter IFSC Code';
                      } else {
                        ifsc = ifscNo;
                        return null;
                      }
                    }),
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: double.infinity,
                height: height * 0.06,
                padding: EdgeInsets.only(left: width * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: TextFormField(
                  // autofocus: true,
                  controller: accountNumber,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        'Account Number',
                        // textScaleFactor: textScale,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )),
                  validator: (numberAccount) {
                    if (numberAccount!.isEmpty) {
                      return 'Please Enter Account Number';
                    } else {
                      accountNo = numberAccount;
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  if (key.currentState!.validate()) {
                    Provider.of<BusinessProfileProvider>(context, listen: false)
                        .postBankDetails(
                            nameOfBank!.isEmpty ? widget.bankName : nameOfBank,
                            nameOfBranch!.isEmpty
                                ? widget.branchName
                                : nameOfBranch,
                            ifsc!.isEmpty ? widget.ifscCode : ifsc,
                            accountNo!.isEmpty
                                ? widget.accountNumber
                                : accountNo);

                    Provider.of<BusinessProfileProvider>(context, listen: false)
                        .postOrganisationDetails(
                            organisation!.isEmpty
                                ? widget.organisationName
                                : organisation,
                            teleOne!.isEmpty ? widget.telephoneOne : teleOne,
                            teleTwo!.isEmpty ? widget.telephoneTwo : teleTwo,
                            panCard!.isEmpty ? widget.companyPancard : panCard,
                            panDoc,
                            aadharUdyom!.isEmpty
                                ? widget.aadharUdyog
                                : aadharUdyom,
                            aadharDoc,
                            gstNo!.isEmpty ? widget.gstNumber : gstNo);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: Color.fromARGB(255, 36, 71, 100), width: 1)),
                  child: const Center(
                    child: Text(
                      'Save',
                      // textScaleFactor: textScale,
                      style: TextStyle(color: Color.fromARGB(255, 36, 71, 100)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFile(PlatformFile saveFile) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${saveFile.name}');
    return File(saveFile.path!).copy(newFile.path);
  }
}
