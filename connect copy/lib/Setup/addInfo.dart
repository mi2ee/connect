import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:connect/Pages/MainPage.dart' as MainPage;
import 'package:connect/Setup/CheckLogin.dart';
import 'package:intl/intl.dart';

class AddInfo extends StatefulWidget {
  @override
  _AddInfoState createState() => new _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {

  //Firebase instances
  final db = FirebaseAuth.instance;
  final dbf = Firestore.instance;

  //Validator Key
  final _formKey = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();

  //Information variables
  String name = '',
      surname = '',
     nickname = '',
  description = '',
    interests = '';

  //Get current Date for CupertinoDatePicker
  var enteredDate = DateTime.now();
  String stringentereddate = DateFormat('dd.MM.yyyy').format(DateTime.now());

  //For fitting to each smartphone
  double sizeDependend;
  double spaceFirstSecondForm;
  int dividing;

  String path;//photo shown at beginning

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size.height ;
    if (size >= 700){
      sizeDependend = 50;//Button size
      spaceFirstSecondForm = 35;
      dividing = 3;//part of the screen for cupertino date picker
    }else{
      sizeDependend = 44;
      spaceFirstSecondForm = 20;
      dividing = 2;
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,

      body: ListView( children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[



          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                  child: Text('about you',                                                                                                                        //about you
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),





          SizedBox(height: 10.0),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                ResponsiveContainer(widthPercent: 30.0, heightPercent: 16.0,
                  child: GestureDetector(

                    onTap: () {
                        showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                        return Container(
                            height: 150,
                            child: Column(children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.photo_camera),
                                title: Text("Take a picture from Camera"),
                                onTap: () async{
                                  final cameras = await availableCameras();
                                  final firstCamera = cameras.first;
                                  Navigator.pop(context);
                                }
                              ),
                              ListTile(
                                leading: Icon(Icons.photo_library),
                                title: Text("Choose from photo Library"),
                                onTap: () async{
                                  final file = await ImagePicker.pickImage(source: ImageSource.gallery);
                                  print(file.path);
                                  setState(() {
                                    path = file.path;
                                  });
                                  Navigator.pop(context);
                                }
                              )
                            ]
                          ),
                        );
                      },
                    );
                    },



                    child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        child:  CircleAvatar(
                          backgroundImage: (path == null ? Image.asset("assets/LoadingScreen.jpg").image :
                              Image.file(File(path)).image),
                          radius: 100.0,
                        ),
                    ),
                  ),
                ),




                
                ResponsiveContainer(widthPercent: 50.0, heightPercent: 24.3,
                  child: Container(
                    child: Container(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'First Name',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',                                                                                                       //First Name
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green))),

                                  validator: (str) {
                                    if (str.length > 1) {
                                      return null;
                                    }else{
                                      return ('Your Name please');
                                    }
                                  },

                                  autocorrect: false,
                                  onChanged: (str) {
                                    setState(() => name = str);
                                  }
                              ),




                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',                                                                                                       //Last Name
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green))),

                                  validator: (str) {
                                    if (str.length > 1) {
                                      return null;
                                    }else{
                                      return ('Dude your Last Name!');
                                    }
                                  },

                                  autocorrect: false,
                                  onChanged: (str) {
                                    setState(() => surname = str);
                                  }
                              ),




                            ],
                          )),
                      ),
                    ),
                  )
                ],
              ),





              Container(
                padding: EdgeInsets.only(top: spaceFirstSecondForm, left: 20, right: 20),
                child: Form(
                    key: _formKeyTwo,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'How your Freinds call you...',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',                                                                                                                //Nickname
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),

                            validator: (str) {
                              if (str.length > 1) {
                                return null;
                              }else{
                                return ("You don't have any Friends?");
                              }
                            },

                            autocorrect: false,
                            onChanged: (str) {
                              setState(() => nickname = str);
                            }
                        ),






                        Container(
                          padding: EdgeInsets.only(top: spaceFirstSecondForm, left: 20.0, right: 20.0),
                          child: GestureDetector(


                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container( //TODO create void for it
                                    height: MediaQuery.of(context).size.height / dividing,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: sizeDependend,
                                          color: Colors.white,
                                          padding: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: RaisedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);},
                                                child: InkWell(
                                                  child: Text(
                                                    'Use',
                                                    style: TextStyle(                                                                                                    //DatePicker
                                                        color: Colors.green,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat',),
                                                  ),
                                                )
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: (MediaQuery.of(context).size.height / dividing) - sizeDependend,
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.date,
                                            initialDateTime: enteredDate,
                                            minimumYear: 1900,
                                            maximumDate: DateTime.now(),
                                            onDateTimeChanged: (DateTime newDate) {
                                              print(enteredDate);
                                              setState(() {
                                                enteredDate = newDate;
                                                stringentereddate = DateFormat('dd.MM.yyyy').format(newDate);
                                              });
                                          },
                                        )),



                                      ],
                                      ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,                                                                                                //Birthday Button
                                children: <Widget>[
                                  Center(
                                  ),
                                  SizedBox(width: 10.0),
                                  Center(
                                    child: Text('Your Birthday: ' + stringentereddate,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                    //TODO change to something better
                                )
                              ],
                            ),
                          ),
                        )),





                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'one sentence to describe yourself',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',                                                                                                               //describe yourself
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                            autocorrect: false,
                            onChanged: (str) {
                              setState(() => description = str);
                            }

                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'What is your greatest interest',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',                                                                                                                //Interests
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                            autocorrect: false,
                            onChanged: (str) {
                              setState(() => interests = str);
                            }

                        ),


                        SizedBox(height: 40.0),
                        Container(
                          height: 40.0,
                          child: GestureDetector(
                            onTap: () async{
                              int countFilled = 0;
                              if( _formKey.currentState.validate()){
                                countFilled = countFilled +1;
                              }
                              if (_formKeyTwo.currentState.validate()){
                                countFilled = countFilled +1;
                              }
                              if (enteredDate.day <= (DateTime.now().year - 16)){
                                countFilled = countFilled +1;
                              }else{
                                //TODO display red error message for Birthday
                              }

                              if (countFilled == 3) {
                                final FirebaseUser user = await db                                                                                                    //Finish Button
                                    .currentUser();


                                await dbf.collection("Users")
                                    .document(user.uid)
                                    .setData({
                                  'Name': name,
                                  'surname': surname,
                                  'Birthday': enteredDate,
                                  'nickname': nickname,
                                  'description': description,
                                  'interests': interests,
                                });


                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      CheckUser()), // button for Login
                                ); //Navigation
                              }




                            },
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: Colors.green,
                              elevation: 7.0,
                              child: Center(
                                child: Text(
                                  'Finish',                                                                            //Login Button
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),





                        SizedBox(height: 10,),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainPage.SecondRoute()),
                            );
                          },
                          child: Text(
                            'Why do we save em',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    )),
                  ),
             ],
            ),
          ),
        ],
      ),
      ],
    ));
  }
}


class cupertinopicker extends StatelessWidget {
Widget build(BuildContext context) {
  return Scaffold(
      body: Center (
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime(1969, 1, 1,),
            onDateTimeChanged: (DateTime newDateTime) {
              var newTod = TimeOfDay.fromDateTime(newDateTime);
            },
          )
      )
  );
  }
}
