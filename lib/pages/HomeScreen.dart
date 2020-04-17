import 'package:connect/pages/contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:connect/pages/map.dart';
import 'package:connect/pages/notifications.dart';
import 'package:connect/pages/profile.dart';
import 'package:flutter/material.dart';



class MyBottomNavigationBar extends StatefulWidget
{
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();

}

var newChats=[];

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>
{

  int _currentIndex = 0;
  final List<Widget> _children =
  [
    home(),
    map(),
    Contacts(),
    notifications(),
    Design(),
  ];


  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar
        (
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items:
        [
          BottomNavigationBarItem
            (
            icon: new Icon(Icons.home),
            title: new Text(("Home"))
          ),
          BottomNavigationBarItem
            (
              icon: new Icon(Icons.map),
              title: new Text(("MAP"))
          ),
          BottomNavigationBarItem
            (
              icon: new Icon(Icons.contacts),
              title: new Text(("Contacts"))
          ),
          BottomNavigationBarItem
            (
              icon: new Icon(Icons.notifications),
              title: new Text(("Notifications"))
          ),
          BottomNavigationBarItem
            (
              icon: new Icon(Icons.person),
              title: new Text(("Person"))
          ),
        ],
      ),
    );
  }
}


String selectedCategorie= "All";

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> categories = ["All","Chats","Groups"];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Container()// Populate the Drawer in the next step.
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,),
              Text("Welcome Back,\nHenri", style: TextStyle(
                  color: Colors.black87.withOpacity(0.8),
                  fontSize: 30,
                  fontWeight: FontWeight.w600
              ),),

              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(14)
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Text("Search in Contacts", style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text("Chats", style: TextStyle(
                  color: Colors.black87.withOpacity(0.8),
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 20,),
              Container(
                height: 30,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return Chats(
                        categorie: categories[index],
                        isSelected: selectedCategorie == categories[index],
                        context: this,
                      );
                    }),
              ),


              SizedBox(height: 20,),

                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Colors.green,
                      backgroundImage: AssetImage("assets/images/HenriKlein.jpeg"),
                    ),



                    CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Colors.green,
                      backgroundImage: AssetImage("assets/images/MoritzIhler.png"),
                    ),
                  ],
                ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}

class Chats extends StatefulWidget {

  String categorie;
  bool isSelected;
  _homeState context;
  Chats({this.categorie, this.isSelected,this.context});

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.context.setState(() {
          selectedCategorie = widget.categorie;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
            color: widget.isSelected ? Color(0xffFFD0AA) : Colors.white,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Text(widget.categorie, style: TextStyle(
            color: widget.isSelected ?  Color(0xffFC9535) : Color(0xffA1A1A1)
        ),),
      ),
    );
  }
}








