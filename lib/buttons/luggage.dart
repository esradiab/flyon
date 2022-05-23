import 'package:flutter/material.dart';
class Luggage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //set hight..
        toolbarHeight: 50,
        //app bar background color..
        backgroundColor: Color(0xff78c6a3),
        //app bar title..
        title: Text(
          "luggage",
          //text style..
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body:SingleChildScrollView(
           child: Column(
             children: [
               Image.asset(
                 "images/luggage.jpg" ,
                 height: 250 ,
                 width: MediaQuery.of(context).size.width,
                 fit: BoxFit.cover,
               ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(" out everything you must know about taking baggage with you when you fly .Improper carriage of baggage can cause a lot of inconvenience. Hence,make sure your baggage is properly packed and tagged. The following tips will be handy:" ,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Besley",
                color: Colors.black38
            ),),),
            Row(children: [
              Icon(Icons.check_circle_rounded , size: 18,),
              SizedBox(width: 8,),
              Expanded(
                child: Text("Make sure you are aware of your free checked baggage allowance. Any items over your allowance will be charged as excess baggage." ,
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
                child: Text("Don’t pack any valuables in your checked-in baggage." ,
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
                child: Text("Label your bags correctly with your name and address and remove tags and labels left over from previous flights." , style: TextStyle(
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
                child: Text("Make sure you know your hand baggage allowance and the latest restrictions on carriage of certain items in your hand baggage." , style: TextStyle(
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
                child: Text("Make sure you know your hand baggage allowance and the latest restrictions on carriage of certain items in your hand baggage." , style: TextStyle(
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
                child: Text("Make sure you take medication, important documents, valuable items and cash in your hand baggage." , style: TextStyle(
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
                child: Text("Before checking-in please make sure you declare, if you are carrying any arms or explosive substances." , style: TextStyle(
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
                child: Text("Battery cells in any electrical / electronic items are permissible now & will now not be removed at the security point. Loose battery cells / dry cells carried in the hand baggage are liable to be removed. Please carry such items in checked baggage only" , style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Besley"
                ),),
              ),
            ],),
          ],
        ),
      ),
             ],
           ),
      )
    );
  }


}