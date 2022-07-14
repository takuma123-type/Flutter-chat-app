import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/message.dart';
import 'package:intl/intl.dart' as intl;

class TalkRoom extends StatefulWidget {
  final String name;
  TalkRoom(this.name);
  @override
  State createState() => _TalkRoomState();
}

class _TalkRoomState extends State<TalkRoom> {
  List<Message> messageList = [
    Message(
      message: 'あいうえお',
      isMe: true,
      sendTime: DateTime(2020, 1, 1, 10, 20)
    ),
    Message(
      message: 'こんにちは',
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 10, 20)
    ),
    Message(
      message: 'こんにちは',
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 10, 20)
    ),
    Message(
      message: 'こんにちは',
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 10, 20)
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: ListView.builder(
                  physics: RangeMaintainingScrollPhysics(),
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: messageList.length,
                  itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 10, left: 10, bottom: index == 0 ? 10 : 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: messageList[index].isMe as bool ? TextDirection.rtl : TextDirection.ltr,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: messageList[index].isMe as bool ?  Colors.green : Colors.white , //三項演算子
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(messageList[index].message.toString()
                        ),
                        ),
                      Text(intl.DateFormat('HH:mm').format(messageList[index].sendTime as DateTime), style: TextStyle(fontSize: 12),),
                    ],
                    ),
                  );
                }),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60, color: Colors.white,
                child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder()
                        ),
                      ),
                    )),
                    IconButton(icon: Icon(Icons.send),
                      onPressed: () {
                        print('送信');
                      },
                    )
                  ],
                ),
              ),
            ),
            ],
          ),
        ],
      ),
    );
  }
}