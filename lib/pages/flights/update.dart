
import 'package:flutter/material.dart';


import 'getdata.dart';

class EditBooking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditBooking();
  }
}

class _EditBooking extends State<EditBooking> {
  late String phone , bookingId;

  //late bool submitValid;
  //late EmailAuth emailAuth = EmailAuth(sessionName: ' ');

  /*void sendOTP() async {
    bool res = await emailAuth.sendOtp(recipientMail: phone, otpLength: 6);
    if (res) {
      // using a void function because i am using a
      // stateful widget and seting the state from here.
      setState(() {
        submitValid = true;
      });
    }
  }*/

  late TextEditingController _bookingId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          decoration: BoxDecoration(
            color: Color(0x2a92b6aa),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
              child: Text("to Modify your booking information you"
                  " should enter your booking Id to get your booking data \n you can modify your booking within two days ." , style: TextStyle(
                fontSize: 17
              ),)),

      SizedBox(
        height: 10,
      ),
      TextField(
        controller: _bookingId,
        textInputAction: TextInputAction.done,
        onChanged: (value) {
          bookingId = _bookingId.text;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.password,
            color: Color(0xff78c6a3),
          ),
          labelText: 'booking Id',
          hintText: 'huy3948itje345edgw3',
        ),
      ),
      SizedBox(
        height: 10,
      ),
      MaterialButton(
        onPressed: () {

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GetDataFrom( bookingId)));

        },
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff12ba72),
                  Color(0xff92b6aa),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "submit",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )),
      ),
      SizedBox(height: 20),
    ]));
  }
}
