// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'bar.dart';
import 'display.dart';

class MyHome extends MyBar {
  MyHome({super.key, required super.page});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: appBar(context),
        body: ListView(
          children: [
            Image.asset('images/ManojFlutter.png'),
            const MyDisplay(page: MyPage.home, sec: 0),
          ],
        ));
  }
}
