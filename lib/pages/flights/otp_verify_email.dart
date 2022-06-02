import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:untitled/buttons/flightbooking/add_database.dart';

class OtpVerifyEmail extends StatefulWidget {
  late final email;

  OtpVerifyEmail(email) {
    this.email = email;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OtpVerifyEmail(email);
  }
}

class _OtpVerifyEmail extends State<OtpVerifyEmail> {
  late EmailAuth emailAuth = new EmailAuth(sessionName: '');

  late final email;
  late bool otpValid = false;

  late List<String> otp;

  late String otpS = ' ';
  final TextEditingController otpController = TextEditingController();

  _OtpVerifyEmail(email) {
    this.email = email;
  }

  void verifyOtp() async {
    var res = emailAuth.validateOtp(
        recipientMail: email, userOtp: otpController.text);
    if (res) {
      print("otp verified");
      otpValid = true;
    } else {
      print("verified failed ");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                child: Image(
                  image: AssetImage('images/verify.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Email verification",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              Text("write the OTP number that we sent to your email",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                        width: 45,
                        height: 60,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff78c6a3)),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    errorPinTheme: PinTheme(
                        width: 55,
                        height: 60,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    focusedPinTheme: PinTheme(
                        width: 45,
                        height: 60,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff12ba72)),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    keyboardType: TextInputType.number,
                    controller: otpController,
                    pinContentAlignment: Alignment.center,
                    showCursor: true,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    closeKeyboardWhenCompleted: true,
                    onCompleted: (pin) {
                      verifyOtp();
                      if (otpValid) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddDatabase()));
                      } else {
                        otpValid = false;
                        setState(() {
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'error: otp number is not valid',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        });
                      }
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  verifyOtp();
                  if (otpValid) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddDatabase()));
                  } else {
                    setState(() {
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'error: otp number is not valid',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    });
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
                      "verify OTP",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )),
              ),
              SizedBox(height: 20)
            ],
          ),
        ));
  }
}
