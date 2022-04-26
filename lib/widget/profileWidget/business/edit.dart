import 'package:flutter/material.dart';
// import '../../model/profile/profileProvider.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final key = GlobalKey<FormState>();
  final _emailFocus = FocusNode();
  final _mobileNoFocus = FocusNode();
  final _addressFocus = FocusNode();
  final _pincodeFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailFocus.dispose();
    _mobileNoFocus.dispose();
    _addressFocus.dispose();
    _pincodeFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();

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
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Siddhartha Chatterjee',
                          label: Text(
                            'Telephone Number 2',
                            // textScaleFactor: textScale,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )))),
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
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Aadhar Udyam Udoyog',
                            // textScaleFactor: textScale,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )))),
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
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'GST Number',
                            // textScaleFactor: textScale,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )))),
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
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Bank Name',
                            // textScaleFactor: textScale,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )))),
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
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Branch Name',
                            // textScaleFactor: textScale,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )))),
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
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Branch IFSC Code',
                            // textScaleFactor: textScale,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )))),
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
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Account Number',
                            // textScaleFactor: textScale,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )))),
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
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Business Name',
                            // textScaleFactor: textScale,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )))),
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
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Bank Name',
                            // textScaleFactor: textScale,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )))),
              SizedBox(height: height * 0.05),
              Container(
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
                    style: const TextStyle(
                        color: Color.fromARGB(255, 36, 71, 100)),
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
}
