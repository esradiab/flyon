import 'package:flutter/material.dart';
import 'package:untitled/buttons/flightbooking/oneway.dart';
import 'package:untitled/buttons/flightbooking/roundtrip.dart';

class BookingTopBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookingTopBar();
  }
}

class _BookingTopBar extends State<BookingTopBar>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home : Scaffold(
            //show app bar..
            appBar: AppBar(
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
              bottom: TabBar(
                tabs: [
                  Tab( child : Text("One-Way" ,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: ""
                      ))) ,
                  Tab(child: Text("Round-Trip",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Lora"
                      ))),
                ] ,
              ),),
            body: TabBarView(
              children: [
                OneWay() ,
                RoundTrip(),
           ] ),
          )),
    );
  }
}
