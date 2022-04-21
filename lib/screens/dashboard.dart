import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/dashboardWidgets/grossSales.dart';
import '../widget/dashboardWidgets/grossEarnings.dart';
import '../widget/dashboardWidgets/totalOrders.dart';
import '../widget/dashboardWidgets/totalProducts.dart';
import '../widget/dashboardWidgets/newOrders.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
        width: double.infinity,
        height: double.infinity,
        // color: Colors.red,
        padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
        child: ListView(
          children: [
            Row(
              children: const [
                Text(
                  'This Month',
                  style: TextStyle(
                      color: Color.fromARGB(255, 36, 71, 100),
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              ],
            ),
            // SizedBox(height: height * 0.01),
            Container(
              height: height * 0.48,
              width: double.infinity,
              // color: Colors.amber,
              padding: EdgeInsets.only(
                  left: width * 0.02,
                  top: height * 0.02,
                  right: width * 0.02,
                  bottom: height * 0.02),
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: width * 0.065,
                    mainAxisSpacing: height * 0.03,
                    maxCrossAxisExtent: width * 0.45),
                children: [
                  GrossSales(),
                  GrossEarnings(),
                  TotalOrders(),
                  TotalProducts()
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'New Order',
                  style: TextStyle(
                      color: Color.fromARGB(255, 36, 71, 100),
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Text(
                  'See All Orders',
                  style: TextStyle(
                      color: Color.fromARGB(255, 39, 138, 42),
                      // fontWeight: FontWeight.bold,
                      fontSize: 15),
                )
              ],
            ),
            SizedBox(height: height * 0.025),
            NewOrders(),
            SizedBox(height: height * 0.04),
          ],
        ),
      ),
    );
  }
}
