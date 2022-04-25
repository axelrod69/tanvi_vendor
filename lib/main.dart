import 'package:flutter/material.dart';
import './widget/bottomNavigation.dart';
import './screens/addProducts.dart';
import 'package:provider/provider.dart';
import './model/categoryProvider.dart';
import './screens/signIn.dart';
import './screens/signUp.dart';

void main() => runApp(TanviVendor());

class TanviVendor extends StatelessWidget {
  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 248, 1)),
        // home: CustomBottomNavigation(),
        home: SignIn(),
        routes: {
          '/add-products': (context) => AddProductsPage(),
          '/sign-up': (context) => SignUp()
        },
      ),
    );
  }
}
