import 'package:connect/pages/contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:connect/pages/map.dart';
import 'package:connect/pages/profile.dart';
import 'package:flutter/material.dart';


class StartApp extends StatefulWidget {
  @override
  _StartAppState createState() => _StartAppState();

}
class _StartAppState extends State<StartApp> {

  int _currentIndex = 0;
  final List<Widget> _children =
  [
    Home(),
    map(),
    Contacts(),
    Design(),
  ];


  void onTappedBar(int index) {
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
              icon: new Icon(Icons.account_circle),
              title: new Text(("Person"))
          ),
        ],
      ),
    );
  }
}


Color mainColor = Color(0xff774a63);
Color secondColor = Colors.grey;
Color backgroundColor = Color(0xfffcf1f2);


List<ImageProvider> images = [
  AssetImage('assets/images/HenriKlein.jpeg'),
  AssetImage('assets/image1.png'),
  AssetImage('assets/image3.png'),
  AssetImage('assets/image1.png'),
  AssetImage('assets/image2.png'),
  AssetImage('assets/avatar2.png'),
];

List<ImageProvider> avatars = [
  AssetImage('assets/images/MoritzIhler.png'),
  AssetImage('assets/images/ErikTrunkwalter.jpeg'),
  AssetImage('assets/images/HenriKlein.jpeg'),
  AssetImage('assets/avatar1.png'),
  AssetImage('assets/avatar2.png'),
  AssetImage('assets/avatar2.png'),
];

List<String> names = [
  ("Henri Klein"),
  ("Somebody Else"),
  ("another kid"),
  ("Henri Klein"),
  ("Henri Klein"),
  ("Henri Klein2"),
];

List<String> mutural = [
  ("27"),
  ("25"),
  ("10"),
  ("2"),
  ("5"),
  ("4"),
];

List<String> categories = ["Chats", "Challanges", "Groups"];
String selectedCategorie= "Chats";





class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Header(),
          //SelectOption(),
          Chats(),
          MoodsDetector(),
          NextUp(),
          PostFeed(),
        ],
      ),
    );
  }
}


class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 50, 50, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome back,',
                style: TextStyle(color: secondColor, fontSize: 20),
              ),
              Text(
                'Henri',
                style: TextStyle(color: mainColor, fontSize: 30),
              ),


            ],
          ),




          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: secondColor.withOpacity(0.5), blurRadius: 20),
              ],
            ),
            child: Icon(Icons.add, color: secondColor),
          ),

        ],
      ),
    );

  }
}

class SelectOption extends StatelessWidget {
  const SelectOption({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 0, 50, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[



          Container(
            height: 30,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return CategorieTile(
                    categorie: categories[index],
                    isSelected: selectedCategorie == categories[index],

                  );
                }),
          ),
          SizedBox(height: 20,),

          SizedBox(height: 20,),




        ],
      ),
    );

  }
}

class Chats extends StatelessWidget {
  const Chats({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: avatars.length + 1,
        shrinkWrap: true,

        itemBuilder: (context, index) {
          return index == 0
              ? Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: secondColor.withOpacity(0.25),
                  )
                ]),
            child: Icon(Icons.search, size: 35, color: secondColor),
          )
              : Container(
            height: 80,
            width: 80,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.deepOrange.shade200,
                  Colors.green
                ],
              ),
            ),
            child: CircleAvatar(
              backgroundImage: avatars[index - 1],
              backgroundColor: Colors.white70,
            ),
          );
        },
      ),
    );
  }
}

class MoodsDetector extends StatelessWidget {
  const MoodsDetector({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 80,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(25),
      child: Container(

        height: 100,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: secondColor.withOpacity(0.2), blurRadius: 20),
          ],
          borderRadius: BorderRadius.circular(50),

        ),
        child: MoodsSelector(),
      ),
    );
  }
}

class NextUp extends StatelessWidget {
  const NextUp({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 190,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(25),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color(0xFFD9D9D9),
                  backgroundImage: AssetImage("assets/images/HenriKlein.jpeg"),
                  radius: 36.0,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Next Up | Gym with Tom',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nSunday,May 5th at 8:00 PM',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: '\nDavid Lyloyd, Bad Homburg \nAddresszusazt....',
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              color: Colors.grey[200],
              height: 3,
              thickness: 1,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _iconBuilder(Icons.check_circle, "I'm Here"),
                _iconBuilder(Icons.cancel, 'Cancel'),
                _iconBuilder(Icons.directions, 'Directions'),
                _iconBuilder(Icons.calendar_today, 'When?'),
              ],
            )
          ],
        ),
      ),
    );
  }
  Column _iconBuilder(icon, title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 28,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class PostFeed extends StatelessWidget {
  const PostFeed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: avatars.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 280,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: images[index],
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: secondColor.withOpacity(0.25),
                ),
              ],
            ),
            child: Container(
              height: 90,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: avatars[index],
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        names[index],
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        mutural[index] + ' mutural Friends',
                        style: TextStyle(
                          fontSize: 15,
                          color: secondColor,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: mainColor,
                    size: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




// ------




class CategorieTile extends StatefulWidget {

  String categorie;
  bool isSelected;
  Home context;
  CategorieTile({this.categorie, this.isSelected,this.context});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}
class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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


class MoodsSelector extends StatefulWidget {
  // MoodsSelector({Key key}) : super(key: key);

  @override
  _MoodsSelectorState createState() => _MoodsSelectorState();
}
class _MoodsSelectorState extends State<MoodsSelector> {
  //List<bool> isSelected = List.generate(5, (_) => false);
  List<bool> isSelected = [ false,false,false,false,false];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        selectedColor: Colors.green,

        color: Colors.orangeAccent,
        borderColor: Colors.transparent,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          Icon(
            Icons.directions_run,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.local_bar,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.live_tv,
              size: 30,
            ),
          ),
          Icon(
            Icons.assignment,
            size: 30,
          ),
        ],
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            // for (int buttonIndex = 0;
            //     buttonIndex < isSelected.length;
            //     buttonIndex++) {
            //   if (buttonIndex == index) {
            //     isSelected[buttonIndex] = true;
            //   } else {
            //     isSelected[buttonIndex] = false;
            //   }
            // }

            isSelected[index] = !isSelected[index];
          });
        },
      ),
    );
  }
}










