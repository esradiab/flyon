import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDatabase extends StatefulWidget{
  final email;
  final phone ;
  final flightId ;
  final flightType ;
  final passengersNames ;
  final passengersCount ;
  final ages ;
  final genders ;

  AddDatabase(this.email , this.phone  , this.flightId , this.flightType ,  this.passengersNames ,
      this.passengersCount , this.ages , this.genders);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddDatabase(email ,phone , flightId , flightType , passengersNames , passengersCount ,
        ages , genders);
  }

}

class _AddDatabase extends State<AddDatabase>{
  final email;
  final phone ;
  final flightId ;
  final flightType ;
  final passengersNames ;
  final passengersCount ;
  final ages ;
  final genders ;
  String bookingId= '01223';
  _AddDatabase(this.email , this.phone  , this.flightId , this.flightType ,  this.passengersNames , this.passengersCount ,
      this.ages , this.genders);
  //allPassengers = adults ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: Text(" you access successfully"),
      )

    );


}
}
