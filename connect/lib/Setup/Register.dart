import 'package:flutter/material.dart';
import 'package:connect/Setup/LoginHandling.dart' as LoginHandling;
import 'package:connect/Setup/EnterInformation.dart' as EnterInformation;
import 'package:connect/Setup/addInfo.dart' as addInfo;




class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String email = '',
      password = '';
  final _formKey = GlobalKey<FormState>();
  final _signInOut = LoginHandling.Auth();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView( children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                    child: Text('Register',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 160.0, 0.0, 0.0),                                           //Hello There text
                    child: Text('now',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(160.0, 160.0, 0.0, 0.0),
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
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',                                                              //Email- Email Registration
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),


                          validator: (str) {
                            if (str.contains('@') && (str.length > 2)) {
                              return null;
                            } else {
                              return ('Email not valid');
                            }
                          },

                          autocorrect: false,
                          onChanged: (str) {
                            setState(() => email = str);
                          }


                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',                                                            //Password- Email Login
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),


                          obscureText: true,
                          validator: (str) {
                            if (str.length > 5) {
                              return null;
                            } else {
                              return ('Ur password must have at least 5 characters');
                            }
                          },

                          autocorrect: false,
                          onChanged: (str) {
                            setState(() => password = str);
                          }
                      ),






                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () async{

                            if (_formKey.currentState.validate()){

                              dynamic result = await _signInOut.RegisterEmail(email, password);

                              if (result != null){
                                print('valid');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => addInfo.AddInfo()), //Link to Information page
                                );
                              }else{
                                print('you dick');
                              }
                            }else{
                              print('not valid');
                            }



                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: Center(
                              child: Text(
                                'Register',                                                                            //Login Button
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
                            onTap: () async {
                              dynamic result = await _signInOut
                                  .handleGSignIn(); //Login command
                              if (result == null) {
                                print('Login Failed');
                              } else {
                                print('Logged in with');
                                print(result.uid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => addInfo.AddInfo()), //Link to Information page
                                );
                              }                                                                                     //Register with Google
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                  ),
                                  SizedBox(width: 10.0),
                                  Center(
                                    child: Text('Register with Google',
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
          ],
        ),
    ],
    ));
  }
}