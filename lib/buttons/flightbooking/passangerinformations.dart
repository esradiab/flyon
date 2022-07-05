import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:untitled/buttons/flightbooking/add_database.dart';
import 'package:uuid/uuid.dart';

class PassengerInformation extends StatefulWidget {
  final flightId;

  final adult, infant, child;


  final flightType;

  PassengerInformation(
    this.adult,
    this.child,
    this.infant,
    this.flightType,
    this.flightId,
  );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PassengerInformation( adult, child, infant, flightType,
        flightId);
  }
}

class _PassengerInformation extends State<PassengerInformation> {
  final  flightId;
  final adult, infant, child;
  final flightType;
  late EmailAuth emailAuth = EmailAuth(sessionName: ' ');
  _PassengerInformation(

      this.adult,
      this.child,
      this.infant,
      this.flightType,
      this.flightId
      );

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late String bookingID = " ";

  late String phone, email;
  late bool submitValid ;
  var uuid = Uuid();

  late List<String> firstNameAdult = ['adults first name', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> fatherNameAdult = ['adults father name', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> lastNameAdult = ['adults last name', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> firstNameChild = ['children first name', ' ', ' ', ' ', ' ', ' ', ' ' , ' ' , ' ' , ' '];
  late List<String> fatherNameChild = ['children father name', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' ' , ' '];
  late List<String> lastNameChild = ['children last name', ' ', ' ', ' ', ' ', ' ', ' ' , ' ' , ' ', ' '];
  late List<String> firstNameInfant = ['infants first name', ' ' , ' '];
  late List<String> fatherNameInfant= ['infants father name', ' ' , ' '];
  late List<String> lastNameInfant = ['infants last name' , ' ' , ' '];
  late List<String> adults = ['adults', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> children = ['children', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> infants = ['infants', ' ' , ' '];
  late List<String> adultGender = ['adults gender', 'male', 'male', 'male', 'male', 'male', 'male', 'male', 'male' , 'male'];
  late List<String> childrenGender = ['children gender', 'male', 'male', 'male', 'male', 'male', 'male', 'male', 'male' , 'male'];
  late List<String> infantsGender = ['infants gender', 'male' , 'male'];
  late List<String> adultsAg = ['adults age', '18', '18', '18', '18', '18', '18', '18', '18' , '18'];
  late List<String> childrenAg = ['children age', '10', '10', '10', '10', '10', '10', '10', '10' , '10'];
  late List<String> infantsAg = ['infants age', '<2>' , '<2>'];
  late List<String> adultsAge =  [for (int i = 18; i <= 100; i++) '$i'];
  late List<String> allPassengerName = [' ', ' ', ' ', ' '  , ' ', ' ', ' ', ' ', ' ' , ' '] ;
  late int allPassengerCount = adult + child + infant ;
  late List<String> allAges = [' ', ' ', ' ', ' '  , ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> allGender=[' ', ' ', ' ', ' '  , ' ', ' ', ' ', ' ', ' ' , ' '];
  late List<String> childrenAge =  [for (var i = 2; i <= 12; i++) "$i"];
  late List<String> infantsAge = ['<2'];
  late List<String> gender = ['male', 'female'];
  int selectedAdultsAge = 18;
  int selectedChildrenAge = 10;
  String selectedInfantsAge = '<2';
  String selectedGender = 'male';
  int count = 13 ;


  Future sendEmail()async{
    final serviceId = 'fly_on_service';
    final templateId ='template_ts4crku' ;
    final userId = 'O9JMv9WgOmy24AtUP';
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url ,
        headers: {
          'origin':'http//localhost',
          'Content-Type': 'application/json',},
        body:  json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params":{
            "to_name": adults[1],
            "to_email":email ,
            "booking_id": bookingID
          }
        }));
    print(response.body);
  }

  final formKey = GlobalKey<FormState>();
  void sendOTP() async {

    bool res = await emailAuth.sendOtp(recipientMail: email, otpLength: 6);
    if (res) {
      // using a void function because i am using a
      // stateful widget and seting the state from here.
      setState(() {
        submitValid = true;
      });
    }
  }

  Future insertData ()async {
    late List data =
    [    for(int i = 1 ; i<=allPassengerCount ; i++)
      {
        "full_name":allPassengerName[i],
        "age":allAges[i],
        "gender":allGender[i],
        "booking_id":bookingID,
      }];
    var map = data.cast<Map<String, dynamic>>();

    var url = Uri.parse("http://172.20.10.5/booking/insertdata.php");
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', url);
    request.bodyFields ={
      'booking_id' : bookingID,
      'phone' : phone,
      'email' : email,
      'passenger_data': json.encode(map)
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    //print(data);
    if(response.statusCode == 200){
      print(request.bodyFields);
      //return BookingDataModel.fromJson(response) ;
    }
    else{
      print("error");
      throw Exception("failed to load post");

    }

  }

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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: _emailController ,
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
                              else
                                return null ;

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
                              else
                                return null;
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
                              else return null;
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
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      adultsAg[i]= newvalue! ;

                                    });
                                  },
                                  value: adultsAg[i],
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
                                      adultGender[i] = newvalue! ;
                                    });
                                  },
                                  value: adultGender[i],
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
                              else return null;
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
                              else return null;
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
                              else return null;
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
                                child: DropdownButton<String>(
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
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      childrenAg[i]  =newvalue!  ;
                                    });
                                  },
                                  value: childrenAg[i],
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
                                      childrenGender[i] = newvalue! ;
                                    });
                                  },
                                  value: childrenGender[i],
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
                              else return null;
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
                              else return null;
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
                              else return null;
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
                                       value,
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
                                        value,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      infantsGender[i]= newvalue! ;
                                    });
                                  },
                                  value: infantsGender[i],
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
                      for(int i=1 ; i<= adult ; i++) {
                        allPassengerName[i] = adults[i];
                        allAges[i] = adultsAg[i];
                        allGender[i] = adultGender[i];
                      }
                      int j=1;
                      for(int i=adult+1 ; i<= child+adult ; i++) {
                        allPassengerName[i] = children[j];
                        allAges[i] = childrenAg[j];
                        allGender[i] = childrenGender[j];
                        j++;
                      }
                       j=1 ;
                      for(int i=adult+child+1 ; i<= allPassengerCount ; i++) {
                        allPassengerName[i] = infants[j];
                        allAges[i] = infantsAg[j];
                        allGender[i] = infantsGender[j];
                      }
                      bookingID= uuid.v1();
                      try{
                        sendEmail();
                         }catch(e){print(e);}
                      try{
                        insertData(); }catch(e){ print(e);
                      }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddDatabase(
                                    email,
                                    phone,
                                    flightId,
                                    flightType,
                                    allPassengerName,
                                    allPassengerCount,
                                    allAges,
                                    allGender,
                                    bookingID)));
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
