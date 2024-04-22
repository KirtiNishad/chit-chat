import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/new_messages.dart';
import 'package:chat_app/widgets/chat_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setUpForPushNotification() async {
    final firebaseMessaging = FirebaseMessaging.instance;

    await firebaseMessaging.requestPermission();

    firebaseMessaging.subscribeToTopic('chat');

    // final token = await firebaseMessaging.getToken();
    // Get.log(token!);
  }

  @override
  void initState() {
    super.initState();

    setUpForPushNotification();
  }

  Future<Iterable<String>> getData() async {
    QuerySnapshot<Map<String, dynamic>> imageUrl =
        await FirebaseFirestore.instance.collection('users').get();

    return imageUrl.docs.map((doc) => doc['image_url'] as String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          )
        ],
      ),
      body: const Center(
          child: Column(
        children: [
          Expanded(child: ChatMessages()),
          NewMessages(),
        ],
      )),
    );
  }
}
