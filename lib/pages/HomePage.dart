

import 'package:flutter/material.dart';
import 'package:group_study/pages/DashboardDrawer.dart';
import 'package:group_study/pages/StudentDetails.dart';
class HomePage extends StatelessWidget{
  StudentDetails details;
  HomePage(StudentDetails detials){
    this.details=detials;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
      ),
          drawer: DashboardDrawer(details),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text(
                  'Welcome to the Dashboard!',
                  style: TextStyle(

                  ),
                )
              ]
            )
          )
    );
    
  }
  
}


