import 'package:cafe_bunny/components/custom_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafe_bunny/screens/qw/globals.dart' as gb;
import 'package:cafe_bunny/screens/qw/couponClass.dart';
import '../../constants.dart';

class Coupon2 extends StatefulWidget {
  static String routeName = "/coupon2";
  @override
  _Coupon2State createState() => _Coupon2State();
}

class _Coupon2State extends State<Coupon2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      backgroundColor: Colors.white,
      //drawer: ArgonDrawer(currentPage: "Profile"),
      body: Stack(children: <Widget>[
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage("images/background2.png"),
                    fit: BoxFit.fitWidth))),
        SafeArea(
          child: ListView(children: [
            Padding(
              padding:
              const EdgeInsets.only(left: 16.0, right: 16.0, top: 74.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset:
                            Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: .0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 85.0, bottom: 20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          FlatButton(
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
                                            color: Color.fromRGBO(17, 205, 239, 1.0),
                                            child: Text(
                                              '+ HOP',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              setState(() {
                                                gb.hopCount = 0;
                                                gb.playerLevel = 1;
                                                gb.hopCount = 0;
                                                gb.expFlag = 0;
                                              });
                                            },
                                            color: Color.fromRGBO(23, 43, 77, 1.0),
                                            child: Text(
                                              '! HOP',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30.0),
                                      Align(
                                        child: Text("${gb.playerName}",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    50, 50, 93, 1),
                                                fontSize: 28.0)),
                                      ),
                                      SizedBox(height: 10.0),
                                      Align(
                                        child: Text('"${gb.playerTitle}"',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    50, 50, 93, 1),
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      SizedBox(height: 30.0),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text("${gb.expFlag}/2",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          82, 95, 127, 1),
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text("Experience",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          50, 50, 93, 1),
                                                      fontSize: 12.0))
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text("${gb.playerLevel}",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          82, 95, 127, 1),
                                                      fontSize: 30.0,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text("Player Level",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          50, 50, 93, 1),
                                                      fontSize: 12.0))
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text("${gb.hopCount}",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          82, 95, 127, 1),
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text("Cafe Hops",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          50, 50, 93, 1),
                                                      fontSize: 12.0))
                                            ],
                                          )
                                        ],
                                      ),
                                      Divider(
                                        height: 40.0,
                                        thickness: 1.5,
                                        indent: 32.0,
                                        endIndent: 32.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 25.0, left: 25.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Achievement",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                  color: Color.fromRGBO(94, 114, 228, 1.0)),
                                            ),
                                            Text(
                                              "Status",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(94, 114, 228, 1.0),
                                                  fontSize: 13.0,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    FractionalTranslation(
                        translation: Offset(0.0, -0.5),
                        child: Align(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "images/avatar2.jpg"),
                            radius: 65.0,
                            // maxRadius: 200.0,
                          ),
                          alignment: FractionalOffset(0.5, 0.0),
                        )),
                  ]),
                ],
              ),
            ),
          ]),
        ),
      ]
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.achievements),
    );
  }
}
