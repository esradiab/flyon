import 'package:flutter/material.dart';
import 'bottombar.dart';

//run the app..
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          indicatorColor: Color(0xff78c6a3),
          colorScheme: ColorScheme.light(primary:  Color(0xff78c6a3)),
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          inputDecorationTheme: InputDecorationTheme(
              focusColor: Color(0xff78c6a3),
          ),
      primaryColor:Color(0xff78c6a3),
        splashColor:Color(0xff78c6a3),
      ),
      //shows the home page
      home:BottomBar(),

    );
  }
}


