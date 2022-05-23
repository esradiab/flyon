import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/buttons/health.dart';
import 'package:untitled/buttons/luggage.dart';
import 'package:untitled/buttons/prohipition.dart';

class AboutFly extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AboutFly();
  }
}

class _AboutFly extends State<AboutFly>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home :Scaffold(
        body: SingleChildScrollView(
          child :Column(
            children:<Widget> [
             Image.asset(
               "images/befor.jpg" ,
               height: 250 ,
               width: MediaQuery.of(context).size.width,
               fit: BoxFit.cover,
             ),
              Padding(padding: EdgeInsets.only(left: 10 , right: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
               children:<Widget> [
                 Container(
                   padding: EdgeInsets.only(top: 8 , left: 8 , right: 8),
                   height:80,
                   width: MediaQuery.of(context).size.width,
                   child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children:[
                       InkWell(
                         onTap: (){
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => Luggage()));
                         },
                         child: Column(
                           children: [
                             Icon(Icons.luggage , size: 40, color: Colors.black,) ,
                             Text("luggage" , style: TextStyle(
                               fontSize: 18 ,
                               color: Colors.black
                             ),)  ,
                           ],
                         ),
                       ),
                     InkWell(
                       onTap: (){
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => Prohibition()));
                       },
                       child: Column(
                         children: [
                           Icon(Icons.not_interested , size: 40, color: Colors.red,) ,
                           Text("prohibition" , style: TextStyle(
                               fontSize: 18 ,
                               color: Colors.black
                           ),)  ,
                         ],
                       ),
                     ),
                     InkWell(
                       onTap: (){
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => Health()));
                       },
                       child: Column(
                         children: [
                           Icon(Icons.health_and_safety , size: 40, color: Colors.blue,) ,
                           Text("health" , style: TextStyle(
                               fontSize: 18 ,
                               color: Colors.black
                           ),)  ,
                         ],
                       ),
                     ),
                   ]),
                 ),
                  Divider(),
                  Container(
                    alignment: Alignment.centerLeft ,
                    child: Text("Before You Fly!" , style: TextStyle(
                      fontWeight: FontWeight.w700 ,
                      fontSize: 25,
                      fontFamily: "Besley"
                    ),),
                  ),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 8.0),
                   child: Text("here are some tips and advices that you need to know before you fly, to enjoy your trip." , style: TextStyle(
                       fontSize: 20,
                       fontFamily: "Besley"
                   ),),
                 ),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("You must ensure that you carry the necessary travel documents, including tickets, valid photo ID, passport, visa and other relevant documentation as per the conditions of carriage." ,
                       style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Check-in counters will open 3 hours before departure and close 1hour before scheduled departure time for all cabin classes. Give yourself enough time to reach the airport, keeping in mind traffic congestions, inclement weather and other delays." ,
                       style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Be certain that all your baggage has been tagged and identified." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Should you need any assistance on ground, please feel free to contact our staff." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Get a good night's sleep" , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Drink plenty of fluids, preferably water." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Eat light and easily-digested food." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Take a rapid walk or shower." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Wear loose-fitting clothing, comfortable shoes and, if necessary, support stockings." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Consult your doctor on the usage of anti-embolic medications before you fly." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Drink adequate fluids." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Avoid smoking." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Avoid crossing legs when seated ,this will restrict your blood circulation." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Wear loose comfortable clothes when travelling." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Avoid taking sleeping tablets." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Do not take precious and expensive jewelry with you and not a lot of luggage.dart to enjoy easy and light mobility." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Avoid carrying expensive small electronic devices except for the camera, as they may not pass through or be stolen from customs." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                 Row(children: [
                   Icon(Icons.check_circle_rounded , size: 18,),
                   SizedBox(width: 8,),
                   Expanded(
                     child: Text("Take a copy of the passport, driver’s license, credit cards, travel tickets and traveler’s checks numbers, and leave another copy with a relative in your country to ensure that it can be easily replaced in case of loss." , style: TextStyle(
                         fontSize: 18,
                         fontFamily: "Besley"
                     ),),
                   ),
                 ],),
                 Divider(),
                ]
              ),)
            ],
          ),
        )));
  }
}