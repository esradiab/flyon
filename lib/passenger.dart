import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/passengersmodel.dart';
class Passenger extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Passenger();
  }
}

class _Passenger extends State<Passenger>
{
  int adult=1 , child=0 , infant=0 ;
  String sadult="adult" , schild="child" , sinfant="infant";
  late PassengerModel passengerModel = PassengerModel(adult, child, infant, sadult, schild, sinfant);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              passengerModel.adult= adult ;
              passengerModel.child = child ;
              passengerModel.infant= infant;
              passengerModel.sadult = sadult ;
              passengerModel.schild = schild ;
              passengerModel.sinfant= sinfant;
              Navigator.pop( context, passengerModel );
            },
            child: Icon(Icons.arrow_back_ios_outlined)),
        //set hight..
        toolbarHeight: 50,
        //set app bar color
        backgroundColor: Color(0xff78c6a3),
        title: Text("passengers" , style: TextStyle(
          fontFamily: "Lobster",
          fontSize: 25,
          color: Colors.black,
        ),),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.people , color: Color(0xff78c6a3),),
                SizedBox(width: 10,),
                Container(

                  width: 80,
                  child: Text("$adult " + sadult  ,style: TextStyle(
                    fontSize: 18 ,
                    fontWeight: FontWeight.w600
                  ),),
                ),

                SizedBox(width: 8,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10) ,
                        bottomLeft: Radius.circular(10) ,
                      ),
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,

                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        var sum = adult + child + infant;
                        if(adult >= 1 && adult < 9 && sum<9 )
                          {
                            adult++;
                            sadult = "adults" ;
                          }
                        else if (adult == 9)
                          {
                            adult = 9;
                          }
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10) ,
                        bottomRight: Radius.circular(10) ,
                      ),
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        if(adult <=9 && adult > 1  )
                        {
                          adult--;
                          if(adult > 1)
                          sadult = "adults" ;
                        }
                         if (adult == 1)
                        {
                          sadult ="adult";

                        }
                      });
                    },
                    child: Icon(Icons.minimize),
                  ),
                )
              ],
            ) ,
            Divider(),
            SizedBox( height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Icon(Icons.child_care , color: Color(0xff78c6a3),),
          SizedBox(width: 10,),
          Container(
            width: 80,
            child: Text("$child " + schild  ,style: TextStyle(
                fontSize: 18 ,
                fontWeight: FontWeight.w600
            ),),
          ),
          SizedBox(width: 8,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10) ,
                bottomLeft: Radius.circular(10) ,
              ),
              color: Colors.grey,
            ),
            alignment: Alignment.center,
            width: 50,
            height: 50,

            child: MaterialButton(
              onPressed: (){
                setState(() {
                  var sum = adult + child + infant;
                  if(child >=0 && child < 9 && sum < 9 )
                  {
                    child++;
                    schild = "children" ;
                  }
                  else if (child == 9)
                  {
                    child = 9;
                  }
                });
              },
              child: Icon(Icons.add),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10) ,
                bottomRight: Radius.circular(10) ,
              ),
              color: Colors.grey,
            ),
            alignment: Alignment.center,
            width: 50,
            height: 50,

            child: MaterialButton(
              onPressed: (){
                setState(() {
                  if(child <=8 && child > 0  )
                  {
                    child--;
                    if(child > 1)
                      schild = "children" ;
                  }
                  if (child == 1 || child==0)
                  {
                    schild ="child";

                  }
                });
              },
              child: Icon(Icons.minimize),
            ),
          )]
            ),
            Divider(),
            SizedBox( height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.child_friendly , color: Color(0xff78c6a3),),
                SizedBox(width: 10,),
                Container(
                  width: 80,
                  child: Text("$infant " + sinfant  ,style: TextStyle(
                      fontSize: 18 ,
                      fontWeight: FontWeight.w600
                  ),),
                ),
                SizedBox(width: 8,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10) ,
                      bottomLeft: Radius.circular(10) ,
                    ),
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,

                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        var sum = adult + child + infant;
                        if(infant >= 0 && infant < 2 && sum < 9 )
                        {
                          infant++;
                          sinfant = "infants" ;
                        }
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10) ,
                      bottomRight: Radius.circular(10) ,
                    ),
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,

                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        if(infant <=2 && infant > 0  )
                        {
                          infant--;
                          if(infant > 1)
                            sinfant = "infants" ;
                        }
                        if (infant == 1 || infant==0)
                        {
                          sinfant ="infant";

                        }
                      });
                    },
                    child: Icon(Icons.minimize),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width-30,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Color(0xff78c6a3),
              ),
              child: MaterialButton(
                onPressed: () {
                  passengerModel.adult=adult ;
                  passengerModel.child=child ;
                  passengerModel.infant=infant ;
                  passengerModel.schild=schild ;
                  passengerModel.sadult=sadult ;
                  passengerModel.sinfant=sinfant ;
                  Navigator.pop(
                    context, passengerModel
                  );
                },
                child: Text("Ok" , style:TextStyle(
                  fontSize: 20
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }

}
