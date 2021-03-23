import 'package:cafe_bunny/screens/account/account_screen.dart';
import 'package:cafe_bunny/screens/qw/achievements.dart';
import 'package:cafe_bunny/screens/qw/coupons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cafe_bunny/screens/home/home_screen.dart';
import 'package:cafe_bunny/screens/qw/achievement2.dart';
import 'package:cafe_bunny/screens/qw/coupon2.dart';

import '../constants.dart';

enum MenuState { home, account, achievements, coupons }

class CustomBottomNavBar extends StatelessWidget {
  const  CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color:MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  size: 24,
                ) ,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context,  HomeScreen.routeName, arguments: "test"),
              ),
              IconButton(
                icon: Icon(
                  Icons.account_box,
                  color: MenuState.account == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  size: 24,
                ),
                onPressed: () =>
                  Navigator.pushReplacementNamed(context, AccountScreen.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.auto_awesome,
                  color:MenuState.achievements == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  size: 24,
                ) ,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, Achievement2.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.attach_money_rounded,
                  color:MenuState.coupons == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  size: 24,
                ) ,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, Coupon2.routeName),
              ),
            ],
          )),
    );
  }
}