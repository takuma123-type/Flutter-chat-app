// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/pages/settings_profile.dart';
import 'package:flutter_application_1/pages/talk_room.dart';

class TopPage extends StatefulWidget {
  @override
 _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<User> userList = [
    User(
      name: 'そうだい',
      uid: 'def',
      imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/640px-PHP-logo.svg.png',
      lastMessage: 'ありがとう'
    ),
    User(
      name: 'たくま',
      uid: 'fjf',
      imagePath: 'https://japan.zdnet.com/storage/2021/07/20/20679fcdc25c8525c7ed6b894e80944e/linux-penguin-in-windows-10-pc_1280x960.jpg',
      lastMessage: 'ありがとう'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャットアプリ'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsProfilePage()));
            },
            )
        ],
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TalkRoom(userList[index].name.toString())));
          },
          child: Container(
            height: 70,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(userList[index].imagePath.toString()),
                    radius: 30,
                  ),
                ),
                Column (
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(userList[index].name.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text(userList[index].lastMessage.toString(), style: TextStyle(color: Colors.grey),),
                  ],
                )
              ],
              ),
          ),
        );
      }
      ),

    );
  }
}