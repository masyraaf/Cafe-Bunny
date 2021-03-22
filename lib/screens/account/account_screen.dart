import 'package:cafe_bunny/classes/User.dart';
import 'package:cafe_bunny/components/auth.dart';
import 'package:cafe_bunny/components/custom_bottom_nav_bar.dart';
import '../account/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = "/account";
  @override
  Widget build(BuildContext context) {

    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      child:Scaffold(
        appBar: AppBar(
          title: Text("Account"),
        ),
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.account),
      )
    );
  }
}

