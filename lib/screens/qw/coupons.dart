import 'package:cafe_bunny/components/custom_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafe_bunny/screens/qw/globals.dart' as gb;

import '../../constants.dart';

class Coupons extends StatefulWidget {
  static String routeName = "/coupons";
  @override
  _CouponsState createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Coupons',
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
                  radius: 60.0
              ),
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
              height: 350,
              width: 400,
              child: ListView.builder(
                itemCount: gb.inventory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.attach_money_rounded,
                        size: 56.0,
                        color: kPrimaryLightColor,
                      ),
                      title: Text(
                        gb.inventory[index].title,
                        style: TextStyle(
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {},
                      trailing: FlatButton(
                        onPressed: () {
                          setState(() {
                            print('Used coupon code: ${gb.inventory[index].code}');
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('${gb.inventory[index].title}'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Coupon code: ${gb.inventory[index].code}.'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Back'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          gb.inventory.remove(gb.inventory[index]);
                                        });
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        },
                        color: kPrimaryLightColor,
                        child: Text(
                          'USE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ]
        ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.coupons),
      );
    }
}

