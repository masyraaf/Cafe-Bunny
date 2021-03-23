import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

final databaseReference = FirebaseDatabase.instance.reference();


class  MyUser{
  // String id = "";
  // String name = "";
  // String profilePicUrl = "";
  // int currentExpPoints = 0;
  // int expPointsNeeded = 0;
  // int level  = 0;
  // String title = "";
  // var unlockedAchievements = [];
  // var unlockedCoupons = [];
  // var unlockedTitles = [];

  int currentPoints;
  int level;
  String name;
  int pointsNeeded;
  String profilePicUrl;
  String title;
  String uid;
  var unlockedAchievements = [];
  var unlockedCoupons = [];
  var unlockedTitles = [];

  MyUser({this.uid, this.currentPoints, this.level, this.name, this.pointsNeeded, this.profilePicUrl, this.title, this.unlockedAchievements, this.unlockedCoupons, this.unlockedTitles});



}

 Future<String> getIDSF() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userID = prefs.getString('userID');
  return userID;
}


