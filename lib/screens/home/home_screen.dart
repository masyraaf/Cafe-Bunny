import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafe_bunny/components/custom_bottom_nav_bar.dart';
import 'package:cafe_bunny/classes/User.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cafe_bunny/screens/jordan/place_marker.dart';
import 'package:cafe_bunny/screens/jordan/detailspage.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:cafe_bunny/screens/jordan/widgets/sidemenu.dart';

class HomeScreen extends StatefulWidget{
  static String routeName = "/home";
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>{

  Color primaryColor = Color(0xff118203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);


  _HomeScreenState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    getIDSF().then((id) => print(id));
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
       body: Container(
         margin: EdgeInsets.symmetric(horizontal: 40),
         child: Column(
           children: <Widget>[
           Text(
           'Home Screen',
           textAlign: TextAlign.center,
           style:
           GoogleFonts.openSans(color: Colors.white, fontSize: 28),
         )]
       )
       ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }




}

