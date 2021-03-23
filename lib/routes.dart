import 'package:cafe_bunny/screens/home/home_screen.dart';
import 'package:cafe_bunny/screens/sign_in/sign_in_screen.dart';
import 'package:cafe_bunny/screens/splash/splash_screen.dart';
import 'package:cafe_bunny/screens/home/home_screen.dart';
import 'package:cafe_bunny/screens/sign_up/sign_up_screen.dart';
import 'package:cafe_bunny/screens/account/account_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:cafe_bunny/screens/qw/achievements.dart';
import 'package:cafe_bunny/screens/qw/coupons.dart';
import 'package:cafe_bunny/screens/qw/achievement2.dart';
import 'package:cafe_bunny/screens/qw/coupon2.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
  Achievements.routeName: (context) => Achievements(),
  Coupons.routeName: (context) => Coupons(),
  Achievement2.routeName: (context) => Achievement2(),
  Coupon2.routeName: (context) => Coupon2(),
};