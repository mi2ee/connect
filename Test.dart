import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future test() async {
  bool exists = false;
  print('startet...');
  Firestore.instance
      .collection('Users')
      .document('3')
      .get()
      .then((doc) {
    print(doc);
    if (doc.exists) {
      exists = true;
    }else{
      exists = false;}
    print(exists);
    return exists;
  }
  );
}


  //final snapShot = await Firestore.instance
      //.collection('Users')
      //.document('1')
      //.get();


class SecondRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async{
            final info = await test();
            print (info.Name);
          },
          child: Text('sfsdc'),
        ),
      ),
    );
  }
}