import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {

  //WelcomePage({Key key}) : super(key:key);
  @override
  _HomePageState createState() =>_HomePageState();
}
class _HomePageState extends State<HomePage> {

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlueAccent],
            begin: const FractionalOffset(0.0, 1.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }


}