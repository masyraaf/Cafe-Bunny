import 'package:cafe_bunny/screens/home/home_screen.dart';
import 'package:cafe_bunny/screens/sign_in/sign_in_screen.dart';
import 'package:cafe_bunny/screens/splash/splash_screen.dart';
import 'package:cafe_bunny/screens/home/home_screen.dart';
import 'package:cafe_bunny/screens/home/home_screen2.dart';
import 'package:cafe_bunny/screens/sign_up/sign_up_screen.dart';
import 'package:cafe_bunny/screens/account/account_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:cafe_bunny/screens/qw/achievement.dart';
import 'package:cafe_bunny/screens/qw/coupon.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen2.routeName: (context) => HomeScreen2(),
  AccountScreen.routeName: (context) => AccountScreen(),
  Achievement.routeName: (context) => Achievement(),
  Coupon.routeName: (context) => Coupon(),
};