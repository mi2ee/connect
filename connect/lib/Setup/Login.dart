import 'package:flutter/material.dart';
import 'package:connect/Setup/LoginHandling.dart' as LoginHandling;
import 'package:connect/Setup/Register.dart' as Register;
import 'package:connect/Setup/CheckLogin.dart' as CheckLogin;
import 'package:connect/Setup/reset.dart' as Resetpassword;




class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = '',
       password ='',
       message = 'hi';
  final _formKey = GlobalKey<FormState>();
  final _signInOut = LoginHandling.Auth();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ListView( children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[



            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Hello',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),                                           //Hello There text
                    child: Text('There',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  )
                ],
              ),
            ),






            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child:Form (
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',                                                         //Email- Email Login
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),


                            validator: (str) {
                              if (str.contains('@') && (str.length > 2)) {
                                return null;
                              }else{
                                return ('Email not valid');
                              }
                            },
                            autocorrect: false,
                            onChanged: (str){
                              setState(() => email = str);
                            }
                          ),




                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',                                                        //Password- Email Login
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),




                            obscureText: true,
                            validator: (str) {
                              if (str.contains('') && (str.length > 5)) {
                                return null;
                              }else{
                                return ('password not valid');
                              }
                            },

                            autocorrect: false,
                            onChanged: (str){
                              setState(() => password = str);
                            }
                          ),



                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Resetpassword.ResetPage()), //Link to Information page
                            );

                          },
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(                                                                    //Forgot password field
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ),
                      ),






                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () async{

                            if (_formKey.currentState.validate()){
                              dynamic result = await _signInOut.LoginEmail(email, password);
                              if (result != null)
                                print(result.user);
                                print('signed in Successfully');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CheckLogin.CheckUser()), //Link to Information page
                                );
                            }else{
                              print('error');
                            }
                          },



                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: Center(
                              child: Text(
                                'LOGIN',                                                                       //Login Button
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),






                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: () async{
                            dynamic result = await _signInOut.handleGSignIn();//Login command
                            if (result == null) {
                              print ('Login Failed');
                            }else{
                              print ('Logged in with');
                              print(result.uid);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CheckLogin.CheckUser()), //Link to Information page
                              );
                            }
                            },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,                                //Sign in with Google
                              children: <Widget>[
                                Center(
                                ),
                                SizedBox(width: 10.0),
                                Center(
                                  child: Text('Log in / Register with Google',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,

                                          fontFamily: 'Montserrat')),
                              )
                            ],
                          ),
                        ),
                      )
                    )
                  ],
                )),
              ),
              SizedBox(height: 15.0),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to connect ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register.RegisterPage()), //Link to Information page
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )

          ],
        ),
    ]
    ),
    );

  }
}