import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {
  OrdersState createState() => OrdersState();
}

class OrdersState extends State<Orders> {
  final List<dynamic> _orderList = [
    {
      'orderId': '#20220421-01234567',
      'name': "Siddhartha Chatterjee",
      'price': '230.44',
      'paymentStatus': 'Paid',
      'deliveryStatus': 'In Transit'
    },
    {
      'orderId': '#20220421-01234567',
      'name': "Soumyajit Das",
      'price': '231.44',
      'paymentStatus': 'Unpaid',
      'deliveryStatus': 'Confirmed'
    },
    {
      'orderId': '#20220421-01234567',
      'name': "Tanay Banerjee",
      'price': '232.44',
      'paymentStatus': 'Paid',
      'deliveryStatus': 'Delivered'
    },
    {
      'orderId': '#20220421-01234567',
      'name': "Rachhel Sekh",
      'price': '233.44',
      'paymentStatus': 'Unpaid',
      'deliveryStatus': 'Delivered'
    }
  ];

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.1,
        elevation: 0,
        title: Stack(
          children: [
            Container(
              height: height * 0.1,
              width: double.infinity,
              // color: Colors.red,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      height: double.infinity,
                      // color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hi, Ankit',
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 71, 100),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(DateFormat.yMMMMd().format(DateTime.now()),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 118, 134),
                                  fontSize: 18))
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      height: double.infinity,
                      // color: Colors.green,
                      padding: EdgeInsets.only(
                          top: height * 0.01, right: width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.notifications,
                            size: height * 0.04,
                            color: Color.fromARGB(255, 99, 118, 134),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: height * 0.01,
                right: width * 0.02,
                child: CircleAvatar(
                  radius: width * 0.02,
                  backgroundColor: Colors.red,
                  child: const Text(
                    '9+',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ))
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        // color: Colors.red,
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            // height: height * 0.24,
            margin: EdgeInsets.only(
                left: width * 0.01,
                top: height * 0.01,
                right: width * 0.01,
                bottom: height * 0.01),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 2, offset: Offset(1, 2))
                ]),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.045,
                  // color: Colors.green,
                  margin: EdgeInsets.only(
                      left: width * 0.02,
                      top: height * 0.01,
                      right: width * 0.02),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: double.infinity,
                          // color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _orderList[index]['orderId'],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 36, 71, 100),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(height: height * 0.002),
                              Text(
                                '${DateFormat.yMMMMd().format(DateTime.now())} ${DateFormat('HH:mm:ss').format(DateTime.now())}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: double.infinity,
                          // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '₹${_orderList[index]['price']}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 36, 71, 100),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              SizedBox(width: width * 0.002),
                              Text(
                                '(${_orderList[index]['paymentStatus']})',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.002),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ),
                // SizedBox(height: height * 0.02),
                Container(
                  width: double.infinity,
                  height: height * 0.06,
                  // color: Colors.blue,
                  margin:
                      EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer Name',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        _orderList[index]['name'],
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 71, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                // SizedBox(height: height * 0.001),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ),
                // SizedBox(height: height * 0.01),
                Container(
                  width: double.infinity,
                  height: height * 0.06,
                  // color: Colors.blue,
                  margin:
                      EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Status',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        _orderList[index]['deliveryStatus'],
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 71, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'View Details',
                      style: TextStyle(
                        color: Color.fromARGB(255, 36, 71, 100),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.01)
              ],
            ),
          ),
          itemCount: _orderList.length,
        ),
      ),
    );
  }
}
