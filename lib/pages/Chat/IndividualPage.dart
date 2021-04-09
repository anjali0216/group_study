import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_study/pages/Chat/ReplyCard.dart';

import 'ChatModel.dart';
import 'OwnMessageCard.dart';
class IndividualPage extends StatefulWidget {
  IndividualPage({Key key,this.chatModel }) : super(key: key);
  final ChatModel chatModel;
  //final ChatModel sourchat;
  //, this.sourchat
  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage>{
  bool show=false;
  FocusNode focusNode=FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState(){
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        setState(() {
          show= false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/whatsAppBackground.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
    Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leadingWidth: 70,

        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back),
            CircleAvatar(
              child: SvgPicture.asset(
                widget.chatModel.isGroup? "assets/groups.svg": "assets/person.svg",
                color: Colors.white,
                height: 36,
                width: 36,
              ),
              radius: 20,
              backgroundColor: Colors.blueGrey,
            ),
          ],
        ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "last seen today at 12:05",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:WillPopScope(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height-140,
           child: ListView(
              shrinkWrap: true,
              children: [
              OwnMessageCard(),
                ReplyCard(),
                OwnMessageCard(),
                ReplyCard(),
              ],
            ),
            ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [

                 Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width-60,
                      child: Card(
                        margin: EdgeInsets.only(left: 2, right: 2, bottom:8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            controller: _controller,
                            focusNode: focusNode,
                            textAlignVertical: TextAlignVertical.center,

                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type your message",
                              prefixIcon: IconButton(
                                icon: Icon(Icons.emoji_emotions_outlined
                                ),
                                onPressed: (){
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  setState(() {
                                    show=!show;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.all(5),

                            ),
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        right: 5,
                      ),

                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: IconButton(icon: Icon(Icons.pending, color: Colors.white,
                      ),
                          onPressed: (){},
                    ),
                    ),
                    ),
                  ],
                ),
                  show? emojiSelect(): Container(),
        ],
    ),
              ),

          ],
        ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
      ),
      ),
    ),
    ],
    );

  }
  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        });
  }
  
}