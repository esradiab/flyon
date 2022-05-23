import 'package:flutter/material.dart';
import 'package:untitled/pages/about.dart';
import 'package:untitled/pages/flights/flightstopbar.dart';
import 'package:untitled/pages/home.dart';
import 'package:untitled/pages/hotels.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomBar();
  }
}

class _BottomBar extends State<BottomBar>{
  //list of pages (widget)..
  late List<Widget> pageList= <Widget>[
    Home() ,
    Hotels(),
    TopBar(),
    AboutFly()
  ] ;
  //set index of pages = 0...
  late int index = 0 ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //bottom bar showed when the app run..
      bottomNavigationBar: BottomNavigationBar(
        //set the color of selected button..
        selectedItemColor: Color(0xff78c6a3),
        selectedIconTheme: IconThemeData(
          color: Color(0xff78c6a3),
        ),
        //set the index
        currentIndex: index ,
        //When you click on a button on tme bottom bar you will navigate to the page you clicked on..
        onTap: (value){
          //the index will change when you click on another button..
          setState(() {
            index = value ;
          });
        },
        //bottom bar type
        type: BottomNavigationBarType.fixed,
        //showed the buttons s(items) in the bottom bar..
        items: [
          // every button have icon and name..
          BottomNavigationBarItem(
            //set the icon
        icon: Icon(Icons.home ,size:20, color: Colors.grey,),
        //set the tooltip
        tooltip: "home",
        //set the name
        label: "home",),
          //item 2
          BottomNavigationBarItem(
            //set the icon
            icon: Icon(Icons.hotel ,size:20, color: Colors.grey,),
            tooltip: "hotels",
            //set the name
            label: "hotels",),
          //item 3
          BottomNavigationBarItem(
            //set the icon
            icon: Icon(Icons.flight ,size:20, color: Colors.grey,),
            tooltip: "flights",
            //set the name
            label: "flights",),
          //item 4
          BottomNavigationBarItem(
            //set the icon
            icon: Icon(Icons.article_outlined ,size:20, color: Colors.grey,),
            tooltip: "aboutfly",
            //set the name
            label: "aboutfly",),
        ],
      ),
      body: pageList[index] ,
    );
  }
}