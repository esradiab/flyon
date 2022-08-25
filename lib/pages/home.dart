import 'package:flutter/material.dart';
import 'package:untitled/buttons/flightbooking/flightbookingtopbar.dart';
import 'package:untitled/contactus.dart';
import 'package:untitled/views/airwaysviews.dart';
import 'package:untitled/views/destinationview.dart';
import 'package:untitled/views/hotelview.dart';
import '../views/webview.dart';
//create StatefulWidget class home
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
    //add new widget materialApp for material design
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
                  // sizedBox for blank space..
          SizedBox(height: 20,),
            //add ListTile widget with row inside
            ListTile(
              title:  Row(
                children: [
                  //add contact us icon to the row with text
                  Icon(
                    Icons.contact_mail_outlined , size: 20,),
                  //blank space
                  SizedBox(width: 5,),
                  //show text
                  Text('contact us'),
                ],
              ),
              onTap: () {
                //on tap navigate to page contact us..
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactUs()));

              },
            ),
                  //add list tile to the list view with row inside..
                  ListTile(
                    title:  Row(
                      children: [
                        //inside the row we have language icon and text
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
                  //add new list tile to the list view with row inside
                  ListTile(
                    title:  Row(
                      //inside the row we have help icon , blank space and text
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
        //the body of the page has SingleChildScrollView widget it makes all the content scrollable...
        body: SingleChildScrollView(
          //container contains column child..
          child :Container(
            //padding
            padding: EdgeInsets.only(bottom: 10 , ),
            child: Column(
              children: <Widget>[
                //the header image showed on the top of the page with two buttons..
                //headerImage function showing the header Image for the page
                headerImage(context) ,
                //covid_19 function showing a container whit some text
                covid_19(context),
                //this container showing list view for libyan airways
                Container(
                  padding:EdgeInsets.all(10) ,
                    //set width the same as the page size
                    width: MediaQuery.of(context).size.width,
                    //set height
                    height: 130 ,
                    //container child is list view for libyan airways
                    child: AirwaysView()),
                //divider divides the page by thin line
                Divider(),
                //add container to the column with text content
                Container(
                  //align thr content for the  container center left
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Tripoli hotels :" ,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                      fontWeight: FontWeight.w700 ,
                      fontSize: 23
                  )),
                ),
              //add container to the column with hotel view content
                Container(
                  //padding all the content 10pb
                    padding:EdgeInsets.all(10) ,
                    //set width the same as the page size
                    width: MediaQuery.of(context).size.width,
                    //det height 240pb
                    height: 240 ,
                    //hotel list view function
                    child: HotelsView()
                ),
                //divider divides the page by thin line
                Divider(),
                //add container to the column with text content
                Container(
                  //align thr content for the  container center left
                  alignment: Alignment.centerLeft,
                  //padding all the content 10pb
                  padding: EdgeInsets.only(left: 10),
                  //text child for the container
                  child: Text("Top destinations:" ,
                      //align text start of the content
                      textAlign: TextAlign.start,
                      //set text style
                      style: TextStyle(
                        //font weight bold
                          fontWeight: FontWeight.w700 ,
                          //font size 23
                          fontSize: 23
                      )),
                ),
                Container(
                    padding:EdgeInsets.all(10) ,
                    width: MediaQuery.of(context).size.width,
                    height: 240 ,
                    child: DestinationView()
                ),
                //divider divides the page by thin line
                Divider(),
              ],
            ),
          ) ,

        )));
  }
}
//header image function type widget...
Widget headerImage(context) {
  //new variable type icon
  Icon flight = Icon(Icons.flight , color: Colors.black,) ;
  //new variable type icon
  Icon hotel = Icon(Icons.hotel, color: Colors.black,) ;
  //stack widget
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
      //Positioned widget set the content place
      Positioned(
        //place from the bottom by two pb
        bottom: 2,
        child: Container(
          //set width
          width: MediaQuery.of(context).size.width,
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //call button widget
              button(context , "flights" ,flight , 0) ,
              button(context , "hotels" , hotel , 1)
            ],
          )
        ),
      )
    ],
  );
}
// new button function type widget
Widget button (BuildContext context,String name , Icon icon , int flag){
  //inkWell make content clickable
  return InkWell(
    onTap: (){
      //if flag is 0 that mean you clicked flight button
      if ( flag == 0 ){
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => BookingTopBar()));
      }
      //else that mean you clicked hotel button
      else{
       //....navigate to hotel button did not available yet
      }

    },
    child: Container(
      alignment: Alignment.center,
      //set width
      width: 160,
      //set height
      height: 120,
      //set the decoration for the container
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
//covid_19 function
Widget covid_19 (context){
  //set new variable with url
var url = "https://www.mayoclinic.org/ar/diseases-conditions/coronavirus/in-depth/coronavirus-safe-travel-advice/art-20486965";
//ink well widget make the content clickable..
 return InkWell(
   onTap: (){
     //on click navigate to InstructionWebView page
     Navigator.push(context,
         MaterialPageRoute(builder: (context) => InstructionWebView(url)));
   },
   child: Container(
     //set width
     width: MediaQuery.of(context).size.width,
     //set decoration
     decoration: BoxDecoration(
       //color
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
         //make the child content expanded
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



