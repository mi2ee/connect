import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
                        label : Text("Edit Profile",style: TextStyle(color: Colors.black),),
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
                  ("Life is short. Break the rules.",
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
                    Text("Message",style: TextStyle(
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
            bottomsheet(),
          ],)
    );
  }
  void _showEditProfileSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return Scaffold(
            body: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    sizedBox,
                    Row(


                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ResponsiveContainer(widthPercent: 12.0, heightPercent: 7.0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12.0)
                            ),
                            child: Icon(Icons.camera_enhance,color: Colors.white,),
                          ),
                        ),
                        ResponsiveContainer(widthPercent: 25.0, heightPercent: 15.0,
                          child: Container(
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(12.0)
                              ),
                              child: Image.asset("assets/images/HenriKlein.jpeg")
                          ),
                        ),
                        ResponsiveContainer(widthPercent: 12.0, heightPercent: 7.0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12.0)
                            ),
                            child: Icon(Icons.delete,color: Colors.black,),
                          ),
                        )
                      ],
                    ),
                    sizedBox,sizedBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Name",style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900
                      ),),
                    ),
                    sizedBox,
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Your Name",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Name cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                    ),
                    sizedBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email",style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900
                      ),),
                    ),
                    sizedBox,
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Your email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Email cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    sizedBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Birthday",style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900
                      ),),
                    ),
                    sizedBox,
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "DD/MM/YYYY",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
//              validator: (val) {
//                if(val.length==0) {
//                  return "Email cannot be empty";
//                }else{
//                  return null;
//                }
//              },
                      keyboardType: TextInputType.datetime,

                    ),
                    sizedBox,sizedBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Location",style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900
                      ),),
                    ),
                    sizedBox,
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter you location",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
//              validator: (val) {
//                if(val.length==0) {
//                  return "Email cannot be empty";
//                }else{
//                  return null;
//                }
//              },
                      keyboardType: TextInputType.multiline,
                    ),
                    sizedBox,
                    ResponsiveContainer(
                      widthPercent: 70.0,
                      heightPercent: 8.0,
                      child: RaisedButton(
                        onPressed:(){},
                        color: Colors.purple.shade800,
                        child: Text("save changes",style: TextStyle(
                            color: Colors.white
                        ),),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}


final sizedBox = SizedBox(
  height: 10.0,
);
final sizedboxWidth = SizedBox(
  width: 8.0,
);
final BorderRadius radius = BorderRadius.circular(15.0);
final BorderRadius bottomsheetRadius = BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0));

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
                height: widget.height,
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
                      sizedBox,
                      sizedBox,
                      sizedBox,
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
                              child: FaIcon(FontAwesomeIcons.whatsapp,color: Color(0xFF4FCE5D)),
                            ),
                          ),
                        ],
                      ),
                      sizedBox,
                      Divider(
                        color: Colors.grey[200],
                        height: 3,
                        thickness: 1,
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
                      sizedBox,
                      Align(
                        alignment: Alignment.topLeft,


                      ),sizedBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[


                              ResponsiveContainer(
                                widthPercent: 100.0,
                                heightPercent: 10.0,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text("Product Designer",style: TextStyle(
                                                color: Colors.indigo.shade800,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w900
                                            ),),
                                            Text("Creative company",style: TextStyle(
                                              color: Colors.indigo.shade800,
                                            ),),
                                          ],
                                        ),
                                        Text("January 2019\nto continue",style: TextStyle(
                                          color: Colors.indigo.shade800,
                                        ),),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[


                              ResponsiveContainer(
                                widthPercent: 100.0,
                                heightPercent: 10.0,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text("Product Designer",style: TextStyle(
                                                color: Colors.indigo.shade800,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w900
                                            ),),
                                            Text("Creative company",style: TextStyle(
                                              color: Colors.indigo.shade800,
                                            ),),
                                          ],
                                        ),
                                        Text("January 2019\nto continue",style: TextStyle(
                                          color: Colors.indigo.shade800,
                                        ),),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[

                              ResponsiveContainer(
                                widthPercent: 100.0,
                                heightPercent: 10.0,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text("Product Designer",style: TextStyle(
                                                color: Colors.indigo.shade800,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w900
                                            ),),
                                            Text("Creative company",style: TextStyle(
                                              color: Colors.indigo.shade800,
                                            ),),
                                          ],
                                        ),
                                        Text("February 2017",style: TextStyle(
                                          color: Colors.indigo.shade800,
                                        ),),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
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
              height: widget.height,
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
                          Icon(Icons.arrow_upward,color: Colors.white,size: 30.0,),
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





