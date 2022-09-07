import 'package:flutter/material.dart';

class Message_Bubble extends StatelessWidget {
  // const Message_Bubble({Key? key}) : super(key: key);
  Message_Bubble(this.message, this.isMe);

  final String message;
  final isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(12),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          child: Text(message,style: TextStyle(
            color: Colors.white,),),
        ),
      ],
    );
  }
}
