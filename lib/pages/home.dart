import 'package:flutter/material.dart';
import 'package:untitled/buttons/flightbooking/flightbookingtopbar.dart';
import 'package:untitled/views/airwaysviews.dart';
import 'package:untitled/views/destinationview.dart';
import 'package:untitled/views/hotelview.dart';
import '../views/webview.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      //don't show debug banner...
        debugShowCheckedModeBanner: false,
        home :Scaffold(
          //show app bar..
        appBar: AppBar(
          //set hight..
          toolbarHeight: 50,
          //set the title in the center..
          centerTitle: true,
          //app bar background color..
          backgroundColor: Color(0xff78c6a3),
          //app bar title..
          title: Text("flyOn" ,
            //text style..
            style:  TextStyle(
            fontFamily: "Lobster",
            fontSize: 25 ,
            color: Colors.black ,
          ),),
        ),
        //this widget make the page scrollable..
            drawer: Drawer(
            backgroundColor: Color(0xa178c6a3),
              width: 150,
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.

              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
          SizedBox(height: 20,),
            ListTile(
              title:  Row(
                children: [
                  Icon(
                    Icons.contact_mail_outlined , size: 20,),
                  SizedBox(width: 5,),
                  Text('contact us'),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

              },
            ),
                  ListTile(
                    title:  Row(
                      children: [
                        Icon(
                          Icons.language , size: 20,),
                        SizedBox(width: 5,),
                        Text('language'),
                      ],
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer

                    },
                  ),
                  ListTile(

                    title:  Row(
                      children: [
                      Icon(
                      Icons.help , size: 20,),
                        SizedBox(width: 5,),
                        Text('help'),
                      ],
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                    },
                  ),])),
        body: SingleChildScrollView(
          //container contains column child..
          child :Container(
            //padding
            padding: EdgeInsets.only(bottom: 10 , ),
            child: Column(
              children: <Widget>[
                //the header image showed on the top of the page with two buttons..
                headerImage(context) ,
                covid_19(context),
                Container(
                  padding:EdgeInsets.all(10) ,
                    width: MediaQuery.of(context).size.width,
                    height: 130 ,
                    child: AirwaysView()),
                Divider(),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Tripoli hotels :" ,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                      fontWeight: FontWeight.w700 ,
                      fontSize: 23
                  )),
                ),
                Container(
                    padding:EdgeInsets.all(10) ,
                    width: MediaQuery.of(context).size.width,
                    height: 240 ,
                    child: HotelsView()
                ),
                Divider(),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Top destinations:" ,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700 ,
                          fontSize: 23
                      )),
                ),
                Container(
                    padding:EdgeInsets.all(10) ,
                    width: MediaQuery.of(context).size.width,
                    height: 240 ,
                    child: DestinationView()
                ),
                Divider(),
              ],
            ),
          ) ,

        )));
  }
}
//header image function type widget...
Widget headerImage(context) {
  Icon flight = Icon(Icons.flight , color: Colors.black,) ;
  Icon hotel = Icon(Icons.hotel, color: Colors.black,) ;
  return Stack(
    children: [
      Container(height: 290, width: MediaQuery.of(context).size.width,),
      Container(
        height: 220,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/home.jpg",),
          fit: BoxFit.cover,)
        ),
      ),
      Positioned(
        bottom: 2,
        child: Container(
          width: MediaQuery.of(context).size.width,
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              button(context , "flights" ,flight , 0) ,
              button(context , "hotels" , hotel , 1)
            ],
          )
        ),
      )
    ],
  );
}

Widget button (BuildContext context,String name , Icon icon , int flag){
  return InkWell(
    onTap: (){
      if ( flag == 0 ){
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => BookingTopBar()));
      }
      else{
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookingTopBar()));
      }

    },
    child: Container(
      alignment: Alignment.center,
      width: 160,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],

      ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
       Container(
         alignment: Alignment.center,
        width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff12ba72),
                Color(0xff92b6aa),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
           child: icon,
       ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(name , style: TextStyle( fontSize: 18 , fontFamily: "Raleway" , fontWeight: FontWeight.w600),),
              ),
            ],
            ),
      ),
    );
}

Widget covid_19 (context){
var url = "https://www.mayoclinic.org/ar/diseases-conditions/coronavirus/in-depth/coronavirus-safe-travel-advice/art-20486965";
 return InkWell(
   onTap: (){
     Navigator.push(context,
         MaterialPageRoute(builder: (context) => InstructionWebView(url)));
   },
   child: Container(
     width: MediaQuery.of(context).size.width,
     decoration: BoxDecoration(
       color: Color(0xffF7FFBA),
    borderRadius: BorderRadius.circular(10),
     ),
     padding: EdgeInsets.all(10),
     margin: EdgeInsets.all(14),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         Icon(Icons.warning_rounded , color: Colors.yellow, size: 30,),
         SizedBox(width: 10,),
         Expanded(
           child: Text("instruction and advices about COVID-19 virus when you traveling ." , style: TextStyle(
             fontSize: 18 ,
           ),),
         ),
         Icon(Icons.arrow_forward_ios_outlined , color: Colors.grey , size: 30,)
       ],
     ),
   ),
 );
}



