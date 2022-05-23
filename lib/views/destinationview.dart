import 'dart:convert';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DestinationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('json/destinations.json'),
        builder: (context, snapshot) {
          // Decode the JSON
          var data = json.decode(snapshot.data.toString());
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                  ),
                  Positioned(
                    left: 5,
                    bottom: 10,
                    child: Container(
                      padding: EdgeInsets.only(top: 20 , left: 10 , right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10) ,
                          bottomRight:Radius.circular(10) ,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],),
                      height: 100,
                      width:160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(data[index]["city"] ,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),) ,),
                          Text(data[index]["country"] , style: TextStyle(
                              color: Colors.green ,
                              fontSize: 13 ,
                              fontWeight: FontWeight.w500
                          ),),
                          ExpandableText(
                             data[index]["Description"],
                            maxLines: 2, expandText: '',

                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        image :DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(data[index]["URLpicture"]),
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),

                ],
              );
            },
            itemCount:  data == null ? 0 : data.length,);
        });
  }
}
