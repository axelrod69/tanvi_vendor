import 'package:flutter/material.dart';

class GrossEarnings extends StatefulWidget {
  GrossEarningsState createState() => GrossEarningsState();
}

class GrossEarningsState extends State<GrossEarnings> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      height: height * 0.1,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(1, 2))
          ]),
    );
    ;
  }
}
