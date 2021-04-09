import 'package:flutter/material.dart';
import 'package:group_study/pages/Chat/ChatModel.dart';
import 'package:group_study/pages/Chat/DisplayChats.dart';
class ChatHomeScreen extends StatefulWidget{
  ChatHomeScreen([Key key]) : super(key: key);
  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> with SingleTickerProviderStateMixin  {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller= TabController(length: 1, vsync: this, initialIndex: 0);
  }
  List<ChatModel> chats=[
    ChatModel(
      name: "Dev",
      isGroup: false,
      currentMessage: "hi yo",
      time: "4:00",
      icon:"person.svg",
    ),
    ChatModel(
      name: "yonda friends",
      isGroup: true,
      currentMessage: "hello",
      time: "10:00",
      icon:"groups.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with your Peers"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed:() {}),
          IconButton(icon: Icon(Icons.group_add_rounded), onPressed:() {}),

        ],
        bottom: TabBar(

            controller:  _controller,
            tabs: [
            Tab(
            text: "MY CHATS",
        ),
        ],

        ),

        ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (contex, index) => DisplayChats(
          chatModel: chats[index],
          //sourchat: widget.sourchat,
        ),
      ),



    );
  }

}

