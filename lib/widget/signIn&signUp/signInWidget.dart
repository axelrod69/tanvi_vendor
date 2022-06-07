import 'dart:convert';
import '../../model/network/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../authentication/network.dart';

class FormWidget extends StatefulWidget {
  FormWidgetState createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // final _focusFifth = FocusNode();
  String? emailId = '';
  String? password = '';

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
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: _key,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.08, right: width * 0.08),
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
                      style: TextStyle(fontSize: tabLayout ? 25 : 18),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(fontSize: tabLayout ? 25 : 18),
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
                  padding:
                      EdgeInsets.only(left: width * 0.08, right: width * 0.08),
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
                      style: TextStyle(fontSize: tabLayout ? 25 : 18),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(fontSize: tabLayout ? 25 : 18),
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
                      validator: (passWrd) {
                        if (passWrd!.isEmpty) {
                          return 'Please Enter Password';
                        } else {
                          password = passWrd;
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
      // Text(
      //   'Forgot your password?',
      //   textAlign: TextAlign.center,
      //   // textScaleFactor: textScaleFactor,
      //   style: TextStyle(color: Colors.grey, fontSize: tabLayout ? 25 : 14),
      // ),
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
            if (_key.currentState!.validate()) {
              _signIn();
            }
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
                // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: tabLayout
                        ? 25
                        : largeLayout
                            ? 18
                            : 14),
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
            // textScaleFactor: textScaleFactor,
            style: TextStyle(
                color: Colors.grey,
                fontSize: tabLayout
                    ? 23
                    : largeLayout
                        ? 16
                        : 12),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed('/sign-up'),
            child: Text(
              'Sign Up',
              textAlign: TextAlign.center,
              // textScaleFactor: textScaleFactor,
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: tabLayout
                      ? 23
                      : largeLayout
                          ? 16
                          : 12),
            ),
          ),
        ],
      ),
      SizedBox(height: height * 0.04),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       width: width * 0.18,
      //       height: height * 0.065,
      //       padding:
      //           EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
      //       decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: const [
      //             BoxShadow(
      //                 color: Colors.grey,
      //                 spreadRadius: 2,
      //                 blurRadius: 4,
      //                 offset: Offset(0, 1))
      //           ]),
      //       child: Center(
      //         child:
      //             Image.asset('assets/images/facebook-logo-transparent.png'),
      //       ),
      //     ),
      //     SizedBox(width: width * 0.04),
      //     Container(
      //       width: width * 0.18,
      //       height: height * 0.065,
      //       padding:
      //           EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
      //       decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: const [
      //             BoxShadow(
      //                 color: Colors.grey,
      //                 spreadRadius: 2,
      //                 blurRadius: 4,
      //                 offset: Offset(0, 1))
      //           ]),
      //       child: Center(
      //         child: Image.asset('assets/images/google-logo.png'),
      //       ),
      //     )
      //   ],
      // ),
      SizedBox(height: height * 0.04),
      // Text(
      //     'Please Change your Password if you are Logging In For the First Time',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       color: Colors.grey,
      //       fontSize: tabLayout
      //           ? 23
      //           : largeLayout
      //               ? 16
      //               : 12,
      //       fontWeight: FontWeight.bold,
      //     )),
      // SizedBox(height: height * 0.02),
      //   InkWell(
      //     onTap: () => Navigator.of(context).pushNamed('/change-password'),
      //     child: const Text('Change Password',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //           color: Colors.green,
      //           fontSize: 16,
      //           fontWeight: FontWeight.bold,
      //         )),
      //   )
      // ],
    ]);
  }

  void _signIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {'email': emailId.toString(), 'password': password.toString()};
    print(data);

    var response = await Provider.of<Authentication>(context, listen: false)
        .signIn(data, 'api/vendor/login/');
    var res = json.decode(response.body);
    if (res['status'] == 'success') {
      await localStorage.setString('token', res['data']['access']);
      Navigator.of(context).pushNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(res['message'],
            style: const TextStyle(
              color: Colors.white,
            )),
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
    print(json.decode(response.body));
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
