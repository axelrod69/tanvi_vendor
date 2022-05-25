import 'package:flutter/material.dart';
import './widget/bottomNavigation.dart';
import './screens/addProducts.dart';
import 'package:provider/provider.dart';
import './model/category/categoryProvider.dart';
import './screens/signIn.dart';
import './screens/signUp.dart';
import './screens/changePassword.dart';
import './model/network/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './model/profile/profileProvider.dart';
import './model/profileStatus/statusProvider.dart';
import './model/profile/businessProfileProvider.dart';
import './model/products/productsProvider.dart';
import './model/sizeList/sizeListProvider.dart';
import './model/measureList/measureListProvider.dart';
import './model/dashboard/monthlyStats.dart';

void main() => runApp(TanviVendor());

class TanviVendor extends StatefulWidget {
  TanviVendorState createState() => TanviVendorState();
}

class TanviVendorState extends State<TanviVendor> {
  bool isAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    checkIfLoggedIn();
    // Provider.of<StatusProvider>(context, listen: false).getStatus();

    super.initState();
  }

  void checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    print('Tokeeeeeeeeeeeeen $token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(create: (context) => Authentication()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => StatusProvider()),
        ChangeNotifierProvider(create: (context) => BusinessProfileProvider()),
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => SizeListProvider()),
        ChangeNotifierProvider(create: (context) => MeasureListProvider()),
        ChangeNotifierProvider(create: (context) => MonthlyStatsProvider())
      ],

      builder: (context, child) {
        final provider = Provider.of<StatusProvider>(context).profileStatus;

        // print('Provider $provider');

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 248, 1)),
          // home: SignIn(),
          home: isAuth ? CustomBottomNavigation() : SignIn(),
          routes: {
            '/home': (context) => CustomBottomNavigation(),
            '/add-products': (context) => AddProductsPage(),
            '/sign-in': (context) => SignIn(),
            '/sign-up': (context) => SignUp(),
            '/change-password': (context) => ChangePassword(),
            // '/edit-products': (context) => EditProductsPage()
          },
        );
      },

      // child: MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   theme: ThemeData(
      //       scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 248, 1)),
      //   // home: SignIn(),
      //   home: isAuth ? CustomBottomNavigation() : SignIn(),
      //   routes: {
      //     '/home': (context) => CustomBottomNavigation(),
      //     '/add-products': (context) => AddProductsPage(),
      //     '/sign-in': (context) => SignIn(),
      //     '/sign-up': (context) => SignUp(),
      //     '/change-password': (context) => ChangePassword(),
      //   },
      // ),
    );
  }
}
