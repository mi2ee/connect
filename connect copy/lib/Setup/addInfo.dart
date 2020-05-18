import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:connect/Pages/MainPage.dart' as MainPage;
import 'package:connect/Setup/CheckLogin.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/services.dart';

class AddInfo extends StatefulWidget {
  @override
  _AddInfoState createState() => new _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {

  int agelimit = 16;

  //Firebase instances
  final db = FirebaseAuth.instance;
  final dbf = Firestore.instance;
  final dbs = FirebaseStorage.instance;

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
  double sizedependend;
  double spaceFirstSecondForm;
  int dividing;
  double percentageprofilepicheight;
  double percentageprofilepicheightNoInfo;
  double finishanswersspacing;
  double spaceradioupperform;

  String path;//photo shown at beginning

  void _showCamera() async {
    final cameras = await availableCameras();
    print(cameras);

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakePicturePage(camera: cameras)));
    if (result != null) {
      setState(() {
        path = result;
      });
    }
  }

  int gender;
  String radioButtonItem = 'ONE';
  bool radioNotButtonPushed = false;

  bool noValidInfoFirstForm = false;

  bool tooYoung = false;

  bool dateNotChanged = false;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size.height ;
    if (size >= 750){
      sizedependend = 50;//Button size
      spaceFirstSecondForm = 0;
      percentageprofilepicheight = 23;
      percentageprofilepicheightNoInfo = 28;
      finishanswersspacing = 30;
      spaceradioupperform = 18;
      dividing = 3;//part of the screen for cupertino date picker
    }else{
      sizedependend = 44;
      spaceFirstSecondForm = 0;
      percentageprofilepicheight = 25;
      percentageprofilepicheightNoInfo = 34.1;
      finishanswersspacing = 15;
      spaceradioupperform = 0;
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
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _showCamera();
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




                
                ResponsiveContainer(widthPercent: 50.0, heightPercent: radioNotButtonPushed || noValidInfoFirstForm ? percentageprofilepicheightNoInfo : percentageprofilepicheight,
                  child: Container(
                    child: Container(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                              SizedBox(height: radioNotButtonPushed || noValidInfoFirstForm ? 0 : spaceradioupperform),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Radio(
                                    value: 0,
                                    groupValue: gender,
                                    activeColor: Colors.blue,
                                    onChanged: (val) {
                                      setState(() {
                                        radioButtonItem = 'male';
                                        gender = 0;
                                      });
                                    },
                                  ),
                                  Text(
                                    'male',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',                                                                                                                //Interests
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),

                                  Radio(
                                    value: 1,
                                    groupValue: gender,
                                    activeColor: Colors.purple,
                                    onChanged: (val) {
                                      setState(() {
                                        radioButtonItem = 'female';
                                        gender = 1;
                                      });
                                    },
                                  ),
                                  Text(
                                    'female',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',                                                                                                                //Interests
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 0, left: 15),
                                width: double.infinity,
                                child: radioNotButtonPushed ? Text('Select your gender!',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13,
                                    color: Color.fromRGBO(216, 74, 74, 1)
                                  )
                                ):
                                SizedBox(),
                              )

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
                          padding: EdgeInsets.only(top:18),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container( //TODO create void for it
                                    height: MediaQuery.of(context).size.height / dividing,
                                    child: Column(
                                      children: <Widget>[
                                        //Container(
                                          //height: sizedependend,
                                          //color: Colors.white,
                                          //padding: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                                          //child: Align(
                                            //alignment: Alignment.centerRight,
                                            //child: RaisedButton(
                                                //onPressed: () {
                                                  //Navigator.pop(context);},
                                                //child: InkWell(
                                                  //child: Text(
                                                    //'Use',
                                                    //style: TextStyle(                                                                                                    //DatePicker
                                                        //color: Colors.green,
                                                        //fontWeight: FontWeight.bold,
                                                        //fontFamily: 'Montserrat',),
                                                //  ),
                                              //  )
                                            //),
                                          //),
                                        //),
                                        Container(
                                          height: (MediaQuery.of(context).size.height / dividing),
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.date,
                                            initialDateTime: enteredDate,
                                            minimumYear: 1900,
                                            maximumYear: DateTime.now().year,
                                            onDateTimeChanged: (DateTime newDate) {
                                              setState(() {
                                                enteredDate = newDate;
                                                stringentereddate = DateFormat('dd.MM.yyyy').format(newDate);
                                                dateNotChanged = false;
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
                              //width: (MediaQuery.of(context).size.width),
                              decoration: BoxDecoration(
                                border: Border
                                  (bottom: BorderSide(width: 1.0, color: tooYoung || dateNotChanged ? Color.fromRGBO(216, 74, 74, 1): Colors.grey),),
                                color: Colors.transparent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,                                                                                                //Birthday Button
                                children: <Widget>[


                                  Center(
                                    child: Text('Your Birthday:   ' + stringentereddate,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',                                                                                                               //describe yourself
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.grey)
                                    ),
                                )
                              ],
                            ),
                          ),
                         ),
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 7, left: 0),
                          width: double.infinity,
                          child: tooYoung ? Text('Sorry you need to be at lest $agelimit years old',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 13,
                            color: Color.fromRGBO(216, 74, 74, 1)
                            )
                          ):
                          dateNotChanged ? Text('Please enter a date...',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13,
                                color: Color.fromRGBO(216, 74, 74, 1)
                            )
                          ): SizedBox(),
                        ),



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

                              //Calculate age:
                              int yearAge = DateTime.now().year - enteredDate.year;
                              int bdayMonth = enteredDate.month;
                              int currentMonth = DateTime.now().month;
                              int age = 420;

                              if (currentMonth < bdayMonth) {
                                age = yearAge - 1;
                              }else if (currentMonth == bdayMonth) {
                                int currentDay = DateTime.now().day;
                                int bdayDay = enteredDate.day;
                                print('esle if');
                                if (currentDay < bdayDay) {
                                  age = yearAge - 1;
                                }else{
                                  age = yearAge;
                                }
                              }else{
                                age = yearAge;
                              }
                              print(age);


                              int countFilled = 0;
                              if( _formKey.currentState.validate()){
                                countFilled = countFilled +1;
                                setState(() {
                                  noValidInfoFirstForm = false;//valid info enter
                                });
                              }else{
                                setState(() {
                                  noValidInfoFirstForm = true;
                                });
                              }



                              if (_formKeyTwo.currentState.validate()){
                                countFilled = countFilled +1;
                              }



                              if (age >= agelimit){
                                countFilled = countFilled +1;
                                tooYoung = false;
                              }else if (enteredDate.day == DateTime.now().day && enteredDate.year == DateTime.now().year){
                                setState(() {
                                  dateNotChanged = true;
                                });
                              }else{
                                print('nope');
                                setState(() {
                                  tooYoung = true;
                                });
                              }


                              if (radioButtonItem != 'ONE'){
                                countFilled = countFilled + 1;
                                setState(() {
                                  radioNotButtonPushed = false;
                                });
                              }else {
                                setState(() {
                                  radioNotButtonPushed = true;
                                });
                              }


                              if (countFilled == 4) {


                                final FirebaseUser user = await db.currentUser();//Finish Button
                                final uid = user.uid;

                                StorageReference dbsReference = dbs.ref().child("$uid/Profilepic" );
                                final StorageUploadTask uploadTask = dbsReference.putFile(File(path));
                                final String url = (await (await uploadTask.onComplete).ref.getDownloadURL());


                                await dbf.collection("Users")
                                    .document(user.uid)
                                    .setData({
                                  'Name': name,
                                  'surname': surname,
                                  'Gender': radioButtonItem,
                                  'Birthday': enteredDate,
                                  'nickname': nickname,
                                  'description': description,
                                  'interests': interests,
                                  'ProfilePicUrl' : url,
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





                        SizedBox(height: finishanswersspacing,),
                        Container(
                          height: 30,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MainPage.SecondRoute()),
                              );//TODO add sheet
                            },
                            child: Text(
                              'Why do we save em',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                        ))
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






class TakePicturePage extends StatefulWidget {
  final camera;
  TakePicturePage({@required this.camera});

  @override
  _TakePicturePageState createState() => _TakePicturePageState();
}

class _TakePicturePageState extends State<TakePicturePage> {

  double buttonsize = 80;
  bool camerafrontback = true; //false is world view

  CameraController _cameraController;



  Future<void> _initializeCameraControllerFuture;
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    if (camerafrontback != true) {
      _cameraController =
          CameraController(widget.camera[0], ResolutionPreset.veryHigh);
    }else{
      _cameraController =
          CameraController(widget.camera[1], ResolutionPreset.veryHigh);
    }
    _initializeCameraControllerFuture = _cameraController.initialize();
  }




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width ;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.clear),
          color: Colors.grey.withOpacity(0.8),
          iconSize: 40,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (camerafrontback == true){
                  camerafrontback = false;
              }else{
                  camerafrontback = true;
              }
              setState(_init);
            },
            icon: Icon(Icons.swap_horiz),
            color: Colors.grey.withOpacity(0.8),
            iconSize: 40,
            )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),




      body: FutureBuilder(
        future: _initializeCameraControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
            //TODO create overlay
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),



      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: buttonsize,
          width: buttonsize,
          child: FittedBox(
            child: FloatingActionButton(


              onPressed: () async{
                try {
                  await _initializeCameraControllerFuture;
                  final path =  Path.join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
                  await _cameraController.takePicture(path);
                  Navigator.pop(context,path);
                } catch (e) {
                  print(e);
                }
              },


              child: Icon(Icons.camera_alt,color: Colors.white.withOpacity(0.75)),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              shape: CircleBorder(side: BorderSide(color: Colors.white.withOpacity(0.25), width: 2.0)),
            ),
          ),
        ),
      );
  }
}
