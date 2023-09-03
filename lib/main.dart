import 'dart:convert';

import 'package:ecommerceapp/models/json_data.dart';
import 'package:ecommerceapp/screen/checkout.dart';
import 'package:ecommerceapp/screen/home.dart';
import 'package:ecommerceapp/screen/login.dart';
import 'package:ecommerceapp/screen/profile.dart';
import 'package:ecommerceapp/utils/application_state.dart';
import 'package:ecommerceapp/utils/costum_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

void main() async {
  // firebasae setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//strip setup
  // final String response =
  //     await rootBundle.loadString("assets/config/stripe.json");
  // final data = await json.decode(response);
  // Stripe.publishableKey = data["publishableKey"];

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, child) => Consumer<ApplicationState>(
        builder: (context, ApplicationState, _) {
          Widget child;
          switch (ApplicationState.loginState) {
            case ApplicationLoginState.LoggetOut:
              child = LoginScreen();
              break;
            case ApplicationLoginState.loggetIn:
              child = MyApp();
              break;
            default:
              child = LoginScreen();
          }
          return MaterialApp(
            theme: CustomTheme.getTheme(),
            home: child,
          );
        },
      ),
      // builder: (context, child) {
      //   Widget? appChild;
      //   switch (context.watch<ApplicationState>().loginState) {
      //     case ApplicationLoginState.LoggetOut:
      //       appChild = LoginScreen();
      //       break;
      //     case ApplicationLoginState.loggetIn:
      //       appChild = MyApp();
      //       break;
      //     default:
      //       appChild = LoginScreen();
      //   }
      //   return appChild;
      // },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("SHOPPERS"),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 4,
                    offset: Offset(0, 2))
              ],
            ),
            child: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomeScreen(),
              JsonData(),
              CheckoutScreen(),
            ],
          )),
    );
  }
}
