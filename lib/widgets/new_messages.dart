import 'package:chat_app/utils/dimensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    _messageController.clear();
    // FocusScope.of(context).unfocus();

    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()!['username'],
      'userImage': userData.data()!['image_url']
    });
  }

  @override
  Widget build(BuildContext context) {
    print('new message');
    return Padding(
      padding: EdgeInsets.all(Dimensions.height10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: Dimensions.height10 * 5,
              child: TextField(
                controller: _messageController,
                autocorrect: true,
                enableSuggestions: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius10 * 10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: Dimensions.width10),
          Container(
            height: Dimensions.height10 * 5,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(Dimensions.radius10 * 10)),
            child: Center(
              child: IconButton(
                  onPressed: _submitMessage, icon: const Icon(Icons.send)),
            ),
          )
        ],
      ),
    );
  }
}
