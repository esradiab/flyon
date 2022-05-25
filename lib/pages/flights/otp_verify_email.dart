import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  late EmailAuth emailAuth;

  late final email;
  bool? submitValid;

  late List<String> otp;

  late String otpS;
  final TextEditingController n1Controller = TextEditingController();
  final TextEditingController n2Controller = TextEditingController();
  final TextEditingController n3Controller = TextEditingController();
  final TextEditingController n4Controller = TextEditingController();
  final TextEditingController n5Controller = TextEditingController();
  final TextEditingController n6Controller = TextEditingController();

  _OtpVerifyEmail(email) {
    this.email = email;
  }

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

  void verifyOtp() async {
    var res = emailAuth.validateOtp(recipientMail: email, userOtp: otpS);
    if (res)
    print("otp verified");
    else
        print("verified failed ");

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        otp[0] = value;
                        otpS = otp as String;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        otp[0] = value;
                        otpS = otp as String;
                      });
                    },
                    controller: n1Controller,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next),
              ),
              Container(
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        otp[1] = value;
                        otpS = otp as String;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        otp[1] = value;
                        otpS = otp as String;
                      });
                    },
                    controller: n2Controller,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next),
              ),
              Container(
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        otp[2] = value;
                        otpS = otp as String;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        otp[2] = value;
                        otpS = otp as String;
                      });
                    },
                    controller: n3Controller,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next),
              ),
              Container(
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        otp[3] = value;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        otp[3] = value;
                        otpS = otp as String;
                      });
                    },
                    controller: n4Controller,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next),
              ),
              Container(
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        otp[4] = value;
                        otpS = otp as String;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        otp[4] = value;
                        otpS = otp as String;
                      });
                    },
                    controller: n5Controller,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next),
              ),
              Container(
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        otp[5] = value;
                        otpS = otp as String;
                        otpS = otp as String;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        otp[5] = value;
                        otpS = otp as String;
                        otpS = otp as String;
                        print (otpS);
                      });
                    },
                    controller: n6Controller,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    ));
  }
}
