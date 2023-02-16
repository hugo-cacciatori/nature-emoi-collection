import 'package:firebase_core/firebase_core.dart';
import 'package:nature_emoi_collection/pages/main_view.dart';
import 'custom_scroll_behavior.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  runApp(NatureEmoiCollectionApp());
}

class NatureEmoiCollectionApp extends StatelessWidget {
  const NatureEmoiCollectionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nature Emoi Collection',
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      home: MainView(),
    );
  }
}