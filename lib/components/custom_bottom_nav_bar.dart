import 'package:cafe_bunny/screens/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cafe_bunny/screens/home/home_screen.dart';

import '../constants.dart';

enum MenuState { home, account, achievements, coupons }

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
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
                    Navigator.pushReplacementNamed(context, HomeScreen.routeName),
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
                  icon: SvgPicture.asset("assets/icons/medal.png"),
                onPressed: () {}
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/coupon.png",
                  color: MenuState.coupons == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {}
                    // Navigator.pushNamed(context, HomeScreen.routeName),
              ),
            ],
          )),
    );
  }
}