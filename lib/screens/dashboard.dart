import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/dashboardWidgets/grossSales.dart';
import '../widget/dashboardWidgets/grossEarnings.dart';
import '../widget/dashboardWidgets/totalOrders.dart';
import '../widget/dashboardWidgets/totalProducts.dart';
import '../widget/dashboardWidgets/newOrders.dart';
import 'package:provider/provider.dart';
import '../model/dashboard/monthlyStats.dart';

class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MonthlyStatsProvider>(context, listen: false)
        .getStats()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<MonthlyStatsProvider>(context).stats;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        toolbarHeight: tabLayout ? height * 0.15 : height * 0.1,
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
                          Text(
                            'Hi, Ankit',
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 71, 100),
                                fontWeight: FontWeight.bold,
                                fontSize: tabLayout ? 40 : 30),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(DateFormat.yMMMMd().format(DateTime.now()),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 99, 118, 134),
                                  fontSize: tabLayout ? 40 : 30))
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
                            size: tabLayout ? height * 0.05 : height * 0.04,
                            color: const Color.fromARGB(255, 99, 118, 134),
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
                  child: Text(
                    '9+',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout ? 16 : 12),
                  ),
                ))
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              // color: Colors.red,
              padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        'This Month',
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 71, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout ? 28 : 22),
                      )
                    ],
                  ),
                  // SizedBox(height: height * 0.01),
                  Container(
                    height: tabLayout ? height * 0.7 : height * 0.48,
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
                        GrossSales(provider['data']['gross_sell'].toString()),
                        GrossEarnings(provider['data']['gross_tax'].toString()),
                        TotalOrders(
                            provider['data']['total_orders'].toString()),
                        TotalProducts(
                            provider['data']['total_products'].toString())
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
