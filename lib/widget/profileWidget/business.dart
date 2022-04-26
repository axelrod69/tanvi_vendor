import 'package:flutter/material.dart';
import './business/details.dart';
import './business/edit.dart';

class Business extends StatefulWidget {
  BusinessState createState() => BusinessState();
}

class BusinessState extends State<Business> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    final textColor = const Color.fromARGB(255, 36, 71, 100);

    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     'Personal',
      //     textScaleFactor: textScale,
      //     style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      //   ),
      //   // actions: [Cart(), NotifyBell()],
      // ),
      body: Center(
        child: ListView(
          children: [
            // SizedBox(height: height * 0.05),
            // CircleAvatar(
            //   radius: 50,
            //   // child: Image.asset(
            //   //   'assets/images/NoPath - Copy (14).png',
            //   // ),
            // ),
            SizedBox(height: height * 0.06),
            InkWell(
              onTap: () {
                setState(() {
                  clicked = !clicked;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit, color: textColor),
                  SizedBox(width: width * 0.01),
                  Text(
                    'Edit Business Details',
                    textScaleFactor: textScale,
                    style: TextStyle(
                      color: textColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.002),
            // Center(
            //   child: Padding(
            //     padding: EdgeInsets.only(left: width * 0.04),
            //     child: Text(
            //       'Hi there ${provider['name'].substring(0, 3)}',
            //       textScaleFactor: textScale,
            //       style: const TextStyle(
            //           color: textColor, fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),
            SizedBox(height: height * 0.003),
            // Center(
            //   child: Padding(
            //     padding: EdgeInsets.only(left: width * 0.04),
            //     child: Text(
            //       'Sign Out',
            //       textScaleFactor: textScale,
            //       style: TextStyle(
            //           color: textColor,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 12),
            //     ),
            //   ),
            // ),
            SizedBox(height: height * 0.01),
            !clicked ? Details() : EditProfile()
          ],
        ),
      ),
    );
  }
}
