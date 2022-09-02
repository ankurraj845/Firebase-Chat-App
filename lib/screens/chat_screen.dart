import 'package:chat_app/widgets/chat/messages.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                  child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app,color: Colors.green),
                    SizedBox(width: 8),
                    Text('Logout')
                  ],
                ),
              ),
                value: 'logout',
              )

            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child:  Column(children: <Widget>[
          Expanded(child: Messages()),
        ],)),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('chats/nXscQQXDr5n02CEpp3iI/messages')
                .add(
              {'text': 'Added by clicking on button'},
            );
          }),
    );
  }
}
