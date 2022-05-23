import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

class OnTabAirway extends StatefulWidget {
  int? index;
  OnTabAirway(index) {
    this.index = index;
  }
  @override
  State<StatefulWidget> createState() => _OnTabAirwayState(index);
}

class _OnTabAirwayState extends State<OnTabAirway> {
  int? index;

  _OnTabAirwayState(index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          //set hight..
          toolbarHeight: 50,
          //set the title in the center..
          //app bar background color..
          backgroundColor: Color(0xff78c6a3),
          //app bar title..
          title: Text(
            "Airway Detail",
            //text style..
            style: TextStyle(
              fontFamily: "Lobster",
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future:
                  DefaultAssetBundle.of(context).loadString('json/airway.json'),
              builder: (context, snapshot) {
                // Decode the JSON
                var data = json.decode(snapshot.data.toString());
                if(data == null){
                  return Center(
                    child: Text("Loading..."),
                  );
                }
                else
                return Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                      image: AssetImage(data[index]["pic"][1]),
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Description : ",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0 , right: 10 , bottom: 10),
                      child: ExpandableText(
                        data[index]["description"],
                        style: TextStyle(fontSize: 18 ,color: Colors.black),
                        expandText: 'show more',
                        collapseText: 'show less',
                        maxLines: 2,
                        linkColor: Color(0xff78c6a3),
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10.0 , right: 10 , bottom: 5 ,top: 5),
                       child: Text("phone: "  , style: TextStyle(fontSize: 18 , color: Colors.black , fontWeight: FontWeight.w700),),
                     ),
                    Container(padding:EdgeInsets.only(left: 10 , right: 10),child: Text(data[index]["phone"] , style: TextStyle(fontSize: 18 , color: Colors.black ,),), ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0 , right: 10 , top: 5, bottom: 5),
                      child: Text("website: "  , style: TextStyle(fontSize: 18 , color: Colors.black ,  fontWeight: FontWeight.w700)),),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,right: 10),
                      child: Text(data[index]["website"] ,style: TextStyle(fontSize: 18 ,color: Color(0xff78c6a3),) ,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10 , bottom: 5 ,top: 5),
                      child: Text("airport: " , style: TextStyle(fontSize: 18 , color: Colors.black , fontWeight: FontWeight.w700) ),),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,right: 10),
                      child: Text(data[index]["airport"] , style: TextStyle(fontSize: 18 , color: Colors.black , )),
                    ),
                  ],
                ));
              }),
        ));
  }
}
