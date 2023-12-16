import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify/model/chat_user.dart';

class chat_user_card extends StatefulWidget {
  final ChatUser user;

  const chat_user_card({super.key, required this.user});

  @override
  State<chat_user_card> createState() => _chat_user_cardState();
}

class _chat_user_cardState extends State<chat_user_card> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(CupertinoIcons.person),
          ),
          title: Text(widget.user.name),
          subtitle: Text(
            widget.user.about,
            maxLines: 1,
          ),
          trailing: Text('12:00 pm'),
        ),
      ),
    );
  }
}
