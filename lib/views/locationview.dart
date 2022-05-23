import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationView extends StatelessWidget{
  int? index ;
  LocationView(index){
    this.index = index ;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //set hight..
        toolbarHeight: 50,
        //app bar background color..
        backgroundColor: Color(0xff78c6a3),
        //app bar title..
      ),
      backgroundColor: Colors.black,
      body: Center(
            child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
            .loadString('json/hotels.json'),
        builder: (context, snapshot) {
          // Decode the JSON
          var data = json.decode(snapshot.data.toString());
          if (data == null) {
            return Center(
              child: Text("Loading..."),
            );
          }
          else
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                decoration:BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      data[index]["location"] ,
                    ),
                    fit: BoxFit.cover,
                  )
                )  ,

     ),
            );
        }),
        ),
      );
  }

}