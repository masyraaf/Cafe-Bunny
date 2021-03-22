import 'package:cafe_bunny/components/custom_bottom_nav_bar.dart';
import 'package:cafe_bunny/constants.dart';
import 'package:flutter/material.dart';
import 'package:cafe_bunny/screens/qw/globals.dart' as gb;
import 'package:cafe_bunny/screens/qw/couponClass.dart';

class Achievements extends StatefulWidget {
  static String routeName = "/achievements";
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {

  bool checkLvl(int level){
    if(gb.playerLevel >= level) return true;
    else return false;
  }

  bool checkHop(int hop){
    if(gb.hopCount >= hop) return true;
    else return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Achievements',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget> [
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              CircleAvatar(
              backgroundImage: AssetImage('images/avatar1.png'),
              radius: 60.0),
              SizedBox(width: 10),
              Container(
                color: kPrimaryLightColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40,5,40,5),
                  child: Text(
                    '${gb.playerName}\n"${gb.playerTitle}"\nLevel ${gb.playerLevel}\nEXP ${gb.expFlag}/2\n${gb.hopCount} Cafes Visited',
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ]
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 400,
            width: 400,
            child: ListTileTheme(
              selectedTileColor: Colors.blue,
              child: ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.auto_awesome,
                        size: 56.0,
                        color: kPrimaryLightColor,
                      ),
                      title: Text('"Baby Bunny"'),
                      subtitle: Text('Hop 3 times'),
                      onTap: () {
                        print('Baby Bunny');
                      },
                      enabled: checkHop(3),
                      trailing: !checkHop(3) ? Text('${gb.hopCount}/3', style: TextStyle(color: Colors.grey, fontSize: 20,),):
                          !gb.babybunny? FlatButton(onPressed: () {setState(() {
                            // Critical code
                            gb.babybunny = true;
                            print('"Baby Bunny" claimed');
                          });}, color: kPrimaryLightColor, child: Text('CLAIM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),),):
                              Text('CLAIMED', style: TextStyle(color: kPrimaryLightColor, fontWeight:FontWeight.bold, fontSize: 20,),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                          Icons.attach_money_rounded,
                          size: 56.0,
                          color: kPrimaryLightColor,
                      ),
                      title: Text('Coupon 1'),
                      subtitle: Text('Reach Player Level 5'),
                      onTap: () {
                        print('Coupon 1');
                      },
                      enabled: checkLvl(5),
                      trailing: !checkLvl(5) ? Text('${gb.playerLevel}/5', style: TextStyle(color: Colors.grey, fontSize: 20,),):
                      !gb.coupon1? FlatButton(onPressed: () {setState(() {
                        // Critical code
                        gb.coupon1 = true;
                        print('Coupon 1 claimed');
                        gb.inventory.add(Coupon(title: 'Coupon 1', code: '1111'));
                      });}, color: Colors.blue, child: Text('CLAIM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),),):
                      Text('CLAIMED', style: TextStyle(color: kPrimaryLightColor, fontWeight:FontWeight.bold, fontSize: 20,),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.attach_money_rounded,
                        size: 56.0,
                        color: kPrimaryLightColor,
                      ),
                      title: Text('Coupon 2'),
                      subtitle: Text('Reach Player Level 10'),
                      onTap: () {
                        print('Coupon 2');
                      },
                      enabled: checkLvl(10),
                      trailing: !checkLvl(10) ? Text('${gb.playerLevel}/10', style: TextStyle(color: Colors.grey, fontSize: 20,),):
                      !gb.coupon2? FlatButton(onPressed: () {setState(() {
                        // Critical code
                        gb.coupon2 = true;
                        print('Coupon 2 claimed');
                        gb.inventory.add(Coupon(title: 'Coupon 2', code: '2222'));
                      });}, color: kPrimaryLightColor, child: Text('CLAIM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),),):
                      Text('CLAIMED', style: TextStyle(color: kPrimaryLightColor, fontWeight:FontWeight.bold, fontSize: 20,),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.auto_awesome,
                        size: 56.0,
                        color: kPrimaryLightColor,
                      ),
                      title: Text('"Buffet Bunny"'),
                      subtitle: Text('Hop 10 times'),
                      onTap: () {
                        print('Buffet Bunny');
                      },
                      enabled: checkHop(10),
                      trailing: !checkHop(10) ? Text('${gb.hopCount}/10', style: TextStyle(color: Colors.grey, fontSize: 20,),):
                      !gb.buffetbunny? FlatButton(onPressed: () {setState(() {
                        // Critical code
                        gb.buffetbunny = true;
                        print('"Buffet bunny" claimed');
                      });}, color: kPrimaryLightColor, child: Text('CLAIM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),),):
                      Text('CLAIMED', style: TextStyle(color: kPrimaryLightColor, fontWeight:FontWeight.bold, fontSize: 20,),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.attach_money_rounded,
                        size: 56.0,
                        color:kPrimaryLightColor,
                      ),
                      title: Text('Coupon 3'),
                      subtitle: Text('Reach Player Level 15'),
                      onTap: () {
                        print('Coupon 3');
                      },
                      enabled: checkLvl(15),
                      trailing: !checkLvl(15) ? Text('${gb.playerLevel}/15', style: TextStyle(color: Colors.grey, fontSize: 20,),):
                      !gb.coupon3? FlatButton(onPressed: () {setState(() {
                        // Critical code
                        gb.coupon3 = true;
                        print('Coupon 3 claimed');
                        gb.inventory.add(Coupon(title: 'Coupon 3', code: '3333'));
                      });}, color: kPrimaryLightColor, child: Text('CLAIM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),),):
                      Text('CLAIMED', style: TextStyle(color: kPrimaryLightColor, fontWeight:FontWeight.bold, fontSize: 20,),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.attach_money_rounded,
                        size: 56.0,
                        color: kPrimaryLightColor,
                      ),
                      title: Text('Coupon 4'),
                      subtitle: Text('Reach Player Level 20'),
                      onTap: () {
                        print('Coupon 4');
                      },
                      enabled: checkLvl(20),
                      trailing: !checkLvl(20) ? Text('${gb.playerLevel}/20', style: TextStyle(color: Colors.grey, fontSize: 20,),):
                      !gb.coupon4? FlatButton(onPressed: () {setState(() {
                        // Critical code
                        gb.coupon4 = true;
                        print('Coupon 4 claimed');
                        gb.inventory.add(Coupon(title: 'Coupon 4', code: '4444'));
                      });}, color:kPrimaryLightColor, child: Text('CLAIM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),),):
                      Text('CLAIMED', style: TextStyle(color:kPrimaryLightColor, fontWeight:FontWeight.bold, fontSize: 20,),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.auto_awesome,
                        size: 56.0,
                        color: Colors.blueAccent,
                      ),
                      title: Text('"Super Bunny"'),
                      subtitle: Text('Hop 20 times'),
                      onTap: () {
                        print('Super Bunny');
                      },
                      enabled: checkHop(20),
                      trailing: !checkHop(20) ? Text('${gb.hopCount}/20', style: TextStyle(color: Colors.grey, fontSize: 20,),):
                      !gb.superbunny? FlatButton(onPressed: () {setState(() {
                        // Critical code
                        gb.superbunny = true;
                        print('"Super bunny" claimed');
                      });}, color: kPrimaryLightColor, child: Text('CLAIM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),),):
                      Text('CLAIMED', style: TextStyle(color: kPrimaryLightColor, fontWeight:FontWeight.bold, fontSize: 20,),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.achievements),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              gb.hopCount += 1;
              if(gb.expFlag==0) gb.expFlag += 1;
              else{
                gb.expFlag = 0;
                gb.playerLevel += 1;
              }
            });
          },
          backgroundColor: kPrimaryLightColor,
          tooltip: 'Increment',
          child: Text('HOP!'),
        ),
      ),
    );
  }
}
