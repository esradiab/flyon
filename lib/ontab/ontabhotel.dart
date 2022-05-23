import 'dart:convert';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ontab/pictureslider.dart';
import 'package:untitled/views/locationview.dart';

class OnTabHotel extends  StatefulWidget{
  int? index ;
  OnTabHotel(index){
    this.index = index;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnTabHotel(index);
  }

}

class _OnTabHotel extends State<OnTabHotel>{
  int? index ;
  _OnTabHotel(index){
    this.index = index;

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
        title: Text(
          "hotel details",
          //text style..
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
          .loadString('json/hotels.json'),
    builder: (context, snapshot) {
    // Decode the JSON
    var data = json.decode(snapshot.data.toString());
    if(data == null){
        return Center(
          child: Text("Loading..."),
        );
    }
    else
    return  Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
        height: 250,
         width: MediaQuery.of(context).size.width,
          child: PictureSlider(index!)),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description: " , style: TextStyle(
                fontSize: 19 ,
                fontFamily: "Besley",
                fontWeight: FontWeight.w700 ,
              ), ) ,
              ExpandableText(data[index]["description"], expandText: "see more" ,
                collapseText: "see less",
                maxLines: 1,
                style: TextStyle(
                  fontFamily: "Besley",
                  fontSize: 18 ,
                ),),
            Divider(),
            Row(
              children: [
                Icon(Icons.phone , size: 18 , color: Color(0xff78c6a3),) ,
                SizedBox(width: 10,),
                Text("Phone: ", style: TextStyle(
                  fontSize: 18 ,
                  fontWeight: FontWeight.w700 ,
                ), ),
                Text(data[index]["phone"] ,style: TextStyle(
      fontSize: 18 ,
      ),)
              ],
            ) ,
              Row(
                children: [
                  Icon(Icons.location_city , color:  Colors.grey , size: 18,),
                  SizedBox(width: 10,),
                  Text("city: ", style: TextStyle(
                    fontSize: 18 ,
                    fontWeight: FontWeight.w700 ,
                  ), ),
                  Text(data[index]["city"] ,style: TextStyle(
                    fontSize: 18 ,
                  ),)
                ],
              ) ,
              Row(
                children: [
                  Icon(Icons.price_change , size: 18 , color: Colors.green,),
                  SizedBox(width: 10,),
                  Text("prices: ", style: TextStyle(
                    fontSize: 18 ,
                    fontWeight: FontWeight.w700 ,
                  ), ),
                  Text(data[index]["prices"] + " LYD" ,style: TextStyle(
                    fontSize: 18 ,
                  ),)
                ],
              ) ,
              Divider(),
              Text("conditions:"  , style: TextStyle(
                fontSize: 19 ,
                fontFamily: "Besley",
                fontWeight: FontWeight.w700 ,
              ),),
              Row(
                children: [
                  Icon(Icons.access_time , size: 18 , color: Colors.blueGrey,),
                  SizedBox(width: 10,),
                  Text("Time_Entry: ", style: TextStyle(
                    fontSize: 18 ,
                    fontWeight: FontWeight.w500 ,
                  ), ),
                  Text(data[index]["conditions"]["time_entry"],style: TextStyle(
                    fontSize: 18 ,
                  ),)
                ],
              ) ,
              Row(
                children: [
                  Icon(Icons.access_time , size: 18 , color: Colors.blueGrey,),
                  SizedBox(width: 10,),
                  Text("Time_go_out: ", style: TextStyle(
                    fontSize: 18 ,
                    fontWeight: FontWeight.w500 ,
                  ), ),
                  Text(data[index]["conditions"]["time_go_out"] ,style: TextStyle(
                    fontSize: 18 ,
                  ),)
                ],
              ) ,
              Divider(),
              Container(
                padding: EdgeInsets.only(top: 10 , bottom: 10),
                child: Text("Location:" ,  style: TextStyle(
                fontSize: 19 ,
                fontFamily: "Besley",
                fontWeight: FontWeight.w700 ,
                ),),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationView(index)));
                },
                child: Image.asset(
                  data[index]["location"] ,
                  height: 200 ,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
         ],),
        ),
      Divider(),
         Text("Featuers:" ,  style: TextStyle(
          fontSize: 19 ,
          fontFamily: "Besley",
          fontWeight: FontWeight.w700 ,
        ),),
      Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              if(data[index]["features"]["wifi"])
                Row(
                  children: [
                    Icon(Icons.wifi , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("WiFi")
                  ],
                ),
              if(data[index]["features"]["conditioner"])
                Row(
                  children: [
                    Icon(Icons.air , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("conditioner")
                  ],
                ),
              if(data[index]["features"]["swimming_pool"])
                Row(
                  children: [
                    Icon(Icons.pool , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("swimming pool"),
                  ]),
                    if(data[index]["features"]["car_Park"])
                      Row(
                        children: [
                          Icon(Icons.garage , color: Colors.grey, size: 18,),
                          SizedBox(width: 8,) ,
                          Text("car_Park")
                        ],
                      ),
                    if(data[index]["features"]["restaurant"])
                      Row(
                        children: [
                          Icon(Icons.restaurant , color: Colors.grey, size: 18,),
                          SizedBox(width: 8,) ,
                          Text("restaurant")
                        ],
                      ),
              if(data[index]["features"]["free_breakfast"])
                Row(
                  children: [
                    Icon(Icons.free_breakfast , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("free breakfast")
                  ],
                ),
              if(data[index]["features"]["bar"])
                Row(
                  children: [
                    Icon(Icons.local_bar , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("bar")
                  ],
                ),
              if(data[index]["features"]["room_service"])
                Row(
                    children: [
                      Icon(Icons.room_service , color: Colors.grey, size: 18,),
                      SizedBox(width: 8,) ,
                      Text("room service"),]),
              if(data[index]["features"]["dry_laundry"])
                Row(
                  children: [
                    Icon(Icons.local_laundry_service , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("dry laundry")
                  ],
                ),
              if(data[index]["features"]["bus"])
                Row(
                  children: [
                    Icon(Icons.bus_alert , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("bus")
                  ],
                ),
              if(data[index]["features"]["suitable_fo_people_with_special_needs"])
                Row(
                  children: [
                    Icon(Icons.accessible , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("suitable for people with special needs")
                  ],
                ),

              if(data[index]["features"]["business_center"])
                Row(
                  children: [
                    Icon(Icons.business_center , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("business center")
                  ],
                ),
              if(data[index]["features"]["gym"])
                Row(
                    children: [
                      Icon(Icons.fitness_center , color: Colors.grey, size: 18,),
                      SizedBox(width: 8,) ,
                      Text("gym"),
                    ]),
              if(data[index]["features"]["baby_sitting"])
                Row(
                  children: [
                    Icon(Icons.baby_changing_station , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("baby_sitting")
                  ],
                ),
              if(data[index]["features"]["non_smoking_room"])
                Row(
                  children: [
                    Icon(Icons.smoke_free , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("non_smoking_room")
                  ],
                ),
              if(data[index]["features"]["allow_pets"])
                Row(
                  children: [
                    Icon(Icons.pets , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("allow_pets")
                  ],
                ),
              if(data[index]["features"]["spa"])
                Row(
                  children: [
                    Icon(Icons.spa , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("spa")
                  ],
                ),
              if(data[index]["features"]["hot_tub"])
                Row(
                  children: [
                    Icon(Icons.hot_tub , color: Colors.grey, size: 18,),
                    SizedBox(width: 8,) ,
                    Text("hot_tub")
                  ],
                ),
                  ],
          ),)
    ],
    );
    }),
      )
    );
        }
}