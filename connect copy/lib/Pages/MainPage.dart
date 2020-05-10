import 'package:connect/Setup/CheckLogin.dart';
import 'package:flutter/material.dart';
import 'package:connect/Setup/LoginHandling.dart' as LoginHandling;
import 'package:firebase_auth/firebase_auth.dart';


class SecondRoute extends StatelessWidget {
  final _signInOut = LoginHandling.Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: ()  async{
            dynamic result = await _signInOut.handleGSignOut();
            if (result != null) {
              print('Logout failed');
              print(result);
            }else{
              print ('Logged out');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckUser()), //Link to Information page
              );
            }


          },
          child: Text('sfsdc'),
        ),
      ),
    );
  }
}