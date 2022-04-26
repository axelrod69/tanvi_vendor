import 'package:flutter/material.dart';
import '../widget/profileWidget/business.dart';
import '../widget/profileWidget/personal.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        // leading: const Icon(Icons.arrow_back_ios, color: Colors.red),
        title: const Text('Profile',
            // textScaleFactor: textScale,
            style: TextStyle(
                color: Color.fromARGB(255, 36, 71, 100),
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: const Color.fromARGB(255, 36, 71, 100),
          labelColor: const Color.fromARGB(255, 36, 71, 100),
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            // Tab(
            //   text: 'Cancelled Orders',
            // ),

            Tab(
              text: 'Personal',
            ),
            Tab(
              text: 'Business',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // CancelledOrders(),
          Personal(),
          Business(),
        ],
      ),
    );
  }
}
