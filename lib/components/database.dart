import 'package:cafe_bunny/classes/Achievement.dart';
import 'package:cafe_bunny/classes/Coupon.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cafe_bunny/classes/User.dart';


class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });

  final databaseReference = FirebaseDatabase.instance.reference();

  Future createNewUser(String name){
    final userRef = databaseReference.child("user").child(uid);
    userRef.set({
      'currentPoints': 0,
      'name': name,
      'pointsNeeded': 2,
      'profilePicUrl': 'link',
      'title': 'Basic Bunny',
      'unlockedTitles': {
        'Basic Bunny': 1
         }
    });
  }

 MyUser getUserData(){
    print("the uid is: " + uid);
    final userRef = databaseReference.child("user").child(uid);
    MyUser user = MyUser();
    userRef.once().then((DataSnapshot data){
      user.currentPoints = data.value['currentPoints'];
      user.level = data.value['level'];
      user.name = data.value['name'].toString();
      user.pointsNeeded = data.value['pointsNeeded'];
      user.profilePicUrl = data.value['profilePicUrl'];
      user.title = data.value['title'];
      // Map<dynamic, dynamic> achievements = data.value['unlockedAchievements'];
      // achievements.forEach((key, value) {
      //   if(value){
      //     Achievement newAchievement = Achievement(id: key, description: value["description"], type: value["type"]);
      //     user.unlockedAchievements.add(newAchievement);
      //   }
      // });
      //
      // Map<dynamic, dynamic> coupons = data.value['coupons'];
      // coupons.forEach((key, value) {
      //   if(value){
      //     Coupon newCoupon = Coupon(id: key, code: value["code"], entitlement: value["entitlement"]);
      //     user.unlockedCoupons.add(newCoupon);
      //   }
      // });
      //
      // Map<dynamic, dynamic> titles = data.value['titles'];
      // titles.forEach((key, value) {
      //   if(value){
      //     user.unlockedTitles.add(key);
      //   }
      // });

      print(user);

    });
    return user;
  }

}