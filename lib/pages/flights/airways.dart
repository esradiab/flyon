import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled/ontab/ontabairway.dart';

class Airways extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Airways();
  }

}

class _Airways extends State<Airways>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('json/airway.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var data = json.decode(snapshot.data.toString());
              return GridView.builder(
                gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                   ),
                    itemBuilder: (BuildContext context, int index) {
                  return
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnTabAirway(index)));
                        },
                        child: Container(
                          height: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:<Widget> [
                              Container(
                                margin:EdgeInsets.only(top: 10) ,
                                padding:EdgeInsets.all(10) ,
                                  height: 140,
                                  width: 200,
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
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                              ),
                           Text(data[index]["name"] , style: TextStyle(fontSize: 18 , fontFamily: "Lora", fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                      );
                },
                itemCount:  data == null ? 0 : data.length,
              );
            }),
      ),
    );
  }

}