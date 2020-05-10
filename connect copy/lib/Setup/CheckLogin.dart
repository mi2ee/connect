import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:connect/Setup/Login.dart' as Login;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connect/Pages/MainPage.dart' as MainPage;
import 'package:connect/Setup/addInfo.dart' as addInfo;

enum LoginState {
  NotLoggedIn,
  NoInfo,
  EverythingFound
}


// ignore: must_be_immutable
class CheckUser extends StatelessWidget {
  LoginState storageType;
  final db = FirebaseAuth.instance;
  final dbf = Firestore.instance;
  @override
  Widget build(BuildContext context) {

    Future<bool> checkUserFolder(FirebaseUser user) async{
      bool exists = false;
       await Firestore.instance
          .collection('Users')
          .document(user.uid)
          .get()
          .then((doc) {
        if (doc.exists) {
          exists = true;
        } else {
          exists = false;}
      });
      print(exists);
      return exists;
    }

    Future<LoginState> getUserData() async {
      final FirebaseUser user = await db.currentUser();;
      print(user);

      if (user != null){
        bool exist = await checkUserFolder(user);

        if (exist == true){
          return LoginState.EverythingFound;
        }else if (exist == false){
          return LoginState.NoInfo;
        }else{
          return LoginState.NotLoggedIn;
        }

      }else {
        print('No User');
        return LoginState.NotLoggedIn;
        }
    }

    return FutureBuilder <LoginState>(
        future: getUserData(),
        builder: (BuildContext context, AsyncSnapshot<LoginState> snapshot){

          if (snapshot.hasData) {
            print(snapshot.data);
            print('down here');
            if (snapshot.data == LoginState.EverythingFound){
            return MainPage.SecondRoute();

            }else if (snapshot.data == LoginState.NoInfo){
              return addInfo.AddInfo();

            }else{
              return Login.LoginPage();
            }

          } else if (snapshot.hasError) {
            Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
            );
            Padding(
            padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            );
            //TODO add path to LoginPage (maybe with button...)
          } else {
            SizedBox(
              child: CircularProgressIndicator(),
            width: 60,
            height: 60,
            );
            const Padding(
            padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            );
            }
          return LoadingScreen();
          },

    );

}
}


//TODO think of a better Loadingscreen
class LoadingScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text(
        'Loading...',
        style: TextStyle(
          color: Colors.white,
        ),
       )
      )
    );
  }

}