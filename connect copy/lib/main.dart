import 'package:connect/Setup/CheckLogin.dart';
import 'package:flutter/material.dart';
import 'package:connect/Pages/MainPage.dart' as MainPage;
import 'package:connect/Setup/Login.dart' as Login;
import 'package:provider/provider.dart';
import 'package:connect/Setup/CheckLogin.dart' as CheckLogin;

import 'Setup/EnterInformation.dart';
import 'Setup/LoginHandling.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'connect',
    home: CheckUser(),
 ));
}
//TODO add das da unten (line 19)
//void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return StreamProvider<User>.value(                              //.value says what Stream we want to listen to
          value: Auth().user,
          child: MaterialApp(
           home: CheckLogin.CheckUser(),
    ),
    );
  }
}

