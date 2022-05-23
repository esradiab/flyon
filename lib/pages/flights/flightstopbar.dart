import 'package:flutter/material.dart';
import 'package:untitled/pages/flights/table.dart';
import 'package:untitled/pages/flights/update.dart';

import 'airways.dart';

class TopBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TopBar();
  }
}

class _TopBar extends State<TopBar>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
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
                Tab( child : Text("airways" ,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: ""
               ))) ,
                Tab(child: Text("table",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Lora"
                  ))),
                Tab(child: Text("edit",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Lora"
                    ))),
              ] ,
            ),),
          body: TabBarView(
            children: [
           Airways() ,
           FlightsTable(),
           EditBooking()
            ],
          ),
          )),
    );
  }
}