import 'package:connect/Setup/CheckLogin.dart';
import 'package:connect/Setup/LoginHandling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect/Pages/MainPage.dart' as MainPage;
import 'package:provider/provider.dart';


class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => new _InformationPageState();
}

class _InformationPageState extends State<InformationPage>{

  String name = '',
      surname = '';
          //uid = '';
  final db = FirebaseAuth.instance;
  final dbf = Firestore.instance;
  //FirebaseUser user = FirebaseAuth.instance.currentUser() as FirebaseUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

          child: Container (
              child: Column (
                children: <Widget> [
                  Container (
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[100]))
                      ),



                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "First Name",
                            hintStyle: TextStyle(color: Colors.grey[400])    //Email field
                        ),
                        autocorrect: false,
                        onChanged: (str) {
                          setState(() => name = str);
                        }
                      ),



                  ),
                  Container (
                    padding: EdgeInsets.all(8.0),



                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Sirname",
                          hintStyle: TextStyle(color: Colors.grey[400])    //Password field

                      ),
                      autocorrect: false,
                      onChanged: (str) {
                        setState(() => surname = str);
                      }
                    ),



                  ),
                  Container (
                    child: RaisedButton(
                      child: Text('Login/Registrieren'),
                        onPressed: () async{

                          final FirebaseUser user = await db.currentUser();

                          await dbf.collection("Users")
                              .document(user.uid)
                              .setData({
                            'Name': name,
                            'sirname': surname,
                            'extra' :'It fucking works!!'
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CheckUser()),   // button for Login
                          ); //Navigation


                        } // Button(Gesture)
                  ),
                  ),
                ],
              ),
          ),
      ),
    );
  }
}
