import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
const REGISTER_API_URL = 'http://192.168.1.4:3000/student';
class SearchPeerPage extends StatefulWidget {
  @override
  _SearchPeerPageState createState() => _SearchPeerPageState();
}




class _SearchPeerPageState extends State<SearchPeerPage> {
  String clgs;
  String clgchosen;
  List listItem=[];
   String selectedValue;

   Future getList() async{
     var  url2 = REGISTER_API_URL+"/list";
     var response= await http.get(Uri.parse(url2));
     if(response.statusCode==200){
       var jsonData=json.decode(response.body);
       setState(() {
         listItem=jsonData;
       });
     }
     return listItem;
   }




  @override
   void initState(){
     super.initState();
     getList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Peers'),
        ),

        body: Column(
          children: [
            //Text("Select your Grade/ graduation course"),
        FutureBuilder(
    future: getList(),
    builder: (context, snapshot) {
      return

        DropdownButton(
          hint: Text("Find peers from your Institute"),
          // dropdownColor: Color.,

          icon: Icon(Icons.arrow_drop_down),
          iconSize: 25,
          isExpanded: true,
          value: clgs,
         // items: listItem.map((valueItem)
            items: snapshot.data.map((valueItem)
          {
            clgchosen = valueItem.toString();

            return DropdownMenuItem(
              value: valueItem['institute'],
              child: Text(valueItem['institute']),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              clgs = value;
            });
          },

        );

    }

        ),
            //Text(clgs),
          ],
            )

    );

  }
}
