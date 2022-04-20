import 'package:flutter/material.dart';

class TotalProducts extends StatefulWidget {
  TotalProductsState createState() => TotalProductsState();
}

class TotalProductsState extends State<TotalProducts> {
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
  }
}
