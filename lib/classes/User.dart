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

  String uid;

  MyUser({this.uid});



}

 Future<String> getIDSF() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userID = prefs.getString('userID');
  return userID;
}



// Future<MyUser> getUserDetails(String userID) async{
//   var dbRef = databaseReference.child("user");
//   DataSnapshot dataSnapshot = await dbRef.child(userID).once();
//   MyUser user = MyUser();
//   if(dataSnapshot != null){
//     // User user ddd= User( dataSnapshot.key, dataSnapshot.)
//     Map<dynamic, dynamic> values = dataSnapshot.value;
//     user.id = userID;
//     user.name = values["name"];
//     user.currentExpPoints = values["currentPoints"];
//     user.level = values["level"];
//     user.expPointsNeeded = values["pointsNeeded"];
//     user.profilePicUrl = values["profilePicUrl"];
//     user.title = values["title"];
//
//     DataSnapshot uASnapshot = await dbRef.child(userID).child("unlockedAchievements").once();
//     Map<dynamic, dynamic> achievements = uASnapshot.value;
//     achievements.forEach((key, value) {
//       user.unlockedAchievements.add(value);
//     });
//
//     DataSnapshot uCSnapshot = await dbRef.child(userID).child("unlockedCoupons").once();
//     Map<dynamic, dynamic> coupons = uASnapshot.value;
//     coupons.forEach((key, value) {
//       user.unlockedCoupons.add(value);
//     });
//
//     DataSnapshot uTSnapshot = await dbRef.child(userID).child("unlockedTitles").once();
//     Map<dynamic, dynamic> titles = uASnapshot.value;
//     titles.forEach((key, value) {
//       user.unlockedTitles.add(value);
//     });
//
//
//   }
//
//   return user;
// }
//
