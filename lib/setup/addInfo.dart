import 'package:connect/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

class AddInfo extends StatefulWidget {
  @override
  _AddInfoState createState() => new _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {



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
                  child: Text('about you',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Row(


            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              ResponsiveContainer(widthPercent: 30.0, heightPercent: 16.0,
                child: Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    child:  CircleAvatar(
                      backgroundImage: AssetImage("assets/images/HenriKlein.jpeg"),
                      radius: 100.0,
                    ),
                  // Image.asset("assets/images/HenriKlein.jpeg")
                ),
              ),
              ResponsiveContainer(widthPercent: 50.0, heightPercent: 20.0,
                child: Container(
                  child: Container(
                    child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',                                                              //Email- Email Registration
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))),

                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',                                                              //Email- Email Registration
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))),

                            ),



                          ],
                        )),
                  ),
                ),
              )
            ],
          ),

          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'How do Friends call you',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',                                                              //Email- Email Registration
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'When is your Birthday',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',                                                              //Email- Email Registration
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'one sentence to describe yourself',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',                                                              //Email- Email Registration
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'What is your greatest interest',
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
                            MaterialPageRoute(builder: (context) => StartApp()),
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
                          MaterialPageRoute(builder: (context) => StartApp()),
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