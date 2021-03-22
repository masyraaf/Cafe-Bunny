import 'package:cafe_bunny/classes/User.dart';
import 'package:cafe_bunny/components/auth.dart';
import 'package:cafe_bunny/components/default_button.dart';
import 'package:cafe_bunny/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:cafe_bunny/components/card.dart';
import 'avatar_pic.dart';
import 'package:cafe_bunny/constants.dart';
import 'package:provider/provider.dart';



class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    final user = Provider.of<MyUser>(context);
    print(user);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          Text(
            "Alice James",
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
            ),
          ),
          InfoCard(
            titleText: "Title",
            titleColor: kPrimaryColor,
            dataText: user.uid,
            dataColor: kSecondaryColor,
          ),
          InfoCard(
            titleText: "Level",
            titleColor: kPrimaryColor,
            dataText: user.uid,
            dataColor: kSecondaryColor,
          ),
          InfoCard(
            titleText: "Exp Points",
            titleColor: kPrimaryColor,
            dataText: user.uid,
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
    );
  }
}