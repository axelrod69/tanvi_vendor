import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      body: const Center(
        child: Text('Products'),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: height * 0.07),
        decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 8, offset: Offset(2, 2))
        ]),
        child: CircleAvatar(
          radius: width * 0.07,
          backgroundColor: Colors.green,
          child: const Text(
            '+',
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
      ),
      // floatingActionButton: Container(
      //   width: width * 0.2,
      //   height: height * 0.06,
      //   margin: EdgeInsets.only(bottom: height * 0.07),
      //   decoration: BoxDecoration(
      //       color: Colors.green,
      //       shape: BoxShape.circle,
      //       boxShadow: [
      //         BoxShadow(
      //             color: Colors.grey, blurRadius: 10, offset: Offset(1, 2))
      //       ]),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
