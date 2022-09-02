import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chat').snapshots(),
       builder: (ctx, chatSnapshot){
        if(chatSnapshot.connectionState == ConnectionState.waiting){
          return Center(
          child: CircularProgressIndicator(),
          );
         }

        final chatDocs  = chatSnapshot.data?.docs;
        return ListView.builder(
          itemCount: chatDocs!.length,
            itemBuilder: (context, index) => Text(
          chatDocs[index]['text'],),
        );
        },

    );
  }
}
