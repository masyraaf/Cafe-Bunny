import 'package:cafe_bunny/classes/User.dart';
import 'package:cafe_bunny/components/auth.dart';
import 'package:cafe_bunny/components/default_button.dart';
import 'package:cafe_bunny/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:cafe_bunny/components/card.dart';
import 'avatar_pic.dart';
import 'package:cafe_bunny/constants.dart';
import 'package:provider/provider.dart';
import 'package:cafe_bunny/components/database.dart';
import 'package:cafe_bunny/screens/qw/globals.dart' as gb;



class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();
    // MyUser user = DatabaseService().getUserData();

    return Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage("images/background2.png"),
                    fit: BoxFit.fitWidth))),
        SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(),
            SizedBox(height: 20),
            Text(
              "Account Details",
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
            InfoCard(
              titleText: "Equipped Title",
              titleColor: kPrimaryColor,
              dataText:'${gb.playerTitle}',
              dataColor: Colors.orangeAccent,
            ),
            InfoCard(
              titleText: "Bunny Level",
              titleColor: kPrimaryColor,
              dataText: "${gb.playerLevel}",
              dataColor: kSecondaryColor,
            ),
            InfoCard(
              titleText: "Bunny EXP",
              titleColor: kPrimaryColor,
              dataText: "${gb.expFlag}/2",
              dataColor: kSecondaryColor,
            ),

            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child:   DefaultButton(
                text: "Log Out",
                press: () async{
                  //if all valid, then navigate to  home screen
                  await _auth.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SignInScreen()));
                },
              ),
            ),
          ],
        ),
      ),
      ],
    );
  }
}