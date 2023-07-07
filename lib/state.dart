// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manoj_the_dev/bar.dart';

import 'firebase_options.dart';
import 'display.dart';

class MyState extends ChangeNotifier {
  MyState() {
    init();
  }

  List<MyBlock> _homeBlocks = [];
  List<MyBlock> get homeBlocks => _homeBlocks;

  List<MyBlock> _whyBlocks = [];
  List<MyBlock> get whyBlocks => _whyBlocks;

  List<MyBlock> _hw1Blocks = [];
  List<MyBlock> get hw1Blocks => _hw1Blocks;

  List<MyBlock> blocks(MyPage page) {
    return switch (page) {
      MyPage.home => _homeBlocks,
      MyPage.blog => _whyBlocks,
      MyPage.learn => _hw1Blocks,
      _ => throw Exception('Unexpected Page'),
    };
  }

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseFirestore.instance
        .collection('home')
        .orderBy('idx')
        .snapshots()
        .listen((snapshot) {
      _homeBlocks = [];
      for (final document in snapshot.docs) {
        _homeBlocks.add(MyBlock.fromFirestore(document));
      }
      notifyListeners();
    });

    FirebaseFirestore.instance
        .collection('why_flutter')
        .orderBy('idx')
        .snapshots()
        .listen((snapshot) {
      _whyBlocks = [];
      for (final document in snapshot.docs) {
        _whyBlocks.add(MyBlock.fromFirestore(document));
      }
      notifyListeners();
    });

    FirebaseFirestore.instance
        .collection('hello_world_1')
        .orderBy('idx')
        .snapshots()
        .listen((snapshot) {
      _hw1Blocks = [];
      for (final document in snapshot.docs) {
        _hw1Blocks.add(MyBlock.fromFirestore(document));
      }
      notifyListeners();
    });
  }
}
