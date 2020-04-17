import 'package:flutter/material.dart';
import 'package:connect/pages/contacts.dart';

class ContactPage extends StatefulWidget {
  final heroTag;
  final contactName;
  final contactBiography;

  ContactPage({this.heroTag, this.contactName, this.contactBiography});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.directions_run),
                        color: Colors.grey.shade100,
                        label: Text(
                          "Challange",
                          style: TextStyle(color: Colors.black),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  ],
                ),
                sizedBox,
                CircleAvatar(
                  backgroundImage: AssetImage(widget.heroTag),
                  radius: 100.0,
                  backgroundColor: Colors.white,
                ),
                sizedBox,
                Text(
                  widget.contactName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 40.0),
                ),
                Text(widget.contactBiography,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      decoration: TextDecoration.underline,
                    )),
                sizedBox,
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 25.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Message",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                sizedBox,
                sizedBox,
              ],
            ),
            bottomsheet(),
          ],
        ));
  }
}

final sizedBox = SizedBox(
  height: 10.0,
);
final sizedboxWidth = SizedBox(
  width: 8.0,
);
final BorderRadius radius = BorderRadius.circular(15.0);
final BorderRadius bottomsheetRadius = BorderRadius.only(
    topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0));

class bottomsheet extends StatefulWidget {
  @override
  _bottomsheetState createState() => _bottomsheetState();


}

class _bottomsheetState extends State<bottomsheet> {
  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 10;
    double height = MediaQuery.of(context).size.height - 10;
    return Stack(
      children: <Widget>[
        DraggableScrollableSheet(
            maxChildSize: 1.0,
            minChildSize: 0.25,
            initialChildSize: 0.25,
            builder: (context, scrollableController) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: scrollableController,
                child: Container(
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: bottomsheetRadius,
                      color: Colors.blueGrey.shade50,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("About",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30.0)),
                              Icon(
                                Icons.more_vert,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 60.0,
                              width: 60.0,
                              child: RaisedButton(
                                color: Colors.blue.shade200,
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: radius),
                              ),
                            ),
                            Container(
                              height: 60.0,
                              width: 60.0,
                              child: RaisedButton(
                                color: Colors.indigo,
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: radius),
                              ),
                            ),


                            Container(
                              height: 60.0,
                              width: 60.0,
                              child: RaisedButton(
                                color: Colors.grey.shade200,
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: radius),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              );
            }),
        DraggableScrollableSheet(
            maxChildSize: 1.0,
            minChildSize: 0.15,
            initialChildSize: 0.15,
            builder: (context, scrollableController) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: scrollableController,
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: bottomsheetRadius, color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Feed",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 30.0),
                          ),
                        ),
                        sizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/images/LogoPNG.jpeg"),
                              backgroundColor: Colors.black,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Noell Blue",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                Text(
                                  "Yesterday at 8:14 PM",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(left: 80.0)),
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        sizedBox,
                        Row(
                          children: <Widget>[
                            Text(
                              "Blue magic!",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            sizedboxWidth,
                            Image.asset(
                              "assets/images/MoritzIhler.png",
                              color: Colors.blue,
                              height: 15.0,
                              width: 20.0,
                            ),
                            sizedboxWidth,
                            Image.asset(
                              "assets/rhombus.png",
                              color: Colors.blue,
                              height: 20.0,
                              width: 25.0,
                            ),
                            sizedboxWidth,
                            Text(
                              "Model @dejyosha",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            )
                          ],
                        ),
                        sizedBox,
                        Image.asset(
                          "assets/images/MoritzIhler.png",
                          fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
