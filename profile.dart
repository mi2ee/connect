import 'package:connect/Setup/EditSocials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:connect/Setup/AddInfo.dart';
import 'package:url_launcher/url_launcher.dart';

class Design extends StatefulWidget {
  @override
  _DesignState createState() => _DesignState();
}
class _DesignState extends State<Design> with SingleTickerProviderStateMixin{
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
                  leading: Icon(Icons.notifications_active,color: Colors.black,),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RaisedButton.icon(
                        onPressed:_showEditProfileSheet,
                        icon: Icon(Icons.edit),
                        color: Colors.grey.shade100,
                        label : Text("Settings",style: TextStyle(color: Colors.black),),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),

                  ],
                ),
                sizedBox,
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/HenriKlein.jpeg"),
                  radius: 100.0,
                ),
                sizedBox,
                Text("User Name",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 40.0
                ),),
                Text
                  ("Life is short. Break the rules.", // short discription
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
                    Icon(Icons.chat_bubble_outline,size: 25.0,),
                    SizedBox(width: 10.0,),
                    Text("Message",style: TextStyle(  // replace
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900
                    ),),
                  ],
                ),
                sizedBox,
                sizedBox,
              ],
            ),
            Bottomsheet(),
          ],)
    );
  }
  void _showEditProfileSheet() { //Setings
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0))
        ),
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0))
                  ),
                  title: Text("Settings", style: TextStyle(color: Colors.black),),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_downward,color: Colors.black,),
                    onPressed: ()
                    {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.green,
                            child: ListTile(
                              onTap: () {
                                //open edit profile
                              },
                              title: Text(
                                "This is my Biography - edit here",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage("assets/images/HenriKlein.jpeg"),
                              ),
                              trailing: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height:10.0),
                          Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.person_outline,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Edit you Profile"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EditProfile()), //Link to Information page
                                    );
                                  },
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.person_outline,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Edit your Socials"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EditSocials()), //Link to Information page
                                    );
                                  },
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.lock_outline,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("About connect"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    _showAlert();//open change language
                                  },
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.security,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Privacy and Security"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    _showPrivacy();
                                    //open change location
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),

                          Text(
                            "Notification Settings",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SwitchListTile(
                            activeColor: Colors.lightGreen,
                            contentPadding: const EdgeInsets.all(0),
                            value: true,
                            title: Text("Chat Notification"),
                            onChanged: (val) {},
                          ),
                          SwitchListTile(
                            activeColor: Colors.lightGreen,
                            contentPadding: const EdgeInsets.all(0),
                            value: true,
                            title: Text("Event Notification"),
                            onChanged: (val) {},
                          ),
                          SwitchListTile(
                            activeColor: Colors.black,
                            contentPadding: const EdgeInsets.all(0),
                            value: false,
                            title: Text("Challange Notoficaions"),
                            onChanged: (val) {},
                          ),

                          Container(
                            height: 40.0,
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(50.0),
                                shadowColor: Colors.black,
                                color: Colors.green,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'Logout',                                                                       //Login Button
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          );
        });

  }
  void _showAlert() {
    AlertDialog dialog = new AlertDialog(
      content: new Container(
        width: 260.0,
        height: 230.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
          borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Container(
                    // padding: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: new Text(
                      'About us',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // dialog centre
            new Expanded(
              child: new Container(
                child: Text("Some randm text IDK yet lulsdgfhiouwahsdvgjisjohugfhdiajowuhgezwfhjhdiasuhiegzwfhbjdqwhgehbjh"),
              ),
              flex: 2,
            ),

            // dialog bottom
            new Expanded(
              child: new Container(
                padding: new EdgeInsets.all(16.0),

                child: GestureDetector(
                  onTap: () {
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(50.0),
                    shadowColor: Colors.black,
                    color: Colors.green,
                    elevation: 7.0,
                    child: Center(
                      child: Text(
                        'Go Back',                                                                       //Login Button
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    showDialog(context: context, child: dialog);
  }

  void _showPrivacy() {
    AlertDialog dialog = new AlertDialog(
      content: new Container(
        width: 260.0,
        height: 230.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
          borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Container(
                    // padding: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: new Text(
                      'Privacy and Agreement',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // dialog centre
            new Expanded(
              child: new Container(
                child: Text("Some randm text IDK yet lulsdgfhiouwahsdvgjisjohugfhdiajowuhgezwfhjhdiasuhiegzwfhbjdqwhgehbjh"),
              ),
              flex: 2,
            ),

            // dialog bottom
            new Expanded(
              child: new Container(
                padding: new EdgeInsets.all(16.0),

                child: GestureDetector(
                  onTap: () {
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(50.0),
                    shadowColor: Colors.black,
                    color: Colors.green,
                    elevation: 7.0,
                    child: Center(
                      child: Text(
                        'Go Back',                                                                       //Login Button
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    showDialog(context: context, child: dialog);
  }
}

final sizedBox = SizedBox(
  height: 10.0,);
final sizedboxWidth = SizedBox(
  width: 8.0,);
final BorderRadius radius = BorderRadius.circular(15.0);
final BorderRadius bottomsheetRadius = BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0));
class Bottomsheet extends StatefulWidget {
  @override
  _BottomsheetState createState() => _BottomsheetState();}
class _BottomsheetState extends State<Bottomsheet> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 10;
    double height = MediaQuery.of(context).size.height - 10;
    return Stack(
      children: <Widget>[
        AboutSheet(height: height),

        TimeLineSheet(height: height),
      ],
    );
  }
}
class AboutSheet extends StatefulWidget {
  const AboutSheet({
    Key key,
    @required this.height,
  }) : super(key: key);
  final double height;
  @override
  _AboutSheetState createState() => _AboutSheetState();
}
class _AboutSheetState extends State<AboutSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize: 1.0,
        minChildSize: 0.24,
        initialChildSize: 0.24,
        builder: (context, scrollableController)
        {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollableController,
            child: Container(
                height: widget.height -55,
                decoration: BoxDecoration(
                  borderRadius: bottomsheetRadius,
                  color: Colors.blueGrey.shade50,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      ResponsiveContainer(
                        widthPercent: 25.0,
                        heightPercent: 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("About",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30.0
                            )),
                            Icon(Icons.arrow_upward,color: Colors.black,size: 30.0,),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularProfileAvatar(
                            "", backgroundColor: Colors.grey.shade300,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: RaisedButton(
                                onPressed: ()async {
                                  const url = 'https://facebook.com/klnHenri';

                                  if (await canLaunch(url)) {
                                    await launch(url, forceSafariVC: false);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: FaIcon(FontAwesomeIcons.facebook,color: Colors.indigo,),
                            ),
                            ),
                          ),
                          CircularProfileAvatar(
                            "", backgroundColor: Colors.grey.shade300,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: RaisedButton(
                                onPressed: ()async {
                                  const url = 'https://instagram.com/klnHenri';

                                  if (await canLaunch(url)) {
                                    await launch(url, forceSafariVC: false);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: FaIcon(FontAwesomeIcons.instagram,color: Color(0xFFE1306C),),
                              ),
                            ),
                          ),
                          CircularProfileAvatar(
                            "", backgroundColor: Colors.grey.shade300,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: RaisedButton(
                                onPressed: ()async {
                                  const url = 'https://twitter.com/klnHenri';

                                  if (await canLaunch(url)) {
                                    await launch(url, forceSafariVC: false);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: FaIcon(FontAwesomeIcons.twitter,color: Colors.blue,),
                              ),
                            ),
                          ),
                          CircularProfileAvatar(
                            "", backgroundColor: Colors.grey.shade300,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: RaisedButton(
                                onPressed: ()async {
                                  const url = 'https://snapchat.com/add/klnHenri';

                                  if (await canLaunch(url)) {
                                    await launch(url, forceSafariVC: false);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: FaIcon(FontAwesomeIcons.snapchat,color: Colors.yellowAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBox,
                      sizedBox,

                      Divider(
                        color: Colors.grey,
                        height: 4,
                        thickness: 0.5,
                      ),
                      sizedBox,
                      Text
                        ("Life is short. Break the rules.",
                          style: TextStyle(

                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,

                          )),
                      sizedBox,
                      Divider(
                        color: Colors.grey,
                        height: 4,
                        thickness: 0.5,
                      ),
                      sizedBox,
                      Align(
                        alignment: Alignment.topLeft,


                      ),sizedBox,
                      Card(
                        elevation: 4.0,
                        color: Colors.blueGrey.shade50,
                        margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: Colors.lightGreen,
                              ),
                              title: Text("+49 0160 5812203"),

                              onTap: () {
                                //open change password
                              },
                            ),
                            sizedBox,
                            ListTile(
                              leading: Icon(
                                Icons.email,
                                color: Colors.lightGreen,
                              ),
                              title: Text("email@henriklein.de"),

                              onTap: () {
                                //open change language
                              },
                            ),
                            sizedBox,
                            ListTile(
                              leading: Icon(
                                Icons.cake,
                                color: Colors.lightGreen,
                              ),
                              title: Text("8th of December 2003"),

                              onTap: () {
                                //open change location
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.location_on,
                                color: Colors.lightGreen,
                              ),
                              title: Text("Bad Homburg, Germany"),

                              onTap: () {
                                //open change location
                              },
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 4.0,
                        color: Colors.blueGrey.shade50,
                        margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.bubble_chart,
                                color: Colors.lightGreen,
                              ),
                              title: Text("male, in a relation with his Computer"),

                              onTap: () {
                                //open change location
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.people,
                                color: Colors.lightGreen,
                              ),
                              title: Text("You got 26 mutural Friends"),

                              onTap: () {
                                //open change location
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
          );
        }
    );
  }
}

class TimeLineSheet extends StatefulWidget {
  const TimeLineSheet({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  _TimeLineSheetState createState() => _TimeLineSheetState();
}

class _TimeLineSheetState extends State<TimeLineSheet> {
  @override
  Widget build(BuildContext context) {

    return DraggableScrollableSheet(

        maxChildSize: 1.0,
        minChildSize: 0.13,
        initialChildSize: 0.13,
        builder: (context, scrollableController) {
          return SingleChildScrollView(

            scrollDirection: Axis.vertical,
            controller: scrollableController,
            child: Container(


              height: widget.height -55,
              decoration: BoxDecoration(
                  borderRadius: bottomsheetRadius,
                  color: Color.fromRGBO(250, 250, 250, 1),
              ),
              child: Padding(


                padding: const EdgeInsets.all(15.0),
                child: Column(

                  children: <Widget>[
                    Center(
                        child: ResponsiveContainer(
                          widthPercent: 25.0,
                          heightPercent: 1.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.black54,

                            ),
                          ),
                        )
                    ),
                    Padding(

                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("TimeLine",style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30.0,
                              color: Colors.black
                          )),
                          IconButton(
                              icon:  Icon(
                                Icons.arrow_upward,
                                color: Colors.black,
                                size: 30.0,),
                              onPressed: ()
                              {

                              }
                          )
                        ],
                      ),
                    ),
                    sizedBox,

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text(">",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text("Hang out",style: TextStyle(
                                      color: Colors.black12,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Text("Meet with Friends",style: TextStyle(
                                    color: Colors.grey,

                                  ),),
                                  Text("Anna, Vivien, Max, Tom",style: TextStyle(
                                    color: Colors.grey,
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Text("Friday, 6:30 PM",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text(">",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text("Birthday (reminder)",style: TextStyle(
                                      color: Colors.black12,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Text("Jannes Birthday",style: TextStyle(
                                    color: Colors.grey,

                                  ),),
                                  Text("08/12/2000",style: TextStyle(
                                    color: Colors.grey,
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Text("Wednessday",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text("=",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text("Party at Joe's",style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Text("Reason: exam week done",style: TextStyle(
                                    color: Colors.grey,

                                  ),),
                                  Text("Seedammstrasse 21",style: TextStyle(
                                    color: Colors.grey,
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Text("today, 6 PM",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text("<",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text("Appointment",style: TextStyle(
                                      color: Colors.black12,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Text("Dr. Alfred IDK",style: TextStyle(
                                    color: Colors.grey,

                                  ),),
                                  Text("Frankfurter Landstrasse 21 ",style: TextStyle(
                                    color: Colors.grey,
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Text("last Thursday",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text("<",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text("Hang out",style: TextStyle(
                                      color: Colors.black12,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Text("Meet with Friends",style: TextStyle(
                                    color: Colors.grey,

                                  ),),
                                  Text("Some more random guys",style: TextStyle(
                                    color: Colors.grey,
                                  ),),

                                ],
                              ),
                            ],
                          ),
                          Text("March 28th",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text("<",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text("Hang out",style: TextStyle(
                                      color: Colors.black12,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Text("Meet with Friends",style: TextStyle(
                                    color: Colors.grey,

                                  ),),
                                  Text("Some more random guys",style: TextStyle(
                                    color: Colors.grey,
                                  ),),

                                ],
                              ),
                            ],
                          ),
                          Text("March 28th",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text("<",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text("Hang out",style: TextStyle(
                                      color: Colors.black12,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Text("Meet with Friends",style: TextStyle(
                                    color: Colors.grey,

                                  ),),
                                  Text("Some more random guys",style: TextStyle(
                                    color: Colors.grey,
                                  ),),

                                ],
                              ),
                            ],
                          ),
                          Text("March 28th",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),



                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}