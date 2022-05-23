import 'package:flutter/material.dart';

class TotalOrders extends StatefulWidget {
  final String totalOrders;
  TotalOrdersState createState() => TotalOrdersState();

  TotalOrders(this.totalOrders);
}

class TotalOrdersState extends State<TotalOrders> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      height: height * 0.1,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(1, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.shopping_cart, color: Colors.green, size: 80),
              Text('View',
                  style: TextStyle(
                    color: Color.fromARGB(255, 36, 71, 100),
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02),
            child: Text('₹${widget.totalOrders}',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 71, 100))),
          ),
          Text('Total Orders',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 71, 100)))
        ],
      ),
    );
  }
}
