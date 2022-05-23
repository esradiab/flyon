import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PassengerInformation extends StatefulWidget {
  final airwayId, flightId, from, to;

  final flightDate;
  final adult, infant, child;
  final departureTime, arrivalTime;

  final flightType;

  PassengerInformation(
    this.from,
    this.to,
    this.adult,
    this.child,
    this.infant,
    this.flightType,
    this.airwayId,
    this.flightId,
    this.flightDate,
    this.departureTime,
    this.arrivalTime,
  );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PassengerInformation(from, to, adult, child, infant, flightType,
        airwayId, flightId, flightDate, departureTime, arrivalTime);
  }
}

class _PassengerInformation extends State<PassengerInformation> {
  final airwayId, flightId, from, to;
  final flightDate;
  final adult, infant, child;
  final departureTime, arrivalTime;
  final flightType;

  _PassengerInformation(
      this.from,
      this.to,
      this.adult,
      this.child,
      this.infant,
      this.flightType,
      this.airwayId,
      this.flightId,
      this.flightDate,
      this.departureTime,
      this.arrivalTime);

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late String bookingID;

  late String phone, email;

  late List<String> firstNameAdult = ['adults first name', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> fatherNameAdult = ['adults father name', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> lastNameAdult = ['adults last name', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> firstNameChild = ['children first name', ' ', ' ', ' ', ' ', ' ', ' ' , ' ' , ' ' , ' '];
  late List<String> fatherNameChild = ['children father name', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' ' , ' '];
  late List<String> lastNameChild = ['children last name', ' ', ' ', ' ', ' ', ' ', ' ' , ' ' , ' ', ' '];
  late List<String> firstNameInfant = ['infants first name', ' ' , ' '];
  late List<String> fatherNameInfant= ['infants father name', ' ' , ' '];
  late List<String> lastNameInfant = ['infants last name' , ' ' , ' '];
  List<String?> adults = ['adults', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> children = ['children', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> infants = ['infants', ' ' , ' '];
  late List<int> adultsAge = [
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
  ];

  late List<int> childrenAge = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  late List<String> infantsAge = ['<2'];
  late List<String> gender = ['male', 'female'];
  int selectedAdultsAge = 18;
  int selectedChildrenAge = 10;
  String selectedInfantsAge = '<2';

  String selectedGender = 'male';


  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //app bar background color..
        backgroundColor: Color(0xff78c6a3),
        //app bar title..
        title: Text("Booking Information" ,
          //text style..
          style:  TextStyle(
            fontFamily: "Lobster",
            fontSize: 25 ,
            color: Colors.black ,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
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
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            phone = _phoneController.text;
                            print(phone);
                          },
                          validator: (value){
                            if(value == null){
                              return 'phone number is required!' ;
                            }
                              if(value.length < 7 || value.length > 10 ){
                                return 'enter valid phone number!';
                              }
                            String pattern =
                                r'^(?:09[124])?[0-9]{7}$';
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
                          autovalidateMode: AutovalidateMode.always, keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            email = _emailController.text;
                          },

                          validator: (value) {
                            if(value == null){
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
                            SizedBox(
                            height: 10,
                            ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('booking Id:',
                            style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Id15585'),
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
                for (int i = 1; i <= adult; i++)
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 20,
                      height: 450,
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
                                "adult $i information :",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )),
                          // this field to write the first name of adult passenger.....
                          TextFormField(
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              }

                            },
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              firstNameAdult[i] = value;
                              adults[i] =
                                  firstNameAdult[i] + " " + fatherNameAdult[i] + " " + lastNameAdult[i];
                            },
                            onFieldSubmitted: (value) {
                              firstNameAdult[i] = value;
                              adults[i] =
                                  firstNameAdult[i] + " " + fatherNameAdult[i] + " " + lastNameAdult[i];
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'FirstName',
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              hintText: 'first name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // this field to write the last name of adult passenger.....
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              }
                            },
                            onChanged: (value) {
                              fatherNameAdult[i] = value;
                              adults[i] =
                                  firstNameAdult[i] + " " + fatherNameAdult[i] + " " + lastNameAdult[i];

                            },
                            onFieldSubmitted: (value) {
                              fatherNameAdult[i] = value;
                              adults[i] =
                                  firstNameAdult[i] + " " + fatherNameAdult[i] + " " + lastNameAdult[i];

                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              labelText: 'father Name',
                              hintText: 'father name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              }
                            },
                            onChanged: (value) {
                              lastNameAdult[i] = value;
                              adults[i] =
                                  firstNameAdult[i] + " " + fatherNameAdult[i] + " " + lastNameAdult[i];

                            },
                            onFieldSubmitted: (value) {
                              lastNameAdult[i] = value;
                              adults[i] =
                                  firstNameAdult[i] + " " + fatherNameAdult[i] + " " + lastNameAdult[i];

                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              labelText: 'Last Name',
                              hintText: 'last name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //choose passenger age using drop down button...
                          Row(
                            children: [
                              Text('Age: '),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 150,
                                child: DropdownButton<int>(
                                  itemHeight: 50,
                                  hint: Text("choose passenger age"),
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 24,
                                  ),
                                  items: adultsAge.map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        "$value",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (int? newvalue) {
                                    setState(() {
                                      this.selectedAdultsAge = newvalue!;
                                    });
                                  },
                                  value: selectedAdultsAge,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //choose passenger gender using drop down button...
                          Row(
                            children: [
                              Text('Gender: '),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 150,
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
                                        "$value",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      this.selectedGender = newvalue!;
                                    });
                                  },
                                  value: selectedGender,
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
                //show children passengers information..
                for (int i = 1; i <= child; i++)
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 20,
                      height:450,
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
                                'child $i information :',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )),
                          // this field to write the first name of adult passenger.....
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              }
                            },
                            onChanged: (value) {
                              firstNameChild[i] = value;
                              children[i] =
                                  firstNameChild[i] + " " + fatherNameChild[i] + " " + lastNameChild[i];
                            },
                            onFieldSubmitted: (value) {
                              firstNameChild[i] = value;
                              children[i] =
                                  firstNameChild[i] + " " + fatherNameChild[i] + " " + lastNameChild[i];
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'FirstName',
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              hintText: 'first name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // this field to write the last name of adult passenger.....
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              }
                            },
                            onChanged: (value) {
                              fatherNameChild[i] = value;
                              children[i] =
                                  firstNameChild[i] + " " + fatherNameChild[i] + " " + lastNameChild[i];
                            },
                            onFieldSubmitted: (value) {
                              fatherNameChild[i] = value;
                              children[i] =
                                  firstNameChild[i] + " " + fatherNameChild[i] + " " + lastNameChild[i];
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              labelText: 'father Name',
                              hintText: 'father name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              }
                            },
                            onChanged: (value) {
                              lastNameChild[i] = value;
                              children[i] =
                                  firstNameChild[i] + " " + fatherNameChild[i] + " " + lastNameChild[i];
                            },
                            onFieldSubmitted: (value) {
                              lastNameChild[i] = value;
                              children[i] =
                                  firstNameChild[i] + " " + fatherNameChild[i] + " " + lastNameChild[i];
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              labelText: 'Last Name',
                              hintText: 'last name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //choose passenger age using drop down button...
                          Row(
                            children: [
                              Text('Age: '),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 150,
                                child: DropdownButton<int>(
                                  itemHeight: 50,
                                  hint: Text("choose passenger age"),
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 24,
                                  ),
                                  items: childrenAge.map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        "$value",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (int? newvalue) {
                                    setState(() {
                                      this.selectedChildrenAge = newvalue!;
                                    });
                                  },
                                  value: selectedChildrenAge,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //choose passenger gender using drop down button...
                          Row(
                            children: [
                              Text('Gender: '),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 150,
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
                                        "$value",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      this.selectedGender = newvalue!;
                                    });
                                  },
                                  value: selectedGender,
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
                //show infants passengers information..
                for (int i = 1; i <= infant; i++)
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 20,
                      height: 450,
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
                                'infant $i information :',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )),
                          // this field to write the first name of adult passenger.....
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              }
                            },
                            onChanged: (value) {
                              firstNameInfant[i] = value;
                              infants[i] =
                                  firstNameInfant[i] + " " + fatherNameInfant[i] + " " + lastNameInfant[i];
                            },
                            onFieldSubmitted: (value) {
                              firstNameInfant[i] = value;
                              infants[i] =
                                  firstNameInfant[i] + " " + fatherNameInfant[i] + " " + lastNameInfant[i];
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'FirstName',
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              hintText: 'first name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // this field to write the last name of adult passenger.....
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              }
                            },
                            onChanged: (value) {
                              fatherNameInfant[i] = value;
                              infants[i] =
                                  firstNameInfant[i] + " " + fatherNameInfant[i] + " " + lastNameInfant[i];

                            },
                            onFieldSubmitted: (value) {
                              fatherNameInfant[i] = value;
                              infants[i] =
                                  firstNameInfant[i] + " " + fatherNameInfant[i] + " " + lastNameInfant[i];
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              labelText: 'father Name',
                              hintText: 'father name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text!';
                              }
                              if (value.length < 3) {
                                return 'Too short!';
                              }
                            },
                            onChanged: (value) {
                              lastNameInfant[i] = value;
                              infants[i] =
                                  firstNameInfant[i] + " " + fatherNameInfant[i] + " " + lastNameInfant[i];

                            },
                            onFieldSubmitted: (value) {
                              lastNameInfant[i] = value;
                              infants[i] =
                                  firstNameInfant[i] + " " + fatherNameInfant[i] + " " + lastNameInfant[i];
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.drive_file_rename_outline,
                                color: Color(0xff78c6a3),
                              ),
                              labelText: 'Last Name',
                              hintText: 'last name',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //choose passenger age using drop down button...
                          Row(
                            children: [
                              Text('Age: '),
                              SizedBox(
                                width: 10,
                              ),
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
                                      value: value,
                                      child: Text(
                                        "$value",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      this.selectedInfantsAge = newvalue!;
                                    });
                                  },
                                  value: selectedInfantsAge,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //choose passenger gender using drop down button...
                          Row(
                            children: [
                              Text('Gender: '),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 150,
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
                                        "$value",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      this.selectedGender = newvalue!;
                                    });
                                  },
                                  value: selectedGender,
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
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // use the information provided
                      formKey.currentState!.save();
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width-30,
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
