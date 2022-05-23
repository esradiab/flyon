import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ontab/ontabairway.dart';

class AirwaysView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
        .loadString('json/airway.json'),
    builder: (context, snapshot) {
    // Decode the JSON
    var data = json.decode(snapshot.data.toString());
    return ListView.builder(
       scrollDirection: Axis.horizontal,
       itemBuilder: (BuildContext context, int index) {
         return Row(
           children: [
             InkWell(
               onTap: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => OnTabAirway(index)));
               },
               child: Container(
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
                        child: Stack(
                         children:<Widget> [
                           Ink(
                             height: 120,
                             width: 130,
                             decoration: BoxDecoration(
                               boxShadow: [
                                 BoxShadow(
                                   color: Color(0x1f78c6a3),
                                   spreadRadius: 5,
                                   blurRadius: 7,
                                   offset: Offset(0, 3), // changes position of shadow
                                 ),
                               ],
                               image :DecorationImage(
                               fit: BoxFit.fill,
                               image: AssetImage(data[index]["pic"][0]),
         ),
                               borderRadius: BorderRadius.circular(10),
         )
                           ),
         ],
                        ),
               ),
             ),
             SizedBox(width: 10,)
           ],
         );
       },
      itemCount:  data == null ? 0 : data.length,
    );
  });
  }
}
