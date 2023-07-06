// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'block.dart';

class MyState extends ChangeNotifier {
  MyState() {
    init();
  }

  List<Block> _blocks = [];
  List<Block> get blocks => _blocks;

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseFirestore.instance
        .collection('home')
        .orderBy('idx')
        .snapshots()
        .listen((snapshot) {
      _blocks = [];
      for (final document in snapshot.docs) {
        _blocks.add(Block.fromFirestore(document));
      }
      notifyListeners();
    });
  }
}
