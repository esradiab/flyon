import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:untitled/ontab/ontabhotel.dart';

class HotelsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
        .loadString('json/hotels.json'),
    builder: (context, snapshot) {
    // Decode the JSON
    var data = json.decode(snapshot.data.toString());
    return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OnTabHotel(index)));
        },
        child: Stack(
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
                      child: Text(data[index]["name"]+" hotel" ,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),) ,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for(int i=0 ; i<data[index]["stars"] ; i++)
                            Icon(Icons.star_sharp , size: 15, color: Colors.yellow,),
                        ],
                      ),
                      Expanded(child: Text(data[index]["prices"]+" LYD" , style: TextStyle(
                        color: Colors.green ,
                        fontSize: 13 ,
                        fontWeight: FontWeight.w500
                      ),))
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
                    image: AssetImage(data[index]["photos"][0]),
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),

          ],
        ),
      );
    },
    itemCount:  data == null ? 0 : data.length,);
        });
  }
  }
