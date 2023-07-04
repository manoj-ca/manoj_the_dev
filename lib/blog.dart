// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'my_bar.dart';

class Blog extends MyBar {
  Blog({super.key, required super.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        children: [
        ],
      )
    );
  }
}
