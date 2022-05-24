import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewOrders extends StatefulWidget {
  NewOrdersState createState() => NewOrdersState();
}

class NewOrdersState extends State<NewOrders> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Container(
      width: double.infinity,
      // height: height * 0.24,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(1, 2))
          ]),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.045,
            // color: Colors.green,
            margin: EdgeInsets.only(
                left: width * 0.02, top: height * 0.01, right: width * 0.02),
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
                          '#20220421-01234567',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 36, 71, 100),
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 22 : 14),
                        ),
                        SizedBox(height: height * 0.002),
                        Text(
                          '${DateFormat.yMMMMd().format(DateTime.now())} ${DateFormat('HH:mm:ss').format(DateTime.now())}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 22 : 14),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '₹ 230.44',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 36, 71, 100),
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 30 : 24),
                        ),
                        SizedBox(width: width * 0.002),
                        Text(
                          '(Paid)',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 22 : 15),
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
            padding: EdgeInsets.only(
                left: tabLayout ? width * 0.05 : width * 0.1,
                right: tabLayout ? width * 0.05 : width * 0.1),
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
            margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer Name',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout ? 22 : 14),
                ),
                Text(
                  'Ankit Gupta',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 36, 71, 100),
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout ? 22 : 14),
                )
              ],
            ),
          ),
          // SizedBox(height: height * 0.001),
          Padding(
            padding: EdgeInsets.only(
                left: tabLayout ? width * 0.05 : width * 0.1,
                right: tabLayout ? width * 0.05 : width * 0.1),
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
            margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Status',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout ? 22 : 14),
                ),
                Text(
                  'In Transit',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 36, 71, 100),
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout ? 22 : 18),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'View Details',
                style: TextStyle(
                    color: const Color.fromARGB(255, 36, 71, 100),
                    fontWeight: FontWeight.bold,
                    fontSize: tabLayout ? 18 : 14),
              )
            ],
          ),
          SizedBox(height: height * 0.01)
        ],
      ),
    );
  }
}
