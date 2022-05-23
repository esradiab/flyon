import 'package:flutter/material.dart';
class Prohibition extends StatelessWidget{
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
            "Prohibitions",
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
                "images/bans.jpg" ,
                height: 250 ,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft ,
                      child: Text("Travel prohibitions" , style: TextStyle(
                          fontWeight: FontWeight.w700 ,
                          fontSize: 25,
                          fontFamily: "Besley"
                      ),),
                    ),
                    SizedBox( height: 10),
                    Row(children: [
                      Icon(Icons.check_circle_rounded , size: 18,),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text("Compressed gases (flammable, non-flammable and toxic) such as aerosol, camping gas, firearms, ammunition, swords and knives." ,
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
                        child: Text("Bags containing alarms or lithium batteries." ,
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
                        child: Text("Explosives, incendiary materials, flammable materials, toxic materials, and compressed gases" , style: TextStyle(
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
                        child: Text("Chemical reagents." , style: TextStyle(
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
                        child: Text("Explosives, ammunition and fireworks." , style: TextStyle(
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
                        child: Text("Knives, daggers and swords." , style: TextStyle(
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
                        child: Text("Radioactive and radioactive materials." , style: TextStyle(
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
                        child: Text("Dangerous goods (such as mercury, toxic materials, magnetic materials or harmful materials)." , style: TextStyle(
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
                        child: Text("According to the Federal Aviation Administration (FAA) - (Safety and Security Alerts to Flight Service Operators) (SAFO) it is recommended that electronic cigarettes and related devices be placed in accompanying bags and not in checked bags." , style: TextStyle(
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
                        child: Text("For travelers to and from the Kingdom of Saudi Arabia and the United Arab Emirates, it is forbidden to carry medicines included in the drug list (such as Tramadol, Prax, and Rovamycin) when traveling, in order to avoid arresting and deporting their holders." , style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Besley"
                        ),),
                      ),
                    ],),
                    Divider(),
                       Container(
                          child: Text("Note that there are additional security measures that prohibit certain items from being carried in checked baggage and hand baggage for flights departing to and from the USA and EU countries as follows.." , style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Besley",
                            color: Colors.black45
                          ),),
                        ),
                    Row(children: [
                      SizedBox(width:20,),
                      Icon(Icons.check),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text("All liquids, gels, toothpaste, liquid cosmetics and perfumes are not allowed in hand luggage." , style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Besley"
                        ),),
                      ),
                    ],),
                    SizedBox( height: 10),
                    Row(children: [
                      SizedBox(width:20,),
                      Icon(Icons.check, size: 18,),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text("Cigarette lighters are not allowed in all baggage." , style: TextStyle(
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
