import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.lightBlue,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage('https://cdn1.iconfinder.com/data/icons/instagram-ui-colored/48/JD-17-512.png'
                          ),
                          fit: BoxFit.fill
                      ),
                    ),

                  ),
                  Text('User_name', style:TextStyle(fontSize: 22,color: Colors.white
                  ),
                  ),
                  Text('Full Name', style:TextStyle(color: Colors.white
                  ),
                  ),

                ],
              ),
            ),
          ),
ListTile(
leading: Icon(Icons.group),
  title: Text('Find Peers from same course',

    style:TextStyle(fontSize: 18,
  ),
  ),
  onTap: null,
),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Find Teachers', style:TextStyle(fontSize: 18,
            ),
            ),
            onTap: null,
          ),

          ListTile(
            leading: Icon(Icons.video_call),
            title: Text('Schedule Study session', style:TextStyle(fontSize: 18,
            ),
            ),
            onTap: null,
          ),

          ListTile(
            leading: Icon(Icons.remove_red_eye_outlined),
            title: Text('View Current meeting schedule', style:TextStyle(fontSize: 18,
            ),
            ),
            onTap: null,
          ),

          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('Logout', style:TextStyle(fontSize: 18,
            ),
            ),
            onTap: null,
          ),


        ],
      ),

    );

  }
}
