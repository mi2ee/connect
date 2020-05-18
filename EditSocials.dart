
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:connect/Pages/MainPage.dart' as MainPage;



class EditSocials extends StatefulWidget {
  @override
  _EditSocialsState createState() => new _EditSocialsState();
}

class _EditSocialsState extends State<EditSocials> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                  child: Text('what you show',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.0),

          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Instagram',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',                                                              //Email- Email Registration
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'SnapChat',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',                                                              //Email- Email Registration
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Twitter',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',                                                              //Email- Email Registration
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'FaceBook',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',                                                              //Email- Email Registration
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Skype',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',                                                              //Email- Email Registration
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Website',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',                                                              //Email- Email Registration
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),



                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: GestureDetector(
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage.SecondRoute()),
                          );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: Center(
                            child: Text(
                              'next',                                                                            //Login Button
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
    );
  }
}