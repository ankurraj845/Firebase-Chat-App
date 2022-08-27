
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : StreamBuilder<dynamic>(stream: FirebaseFirestore.instance.collection('chats/nXscQQXDr5n02CEpp3iI/messages')
          .snapshots() ,
          builder: (ctx, streamSnapshot) {
        if (streamSnapshot.connectionState == ConnectionState.waiting ){
          return Center(
          child: CircularProgressIndicator(),
          );
        }
        final documents = streamSnapshot.data.docs;
        return ListView.builder(
        itemCount: documents.length,
            itemBuilder: (ctx, index) =>
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(documents[index]['text']),
                ),
        );
      }
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      onPressed: () {
        FirebaseFirestore.instance.collection(
            'chats/nXscQQXDr5n02CEpp3iI/messages').add({
          'text': 'added by clicking oon button '
        },);
      }
      ),
    );

  }
}
