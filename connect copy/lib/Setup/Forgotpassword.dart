import 'package:flutter/material.dart';


class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context); //back to previous page
          },
          child: Text('Henri!'),
        ),
      ),
    );
  }
}