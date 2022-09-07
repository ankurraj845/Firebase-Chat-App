import 'package:chat_app/widgets/chat/message_Bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final chatDocs = chatSnapshot.data?.docs;
        return FutureBuilder(
        
          builder: (ctx,futureSnapshot) => ListView.builder(

            reverse: true,
            itemCount: chatDocs!.length,
            itemBuilder: (context, index) => Message_Bubble(
                chatDocs[index]['text'], chatDocs[index]['userId']),
          ),
        );
      },
    );
  }
}
