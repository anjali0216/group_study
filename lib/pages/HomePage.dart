

import 'package:flutter/material.dart';
import 'package:group_study/pages/DashboardDrawer.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
      ),
          drawer: DashboardDrawer(),
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


