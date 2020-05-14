import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;



class Auth {


  User _firebaseUserFromFirebase (FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;                                           //return uid if user has value -> asign value to User
  }


  Stream<User> get user {                                                                  //<User> means that we use our own class for the way we store it
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _firebaseUserfromFirebase(user));                   //used in main.dart for the stream
        .map(_firebaseUserFromFirebase);                                                 //listen for auth changes form firebase & map them
  }

  Stream<User> get users {                                                                  //<User> means that we use our own class for the way we store it
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _firebaseUserfromFirebase(user));                   //used in main.dart for the stream
        .map(_firebaseUserFromFirebase);                                                 //listen for auth changes form firebase & map them
  }

  Future handleGSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
                                                                                              //Google Sign In
      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.uid);
      return user;


    }catch(e){
      print(e);
      return null;
    }
  }


  Future RegisterEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(result);

      return result;                                                                          //Register with Email
    }catch(e){
      print (e);
      return null;
    }
  }


  Future LoginEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      //final FirebaseUser user = await
      print(result);
      return result;                                                                         //Login with Email
    }catch(e){
      print (e);
      return null;
    }
  }


  Future resetPassword(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }catch(e){                                                                              //reset password
      print('failed to send reset email');
      return null;
    }

  }


  Future handleGSignOut() async {
    try {
      return await _auth.signOut();                                                          //Sign Out
    }catch(e){
      print(e);
    }
  }

}

class User {

  final String uid;                                                                       //Class containing current user information (uid)

  User({ this.uid });

}