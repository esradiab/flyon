import 'package:flutter/material.dart';

class AddDatabase extends StatefulWidget {
  final email;
  final phone;

  final flightId;

  final flightType;

  final passengersNames;

  final passengersCount;

  final ages;

  final genders;

  final bookingId;

  AddDatabase(
      this.email,
      this.phone,
      this.flightId,
      this.flightType,
      this.passengersNames,
      this.passengersCount,
      this.ages,
      this.genders,
      this.bookingId);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddDatabase(email, phone, flightId, flightType, passengersNames,
        passengersCount, ages, genders, bookingId);
  }
}

class _AddDatabase extends State<AddDatabase> {
  final email;
  final phone;

  final flightId;

  final flightType;

  final passengersNames;

  final passengersCount;

  final ages;

  final genders;

  final bookingId;

  _AddDatabase(
      this.email,
      this.phone,
      this.flightId,
      this.flightType,
      this.passengersNames,
      this.passengersCount,
      this.ages,
      this.genders,
      this.bookingId);

  //allPassengers = adults ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10 , left: 10 , right: 10 , bottom: 2),
              child: Text(" you access successfully this is your booking ID : ",
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ),
            Container(
              padding: EdgeInsets.only(top: 1 , left: 10 , right: 10 , bottom: 10),
              child: Text(
                bookingId,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            )
          ],
        ));
  }
}
