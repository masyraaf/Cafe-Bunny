import 'package:cafe_bunny/screens/home/home_screen.dart';
import 'package:cafe_bunny/screens/sign_in/sign_in_screen.dart';
import 'package:cafe_bunny/screens/splash/splash_screen.dart';
import 'package:cafe_bunny/screens/home/home_screen.dart';
import 'package:cafe_bunny/screens/sign_up/sign_up_screen.dart';
import 'package:cafe_bunny/screens/account/account_screen.dart';
import 'package:flutter/widgets.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (Context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
};