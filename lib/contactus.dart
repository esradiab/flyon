import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'pages/bottombar.dart';

class ContactUs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContactUs();
  }

}

class _ContactUs extends State<ContactUs>{

   late String email ;
   late String name ;
    late String message ;
   late String subject ;
  final formKey = GlobalKey<FormState>();
bool sent =false , error = false ;
   Future sendEmail()async{
     final serviceId = 'contactus_flyon';
     final templateId ='template_hfnq27a' ;
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
             "name": name,
             "from_email":email ,
             "subject": subject ,
             "feedback":message
           }
         }));
     print(response.body);
     if(response.statusCode == 200){
       showDialog(
         context: context,
         builder: (ctx) => AlertDialog(
           title: const Text("done!" , style: TextStyle(
               color: Colors.green
           ),),
           content: const Text("the message sent successfully!"),
         ),
       ).then((value){
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => BottomBar()));
       });
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
        title: Text('send Message'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
             children: <Widget> [
               Container(
                 alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(right: 10 , left: 10 , top: 15 , bottom: 4),
                 child: Text('Name: ' , style:TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w600
                 )),
               ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'enter your name',
                  ),
                  onFieldSubmitted: (value) {
                    setState(() {
                        name = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      name=value;
                    });
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'name is required!';
                    }
                    else if(value.length < 4){
                      return 'name is too short!';
                    }
                    else return null;
                  },
                ),
               Container(
                 alignment: Alignment.centerLeft,
                 padding: EdgeInsets.only(right: 10 , left: 10 , top: 15 , bottom: 4),
                 child: Text('Email: ' , style:TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600
                 )),
               ),
               TextFormField(
                 autovalidateMode: AutovalidateMode.onUserInteraction,
                 keyboardType: TextInputType.emailAddress,
                 textInputAction: TextInputAction.next,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'email@example.com',
                 ),
                 onFieldSubmitted: (value) {
                   setState(() {
                     email=value;

                   });
                 },
                 onChanged: (value) {
                   setState(() {
                     email=value;
                   });
                 },
                 validator: (value) {
                   if (value!.isEmpty) {
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
               ),
               Container(
                 alignment: Alignment.centerLeft,
                 padding: EdgeInsets.only(right: 10 , left: 10 , top: 15 , bottom: 4),
                 child: Text('Subject: ' , style:TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600
                 )),
               ),
               TextFormField(
                 textInputAction: TextInputAction.next,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'enter subject',
                 ),
                 onFieldSubmitted: (value) {
                   setState(() {
                     subject=value;

                   });
                 },
                 onChanged: (value) {
                   setState(() {
                     subject=value;

                   });
                 },
                 validator: (value){
                   if(value!.isEmpty){
                     return 'subject is required!';
                   }
                   else return null;
                 },
               ),
               Container(
                 alignment: Alignment.centerLeft,
                 padding: EdgeInsets.only(right: 10 , left: 10 , top: 15 , bottom: 4),
                 child: Text('Message: ' , style:TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600
                 )),
               ),
               TextFormField(
                 textInputAction: TextInputAction.next,
                 maxLines: 7,
                 decoration: InputDecoration(
                   hintMaxLines: 7,
                   prefixIcon: Icon(Icons.feedback),
                   border: OutlineInputBorder(),
                   hintText: 'enter your message',
                 ),
                 onFieldSubmitted: (value) {
                   setState(() {
                            message=value;
                   });
                 },
                 onChanged: (value) {
                   setState(() {
                       message=value;
                   });
                 },
                 validator: (value){
                   if(value!.isEmpty){
                     return 'message is required!';
                   }
                   else if(value.length < 5){
                     return 'value is too short';
                   }
                   else return null;
                 },
               ),
               SizedBox(height: 10),
               MaterialButton(
                 onPressed: () {
                   if (formKey.currentState!.validate()) {
                     // use the information provided
                     formKey.currentState!.save();
                     if(!sent ) {
                      try {
                        sendEmail();
                        sent=true ;
                      } catch (e) {
                        print('error sending email');
                        error = true;
                      }
                    }
                     else if(error) {
                       sent=false ;
                       Text(" error sending message ");
                    }
                  }
                 },
                 child: Container(
                     alignment: Alignment.center,
                     padding: EdgeInsets.all(10),
                     width: MediaQuery.of(context).size.width - 30,
                     decoration: BoxDecoration(
                       color: Color(0xff78c6a3),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.2),
                           spreadRadius: 5,
                           blurRadius: 3,
                           offset: Offset(0, 7), // changes position of shadow
                         ),
                       ],
                       borderRadius: BorderRadius.circular(5),
                     ),
                     child: Text(
                       "Send",
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.w700,
                         color: Colors.white,
                       ),
                     )),
               ),
              ]

            ),
          ),
        ),
      ),
    );
  }

}