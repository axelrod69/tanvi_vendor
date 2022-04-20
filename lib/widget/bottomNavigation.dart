import 'package:flutter/material.dart';
import '../screens/orders.dart';
import '../screens/products.dart';
import '../screens/earning.dart';
import '../screens/dashboard.dart';
import '../screens/profile.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int index = 2;
  final screens = [Orders(), Products(), Dashboard(), Earnings(), Profile()];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
        body: screens[index],
        extendBody: true,
        bottomNavigationBar: Container(
          height: height * 0.06,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: height * 0.02),
          // color: Colors.red,
          // padding: EdgeInsets.only(
          //   left: width * 0.15, top: height * 0.08,
          //   //  right: width * 0.04
          // ),
          // padding: EdgeInsets.only(top: height * 0.035),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: width * 0.75,
                  height: height * 0.05,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 2))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: double.infinity,
                        width: width * 0.35,
                        padding: EdgeInsets.only(left: width * 0.065),
                        // color: Colors.red,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              // onTap: () =>
                              //     Navigator.of(context).pushNamed('/cart-screen'),
                              onTap: () {
                                // Navigator.of(context).pushNamed('/cart-screen');
                                // print('Cart Screen');
                                setState(() {
                                  index = 0;
                                });
                              },
                              // onTap: () {
                              //   screens[selectedItem] = 0 as StatefulWidget;
                              // setState(() {

                              // });

                              child: const Icon(Icons.menu_book,
                                  color: Color.fromARGB(255, 36, 71, 100)),
                            ),
                            SizedBox(width: width * 0.1),
                            InkWell(
                              // onTap: () => Navigator.of(context)
                              //     .pushNamed('/dashboard-screen'),
                              onTap: () {
                                // Navigator.of(context)
                                //     .pushNamed('/dashboard-screen');
                                // print('Dashboard Screen');
                                setState(() {
                                  index = 1;
                                });
                              },
                              // onTap: () {
                              //   screens[selectedItem] = 1 as StatefulWidget;
                              //   // setState(() {

                              //   // });
                              // },
                              child: const Icon(Icons.shopping_bag,
                                  color: Color.fromARGB(255, 36, 71, 100)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: width * 0.35,
                        // padding: EdgeInsets.only(right: width * 0.02),
                        // color: Colors.blue,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.06),
                              child: InkWell(
                                // onTap: () => Navigator.of(context)
                                //     .pushNamed('/notification-screen'),
                                onTap: () {
                                  // Navigator.of(context)
                                  //     .pushNamed('/notification-screen');
                                  // print('Notification Screen');
                                  setState(() {
                                    index = 3;
                                  });
                                },
                                // onTap: () {
                                //   screens[selectedItem] = 3 as StatefulWidget;
                                //   // setState(() {

                                //   // });
                                // },
                                child: const Icon(Icons.money,
                                    color: Color.fromARGB(255, 36, 71, 100)),
                              ),
                            ),
                            SizedBox(width: width * 0.1),
                            InkWell(
                                // onTap: () {
                                //   screens[selectedItem] = 4 as StatefulWidget;
                                //   // setState(() {

                                //   // });
                                // },
                                // onTap: () => Navigator.of(context)
                                //     .pushNamed('/profile-screen'),
                                onTap: () {
                                  // Navigator.of(context)
                                  //     .pushNamed('/profile-screen');
                                  // print('Profile Screen');
                                  setState(() {
                                    index = 4;
                                  });
                                },
                                child: const Icon(Icons.person,
                                    color: Color.fromARGB(255, 36, 71, 100)))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).pushNamed('/home-screen');
            setState(() {
              index = 2;
            });
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              // height: height * 0.075,
              // width: width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ],
                  border: Border.all(
                      color: Colors.green, width: 2, style: BorderStyle.solid)),
              child: const Center(
                  child: Icon(Icons.menu,
                      color: Color.fromARGB(255, 36, 71, 100))),
            ),
          ),
        ));
  }
}
