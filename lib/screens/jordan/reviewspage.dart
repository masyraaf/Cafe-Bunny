import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:cafe_bunny/screens/jordan/reviewspage.dart';
import 'package:cafe_bunny/screens/jordan/review.dart';

class ReviewsPage extends StatefulWidget {
  final int id;
  final String name;
  //const DetailsPage(this.id);
  ReviewsPage({Key key, @required this.id, @required this.name})
      : super(key: key);
  Reviews createState() => Reviews();
}

class Reviews extends State<ReviewsPage> {
  int id;
  var name;
  var retrieved;
  List<SingleReview> reviewsList = [];
  final _textEditingController = TextEditingController();
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reviews'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot != null) {
                  if (reviewsList.isNotEmpty) {
                    return Scrollbar(
                        child: ListView.builder(
                            itemCount: reviewsList.length,
                            itemBuilder: (_, index) {
                              return reviewsUI(
                                  reviewsList[index].date,
                                  reviewsList[index].review,
                                  reviewsList[index].username);
                            }));
                  } else {
                    print("oh no 1");
                    return Center(child: CircularProgressIndicator());
                  }
                } else {
                  print("oh no 2");
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            AddReviewDialog(context);
          },
          child: const Icon(Icons.add),
          tooltip: 'Add Review',
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Colors.blueAccent,
            child: Container(
              height: 48,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      iconSize: 45,
                      color: Colors.white,
                      tooltip: "Back to Home",
                      icon: const Icon(
                        Icons.home,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                    )
                  ]),
            )));
  }

  Widget reviewsUI(String date, String review, String username) {
    return Container(
        alignment: Alignment.center,
        height: 150,
        child: Card(
            elevation: 10,
            margin: EdgeInsets.all(15),
            child: Center(
                child: Column(children: <Widget>[
              Container(
                  height: 30,
                  color: Colors.blue.shade300,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 90),
                        Text(
                          date,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                          textAlign: TextAlign.center,
                        )
                      ])),
              SizedBox(
                height: 10,
              ),
              Align(
                child: ListTile(
                  title: Text(
                    review,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    textAlign: TextAlign.center,
                  ),
                ),
                alignment: Alignment.center,
              ),
              /*Center(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  child: Text(review,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center))*/
            ]))));
  }

  AddReviewDialog(BuildContext context) async {
    _textEditingController.clear();
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return AlertDialog(
            content: new SizedBox(
                height: 400,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Add Review",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 23),
                          ),
                          SizedBox(width: 6),
                          Image.asset(
                            'assets/review3.png',
                            width: 30,
                            height: 30,
                          )
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    new Expanded(
                        child: new TextField(
                      controller: _textEditingController,
                      maxLines: 10,
                      autofocus: true,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: 'Enter your review here',
                        /*labelText: 'Add Review',
                          labelStyle: TextStyle(
                            fontSize: 24,
                          ),*/
                      ),
                    )),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new FlatButton(
                              child: const Text(
                                'Add',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blueAccent),
                              ),
                              onPressed: () {
                                setState(() => addReview(
                                    _textEditingController.text.toString()));
                                Navigator.pop(context);
                              }),
                          new FlatButton(
                              child: const Text('Cancel',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blueAccent)),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ])
                  ],
                )),
            /*actions: <Widget>[
              new FlatButton(
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('Cancel', style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],*/
          );
        });
  }

  getData() async {
    var refs;
    DataSnapshot data =
        await databaseReference.child('Cafes/' + name + '/reviews').once();
    /*.orderByChild('id')
        .equalTo(id)
        .once();*/
    print("YESSIR");
    /*.orderByChild('id')
        .equalTo(id)
        .once();*/
    /*.then((DataSnapshot snapshot) {
      refs = snapshot.value;
      value = snapshot.value;
      print(value);
    });*/
    //var cafeid = 'cafe' + id.toString();
    //print(cafeid);
    //rint(data.value);
    //refs = data.value;
    //retrieved = data.value[cafeid]['reviews'];
    retrieved = data.value.values;
    //print(retrieved.elementAt(0));
    print(retrieved);
    reviewsList = [];
    /*for (var i in retrieved) {
      reviewsList.add(i);
    }
    print("The reviews are $reviewsList");*/
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    var formattedDate = formatter.format(now);
    var keys = data.value.keys;
    var values = data.value;
    for (var i in keys) {
      SingleReview review = new SingleReview(
          values[i]['date'], values[i]['review'], values[i]['username']);
      reviewsList.add(review);
    }
    reviewsList.sort((a, b) {
      return DateTime.parse(b.date).compareTo(DateTime.parse(a.date));
    });
    print('The reviews are $reviewsList');
    print('The DATE IS NOW ' + formattedDate); // 2016-01-25
    return retrieved;
  }

  addReview(String review_statement) {
    if (review_statement.length > 0) {
      var now = DateTime.now();
      var formatter = DateFormat('yyyy-MM-dd');
      var formatted = formatter.format(now);
      var review =
          new SingleReview(formatted, review_statement.toString(), 'Terry Tan');
      databaseReference
          .child('Cafes/' + name + '/reviews')
          .push()
          .set(review.toJson());
    }
  }

  void initState() {
    super.initState();
    id = widget.id;
    name = widget.name;
    //DatabaseReference ref = FirebaseDatabase.instance.reference();
    /*ref.once().then((DataSnapshot snapshot) async {
      print(2234);
      value = snapshot.value;
      print(value);
    });*/
    print(33445);
    getData();
  }
}
