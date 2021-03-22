import 'package:firebase_auth/firebase_auth.dart';
import 'package:cafe_bunny/classes/User.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _userFromFirebaseUser(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser> get user{
    return _auth.authStateChanges()
      // .map((User user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}