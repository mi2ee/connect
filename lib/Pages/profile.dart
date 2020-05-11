import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:connect/Setup/AddInfo.dart';


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
                  leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
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
                    Icon(Icons.more_vert,color: Colors.black,),
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
                                    //open change password
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
                                    //open change language
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
        minChildSize: 0.25,
        initialChildSize: 0.25,
        builder: (context, scrollableController)
        {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollableController,
            child: Container(
                height: widget.height -100,
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
                            "", backgroundColor: Colors.grey.shade200,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: FaIcon(FontAwesomeIcons.facebook,color: Colors.indigo,),
                            ),
                          ),
                          CircularProfileAvatar(
                            "", backgroundColor: Colors.grey.shade200,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: FaIcon(FontAwesomeIcons.instagram,color: Color(0xFFE1306C),),
                            ),
                          ),
                          CircularProfileAvatar(
                            "", backgroundColor: Colors.grey.shade200,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: FaIcon(FontAwesomeIcons.twitter,color: Colors.blue,),
                            ),
                          ),
                          CircularProfileAvatar(
                            "", backgroundColor: Colors.grey.shade200,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: FaIcon(FontAwesomeIcons.snapchat,color: Colors.yellowAccent),
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
        minChildSize: 0.15,
        initialChildSize: 0.15,
        builder: (context, scrollableController) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollableController,
            child: Container(
              height: widget.height -100,
              decoration: BoxDecoration(
                  borderRadius: bottomsheetRadius,
                  color: Colors.black
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
                              color: Colors.white,

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
                              color: Colors.white
                          )),
                          IconButton(
                              icon:  Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
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
                                backgroundColor: Colors.indigo.shade800,
                                radius: 10.0,
                                child: Center(
                                  child: Text("1",style: TextStyle(
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
                                  Text("Buy Tickets",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Text("Buy Airplan tickets",style: TextStyle(
                                    color: Colors.grey,

                                  ),),
                                  Text("For €559 ",style: TextStyle(
                                    color: Colors.grey,
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Text("8:25",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ResponsiveContainer(
                                heightPercent: 30.0,
                                widthPercent: 5.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.indigo.shade800,
                                  ),
                                  padding: EdgeInsets.only(top:10.0,bottom: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("2",style: TextStyle(
                                          color: Colors.white
                                      ),),
                                      Text("3",style: TextStyle(
                                          color: Colors.white
                                      ),),
                                    ],
                                  ),
                                ),
                              ),sizedboxWidth,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text("Products",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),sizedBox,
                                  Text("Take the product\nfrom my list",style: TextStyle(
                                    color: Colors.grey,
                                  ),),sizedBox,
                                  ResponsiveContainer(
                                    widthPercent: 60.0,
                                    heightPercent: 20.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.grey.shade200
                                      ),
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: <Widget>[
                                          Text("1.Orange",style: TextStyle(
                                            color: Colors.grey,
                                          ),),
                                          Text("2. Watermelon",style: TextStyle(
                                            color: Colors.grey,
                                          ),),
                                          Text("3. Grapefruit",style: TextStyle(
                                            color: Colors.grey,
                                          ),),
                                          Text("4. Chocolate",style: TextStyle(
                                            color: Colors.grey,
                                          ),),
                                        ],),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text("9:25",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.only(left:30.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Dont forget to take\nthe monet",style: TextStyle(
                          color: Colors.grey,
                        ),),
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
                                backgroundColor: Colors.indigo.shade800,
                                radius: 10.0,
                                child: Center(
                                  child: Text("4",style: TextStyle(
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
                                  Text("Walk with dog",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Text("Walk on the street\nwith my favourite dog.",style: TextStyle(
                                    color: Colors.grey,

                                  ),),

                                ],
                              ),
                            ],
                          ),
                          Text("8:25",style: TextStyle(color: Colors.grey),)
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





