
import 'package:flutter/material.dart';
import 'package:myflutterapp/home.dart';
import 'dart:math';


class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [

                  Colors.deepOrangeAccent,
                  Colors.black,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,

              )
          ),
        ),
        SafeArea(child: Container(
          margin: EdgeInsets.only(top: 25),
          width: 210.0,
          height: double.infinity,
          padding: EdgeInsets.only(left:10.0),
          child:Column(
            children: [
              DrawerHeader(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:AssetImage('assets/profil.jpg'),
                  ),
                  SizedBox(height: 10.0),
                  Text('Danouni nouhaila', style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  ),
                ],
              ),
              ),
              Expanded(
                  child: ListView(
                    children: [
                      ListTile(

                        onTap:()=>Navigator.of(context).pushNamed("home"),

                        leading: Icon(
                          Icons.home,
                          color:Colors.white,
                        ),
                        title: Text('Home',
                          style: TextStyle(color: Colors.white) ,),
                      ),
                      ListTile(
                        onTap: ()=>Navigator.of(context).pushNamed("api"),
                        leading: Icon(
                          Icons.api,
                          color:Colors.white,
                        ),
                        title: Text('My Books',
                          style: TextStyle(color: Colors.white) ,),
                      ),
                      ListTile(
                        onTap: ()=>Navigator.of(context).pushNamed("sqlite"),
                        leading: Icon(
                          Icons.favorite,
                          color:Colors.white,
                        ),
                        title: Text('Favorite Books',
                          style: TextStyle(color: Colors.white) ,),
                      ),
                      ListTile(
                        onTap: (){},
                        leading: Icon(
                          Icons.settings,
                          color:Colors.white,
                        ),
                        title: Text('Settings',
                          style: TextStyle(color: Colors.white) ,),
                      ),
                      Divider(color: Colors.white, height: 2),

                      SizedBox(
                        height: 150,
                      ),
                      ListTile(
                        onTap: (){
   Navigator.push(context,
    MaterialPageRoute(builder: (context) => HomePage()));
    },
                        leading: Icon(
                          Icons.logout,
                          color:Colors.white,
                        ),
                        title: Text('Log out',
                          style: TextStyle(color: Colors.white) ,),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
        ),

        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0,end: value),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            builder: (_, double val,__){
              return(
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3,2,0.001)
                      ..setEntry(0,3,200 * val)
                      ..rotateY((pi/6)*val),
                      child: Scaffold(
                        body: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/img.png"),
                              fit: BoxFit.cover,
                            ),
                          ),

                      ),
                      )
                  )
            );
            }
        ),
        GestureDetector(
          onHorizontalDragUpdate: (e){
            if(e.delta.dx > 0 ){
              setState(() {
                value = 1;
              });
            } else {
              setState(() {
                value = 0;
              });
            }
          },
          /* onTap: (){
              setState(() {
                value == 0 ? value = 1 : value = 0;
              });
            },*/
        )
      ],
    );
  }
}
