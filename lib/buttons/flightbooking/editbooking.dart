import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/pages/flights/airways.dart';
import 'package:untitled/pages/flights/flightstopbar.dart';

class EditBookingData extends StatefulWidget {
  final email;
  final phone;
  final bookingId;
  final passengerData;

  EditBookingData(this.email, this.phone, this.bookingId, this.passengerData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditBookingData(email, phone, bookingId, passengerData);
  }
}

class _EditBookingData extends State<EditBookingData> {
  late String email;
  late String phone;
  late String bookingId;

  late List passengerData;

  _EditBookingData(this.email, this.phone, this.bookingId, this.passengerData);

  late List<String> adultsAge = [for (int i = 18; i <= 100; i++) '$i'];
  late List<String> childrenAge =  [for (int i = 2; i < 18; i++)
    if(i<10)
    '0$i'
  else
    '$i'
  ];
  late List<String> infantsAge = ['<2'];
  late List<String> gender = ['male', 'female'];

  Future upDateData ()async {

    var map = passengerData.cast<Map<String, dynamic>>();

    var url = Uri.parse("http://172.20.10.5/booking/updatedata.php");
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', url);
    request.bodyFields ={
      'booking_id' : bookingId,
      'phone' : phone,
      'email' : email,
      'passenger_data': json.encode(map)
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("done!" , style: TextStyle(
            color: Colors.green
          ),),
          content: const Text("You update your data successfully!"),
        ),
      ).then((value){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopBar()));
      });

    }
    else{
      print("error");
      throw Exception("failed to load post");

    }

  }


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //show booking information..
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 20,
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(
                              0, 3), // changes position o position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Booking information :',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            )),
                        TextFormField(
                          initialValue: phone,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            setState(() {
                              phone= value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              phone = value;
                              print(phone);
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'phone number is required!';
                            }
                            if (value.length < 7 || value.length > 11) {
                              return 'enter valid phone number!';
                            }
                            String pattern = r'^(?:09[124])?[0-9]{7}$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value))
                              return 'Enter a valid phone number!';
                            else
                              return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'phone',
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Color(0xff78c6a3),
                            ),
                            hintText: '091-1111111',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: email,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {

                              email = value; print(email);
                            });

                          },
                          validator: (value) {
                            if (value == null) {
                              return 'email is required !';
                            }
                            String pattern =
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$";
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value))
                              return 'Enter a valid email address!';
                            else
                              return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xff78c6a3),
                            ),
                            labelText: 'email',
                            hintText: 'example@gmail.com',
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //show adults passengers information..
                for (int i = 0; i < passengerData.length; i++)
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(
                                0, 3), // changes position o position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "passenger information :",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )),
                          // this field to write the first name of adult passenger.....
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              } else
                                return null;
                            },
                            initialValue: passengerData[i]['full_name'],
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              setState(() {
                                passengerData[i]['full_name'] = value;
                              });

                            },
                            onFieldSubmitted: (value) {
                              setState(() {
                                passengerData[i]['full_name'] = value;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'full Name',
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              hintText: 'full name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //choose passenger age using drop down button...
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.centerLeft,
                                  child: Text('Age: ')),
                              SizedBox(
                                width: 10,
                              ),
                              if (passengerData[i]['age'].compareTo('18') < 0 &&  passengerData[i]['age'].compareTo('02') >=0)
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 250,
                                child: DropdownButtonFormField<String>(
                                  itemHeight: 50,
                                  hint: Text("choose passenger age"),
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 24,
                                  ),
                                  items: childrenAge.map((String value) {
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
                                  onChanged: (String? value) {
                                    setState(() {
                                    passengerData[i]['age'] = value;
                                    });
                                  },
                                  value: passengerData[i]['age'],
                                ),
                              ),
                              if (passengerData[i]['age'].compareTo('18') >= 0)
                                Container(
                                  width: 150,
                                  child: DropdownButton<String>(
                                    itemHeight: 50,
                                    hint: Text("choose passenger age"),
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      size: 24,
                                    ),
                                    items: adultsAge.map((String value) {
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
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        passengerData[i]['age']=newValue;
                                      });
                                    },
                                    value: passengerData[i]['age'],
                                  ),
                                ),
                                if (passengerData[i]['age'] == '<2')
                                  Container(
                                    width: 150,
                                    child: DropdownButton<String>(
                                      itemHeight: 50,
                                      hint: Text("choose passenger age"),
                                      isExpanded: true,
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        size: 24,
                                      ),
                                      items: infantsAge.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value:value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          passengerData[i]['age']=newValue;
                                        });
                                      },
                                      value:passengerData[i]['age'] ,
                                    ),
                                  ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //choose passenger gender using drop down button...
                          Row(
                            mainAxisAlignment:MainAxisAlignment.start ,
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [

                              Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.centerLeft,
                                  child: Text('Gender: ' ,)),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 250,
                                padding: EdgeInsets.all(10),
                                child: DropdownButton<String>(
                                    itemHeight: 50,
                                    hint: Text("choose passenger Gender"),
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      size: 24,
                                    ),
                                    items: gender.map((String value) {
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
                                  onChanged: (String? newValue) {
                                  setState(() {
                                    passengerData[i]['gender'] = newValue;
                                  });

                                  },
                                  value: passengerData[i]['gender'] ,

                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // use the information provided
                      try {
                        upDateData();
                      } catch (e, s) {
                        print(s);
                      }
                      formKey.currentState!.save();

                    }
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
                        "Save",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
