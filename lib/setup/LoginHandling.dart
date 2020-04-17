import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;



class Auth {
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

  Future currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();                        //Check Login
    return user.uid;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }
}