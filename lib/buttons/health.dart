import 'package:flutter/material.dart';
class Health extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:AppBar(
          //set hight..
          toolbarHeight: 50,
          //app bar background color..
          backgroundColor: Color(0xff78c6a3),
          //app bar title..
          title: Text(
            "safty and health",
            //text style..
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "images/health.jpg" ,
                height: 250 ,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
    Padding(
    padding:  EdgeInsets.all(8.0),
    child: Column(
    children: [
    Container(
    alignment: Alignment.centerLeft ,
    child: Text("Safety and health" , style: TextStyle(
    fontWeight: FontWeight.w700 ,
    fontSize: 25,
    fontFamily: "Besley"
    ),),
    ),
    SizedBox( height: 10),
    Container(
    child: Text("Learn actions you can take to stay healthy and safe on your trip. . Vaccines cannot protect you from many diseases , so your behaviors are important." ,
    style: TextStyle(
    fontSize: 20,
    fontFamily: "Besley"
    ),),
    ),
    Divider(),
    Row(children: [
    Icon(Icons.circle , size: 18,),
    SizedBox(width: 8,),
    Expanded(
    child: Text("Know your health status before you make travel plans. When you are sick you can spread diseases to others. Postpone your travel and stay home when you are sick." ,
    style: TextStyle(
    fontSize: 18,
    fontFamily: "Besley"
    ),),
    ),
    ],),
    Divider(),
    Row(children: [
    Icon(Icons.circle , size: 18,),
    SizedBox(width: 8,),
    Expanded(
    child: Text("Check your destination to get country-specific health advice. Depending on where you’ll be going and what you’ll be doing, you may need vaccinations or medicines before you leave." , style: TextStyle(
    fontSize: 18,
    fontFamily: "Besley"
    ),),
    ),
    ],),
    Divider(),
    Row(children: [
    Icon(Icons.circle, size: 18,),
    SizedBox(width: 8,),
    Expanded(
    child: Text("Wash your hands well and regularly, avoid shaking hands with others or touching your face, and avoid crowded places." , style: TextStyle(
    fontSize: 18,
    fontFamily: "Besley"
    ),),
    ),
    ],),
    Divider(),
    Row(children: [
    Icon(Icons.circle , size: 18,),
    SizedBox(width: 8,),
    Expanded(
    child: Text("Stay away, whenever possible, at least one meter from others. Avoid contact with others" , style: TextStyle(
    fontSize: 18,
    fontFamily: "Besley"
    ),),
    ),
    ],),
    Divider(),
    Row(children: [
    Icon(Icons.circle , size: 18,),
    SizedBox(width: 8,),
    Expanded(
    child: Text("Always wear a mask to avoid spreading infection from other people" , style: TextStyle(
    fontSize: 18,
    fontFamily: "Besley"
    ),),
    ),
    ],),
    Divider(),
    Row(children: [
    Icon(Icons.circle, size: 18,),
    SizedBox(width: 8,),
    Expanded(
    child: Text("Make sure to carry hand sanitizer and alcohol" , style: TextStyle(
    fontSize: 18,
    fontFamily: "Besley"
    ),),
    ),
    ],),
    Divider(),
    ]),
    )
            ]),
          ),
    );
  }

}