import 'package:flutter/material.dart';
import 'package:untitled/model/passengersmodel.dart';

import '../../passenger.dart';
import '../../selectairport.dart';

class RoundTrip extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RoundTrip();
  }

}

class _RoundTrip extends State<RoundTrip>{
  String? from;
  String? to;

  int adult = 1, child = 0, infant = 0;
  String sadult = "adult", schild = "child", sinfant = "infant";

  String selectedclass= "economy class" ;
  String selectedpayment= "cash" ;
  List<String>? payment = ["cash", "check", "bank card"];
  List<String>? classes = ["economy class", "business class", "first class"];

  late PassengerModel passengermodel =
  PassengerModel(adult, child, infant, sadult, schild, sinfant);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.done,
                    showCursor: true,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "From",
                      contentPadding: EdgeInsets.all(10),
                      prefixIcon: Icon(Icons.flight_takeoff),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SelectAirport()));
                    },
                    onChanged: (String inputtext) {
                      setState(() {
                        from = inputtext;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: "to",
                        contentPadding: EdgeInsets.all(10),
                        prefixIcon: Icon(Icons.flight_land_outlined),
                      ),
                      showCursor: true,
                      readOnly: true,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SelectAirport()));
                      },
                      onChanged: (String inputtext) {
                        setState(() {
                          to = inputtext;
                        });
                      }),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "departure date",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.grey),
                                  )),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(10),
                              width: 150,
                              child: Text("select date",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "arrival date",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(10),
                              width: 150,
                              child: Text("select date",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        passengermodel = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Passenger()))
                        as PassengerModel;
                        setState(() {
                          adult = passengermodel.adult;
                          child = passengermodel.child;
                          infant = passengermodel.infant;
                          sadult = passengermodel.sadult;
                          schild = passengermodel.schild;
                          sinfant = passengermodel.sinfant;
                        });
                      },
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 50,
                          padding: EdgeInsets.all(10),
                          child: Text("$adult " + sadult,
                              style: TextStyle(
                                fontSize: 18,
                              ))),
                    ),
                    if (child > 0)
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(" , $child " + schild,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    if (infant > 0)
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(" , $infant " + sinfant,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Icon(Icons.card_travel_outlined , color: Colors.grey , size: 30,)) ,
                    SizedBox(width: 10,),
                    Text("class: " , style:  TextStyle(
                      fontSize: 20 ,
                      color: Colors.grey ,
                    ),),
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      child: DropdownButton<String>(
                        itemHeight: 50,
                        hint: Text("choose class"),
                        isExpanded: true ,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                        ),
                        items: classes!.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value , style:  TextStyle(
                              fontSize: 18 ,
                            ),),
                          );
                        }).toList(),
                        onChanged: (String? newvalue){
                          setState(() {
                            this.selectedclass = newvalue! ;
                          });
                        },
                        value: selectedclass ,

                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Icon(Icons.payment , color: Colors.grey , size: 30,)) ,
                    SizedBox(width: 10,),
                    Text("payment method: " , style:  TextStyle(
                      fontSize: 20 ,
                      color: Colors.grey ,
                    ),),
                    SizedBox(width: 10,),
                    Container(
                      width: 150,
                      child: DropdownButton<String>(
                        itemHeight: 50,
                        hint: Text("choose payment method"),
                        isExpanded: true ,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                        ),
                        items: payment!.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value , style:  TextStyle(
                              fontSize: 18 ,
                            ),),
                          );
                        }).toList(),
                        onChanged: (String? newvalue){
                          setState(() {
                            this.selectedpayment = newvalue! ;
                          });
                        },
                        value: selectedpayment ,

                      ),
                    ),
                  ],
                ),
                Divider()
              ],
            ),
          ),
        ));
  }
}
