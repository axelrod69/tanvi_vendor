import 'package:flutter/material.dart';
import './widget/bottomNavigation.dart';

void main() => runApp(TanviVendor());

class TanviVendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 248, 1)),
      home: CustomBottomNavigation(),
    );
  }
}
