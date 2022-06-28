import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/model/passengersmodel.dart';
import 'package:untitled/pages/flights/passenger.dart';

import '../../pages/flights/selectairport.dart';
import 'searchflights.dart';

class OneWay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OneWay();
  }
}

class _OneWay extends State<OneWay> {
  String from = "From";
  String to = "To";
  String selectedClass = "economy class";
  String selectedPayment = "cash";
 late String selectedAirport;

  String validate = ' ';
  Color color = Colors.grey;
  Color colorTo = Colors.grey;

  List<String>? payment = ["cash", "check", "bank card"];
  List<String>? classes = ["economy class", "business class", "first class"];
  int adult = 1, child = 0, infant = 0;
  String sadult = "adult", schild = "child", sinfant = "infant";
  late PassengerModel passengermodel =
      PassengerModel(adult, child, infant, sadult, schild, sinfant);
  DateTime? _dateTime;

  _pickdate() async {
    DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: _dateTime == null ? DateTime.now() : _dateTime!,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickdate != null) {
      setState(() {
        _dateTime = pickdate;
      });
    }
  }

  final dateform = GlobalKey<FormState>();

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
              height: 65,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: InkWell(
                onTap: () async {
                  selectedAirport = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectAirport()));

                  setState(() {
                    from = selectedAirport;
                    print(from);
                    color = Colors.black;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flight_takeoff,
                      color: Colors.grey,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        from,
                        style: TextStyle(
                          fontSize: 18,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 65,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: InkWell(
                onTap: () async {
                  selectedAirport = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectAirport()));

                  setState(() {
                    to = selectedAirport;
                    print(to);
                    colorTo = Colors.black;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flight_land,
                      color: Colors.grey,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        to,
                        style: TextStyle(
                          fontSize: 18,
                          color: colorTo,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Center(
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "departure date",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _pickdate();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(10),
                          width: 150,
                          child: Text(
                              _dateTime == null
                                  ? "pick date"
                                  : DateFormat("yyyy-MM-dd")
                                      .format(_dateTime!)
                                      .toString(),
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ],
                  ),
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
                Center(
                    child: Icon(
                  Icons.card_travel_outlined,
                  color: Colors.grey,
                  size: 30,
                )),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "class: ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 200,
                  child: DropdownButton<String>(
                    itemHeight: 50,
                    hint: Text("choose class"),
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 24,
                    ),
                    items: classes!.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        this.selectedClass = newvalue!;
                      });
                    },
                    value: selectedClass,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Icon(
                  Icons.payment,
                  color: Colors.grey,
                  size: 30,
                )),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "payment method: ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 150,
                  child: DropdownButton<String>(
                    itemHeight: 50,
                    hint: Text("choose payment method"),
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 24,
                    ),
                    items: payment!.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        this.selectedPayment = newvalue!;
                      });
                    },
                    value: selectedPayment,
                  ),
                ),
              ],
            ),
            Divider(),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff78c6a3)),
              child: MaterialButton(
                  child: Text("Search"),
                  onPressed: () {
                    if (_dateTime == null) {

                      setState(() {
                        validate = '* please enter flight date!';
                      });

                    }
                      else if (from == 'From' || to == 'To'){
                     setState(() {
                       validate = '* please enter Airport!';
                     });
                    } else{
                      /*setState(() {
                        validate = '* please enter city!';
                        });*/
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchFlights(
                                  from,
                                  to,
                                  _dateTime!,
                                  selectedClass,
                                  selectedPayment,
                                  adult,
                                  child,
                                  infant,
                                                 1)));}
                  }),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                validate,
                style: TextStyle(fontSize: 15, color: Colors.red),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
