// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';

class Block {
  final int? idx;
  final String? type;
  final String? text;
  final int? ret;

  Block({
    this.idx,
    this.type,
    this.text,
    this.ret,
  });

  factory Block.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Block(
      idx: data?['idx'],
      type: data?['type'],
      text: data?['text'],
      ret: data?['return'],
    );
  }
}
