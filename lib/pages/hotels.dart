import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled/ontab/ontabhotel.dart';

class Hotels extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Hotels();
  }
}

class _Hotels extends State<Hotels>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home :Scaffold(
        body: Container(
          child  :FutureBuilder(
            future: DefaultAssetBundle.of(context)
            .loadString('json/hotels.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnTabHotel(index)));
                    },
                    child: Container(
                      height: 120,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide( color: Colors.grey,width: 3),
                          )
                    ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                             width: 100,
                             decoration: BoxDecoration(
                              image :DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(data[index]["photos"][0]),
                          )),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(data[index]["name"] + " hotel" ,
                                    style:TextStyle(
                                    fontWeight: FontWeight.w700 ,
                                      fontSize: 18
                                    ))),
                                Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for(int i=0 ; i<data[index]["stars"] ; i++)
                                      Icon(Icons.star_sharp , size: 20, color: Colors.yellow,),
                                  ],
                                ),
                                Expanded(
                                    child: Text(data[index]["prices"] + " LYD" ,
                                    style:TextStyle(
                                        fontFamily: "Besley",
                                        color: Colors.green,
                                        fontSize: 18
                                    ))
                                ),
                                Expanded(
                                    child: Text( "city: " + data[index]["city"]  ,
                                        style:TextStyle(
                                            fontFamily: "Besley",
                                            color: Colors.black87,
                                            fontSize: 18
                                        ))
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data == null ? 0 : data.length,
              );

            })
        )));
  }
}