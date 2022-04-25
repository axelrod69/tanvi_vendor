import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../authentication/network.dart';

class FormWidget extends StatefulWidget {
  FormWidgetState createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // final _focusFifth = FocusNode();
  String? emailId = '';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _focusFifth.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.08, right: width * 0.08),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.0045),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 10,
                                // color: Color.fromRGBO(227, 189, 255, 0.5),
                                offset: Offset(1, 2))
                          ]),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: 'Enter Your Email',
                            // suffixIcon: mobileNumber!.length < 10
                            //     ? null
                            //     : const Icon(Icons.check_circle,
                            //         color: Colors.green),
                            // label: Text(
                            //   'Enter Your Phone Number',
                            //   textScaleFactor: textScaleFactor,
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_focusFirst),
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please Enter Email';
                          } else {
                            emailId = email;
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.08, right: width * 0.08),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.0045),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 10,
                                // color: Color.fromRGBO(227, 189, 255, 0.5),
                                offset: Offset(1, 2))
                          ]),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Enter Your Password',
                            // suffixIcon: mobileNumber!.length < 10
                            //     ? null
                            //     : const Icon(Icons.check_circle,
                            //         color: Colors.green),
                            // label: Text(
                            //   'Enter Your Phone Number',
                            //   textScaleFactor: textScaleFactor,
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_focusFirst),
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please Enter Password';
                          } else {
                            emailId = email;
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.04),
        Text(
          'Forgot your password?',
          textAlign: TextAlign.center,
          textScaleFactor: textScaleFactor,
          style: const TextStyle(color: Colors.grey),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
          child: InkWell(
            onTap: () {
              // if (_otpKey.currentState!.validate()) {
              //   login(firstOtp!, secondOtp!, thirdOtp!, fourthOtp!,
              //       mobileNumber!);
              // } else {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: const Text(
              //       'Please Enter Your OTP',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     backgroundColor: Colors.white,
              //     action: SnackBarAction(
              //         label: 'Ok',
              //         onPressed: () => Navigator.of(context).pop()),
              //   ));
              // }
            },
            child: Container(
              width: double.infinity,
              height: height * 0.07,
              margin: EdgeInsets.only(top: height * 0.02),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(57, 226, 14, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  'Login',
                  textScaleFactor: textScaleFactor,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dont\'t have an account?',
              textAlign: TextAlign.center,
              textScaleFactor: textScaleFactor,
              style: const TextStyle(color: Colors.grey),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/sign-up'),
              child: Text(
                'Sign Up',
                textAlign: TextAlign.center,
                textScaleFactor: textScaleFactor,
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width * 0.18,
              height: height * 0.065,
              padding:
                  EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1))
                  ]),
              child: Center(
                child:
                    Image.asset('assets/images/facebook-logo-transparent.png'),
              ),
            ),
            SizedBox(width: width * 0.04),
            Container(
              width: width * 0.18,
              height: height * 0.065,
              padding:
                  EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1))
                  ]),
              child: Center(
                child: Image.asset('assets/images/google-logo.png'),
              ),
            )
          ],
        )
      ],
    );
  }

  // void validateNumber(String number) async {
  //   var data = {'mobile': number.toString()};
  //   var response = await Provider.of<Network>(context, listen: false)
  //       .logIn(data, 'api/login/');
  //   print(response.body);
  // }

  // void login(String firstOtp, String secondOtp, String thirdOtp,
  //     String fourthOtp, String mobileNumber) async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   String otp = firstOtp + secondOtp + thirdOtp + fourthOtp;
  //   var data = {'otp': otp, 'mobile': mobileNumber};

  //   var response = await Provider.of<Network>(context, listen: false)
  //       .loginOtp(data, 'api/login-otp/');
  //   print(response.body);
  //   var receivedResponse = json.decode(response.body);

  //   await localStorage.setString('token', receivedResponse['access']);

  //   Navigator.of(context).pushNamed('/landing-page');
  // }
}
