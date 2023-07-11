// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'bar.dart';
import 'code.dart';
import 'display.dart';
import 'url.dart';

class MyLearn extends MyBar {
  MyLearn({super.key, required super.page});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: isMobile ? null : appBar(context),
      body: ListView(
        children: [
          const MyDisplay(
            page: MyPage.learn,
            sec: 1,
          ),
          MyCode(
            theme: theme,
            hello: MyHello.dart,
            url: MyUrl.helloDart,
          ),
          const MyDisplay(
            page: MyPage.learn,
            sec: 2,
          ),
          MyCode(
            theme: theme,
            hello: MyHello.flutter,
            url: MyUrl.helloFlutter,
          ),
          const MyDisplay(
            page: MyPage.learn,
            sec: 3,
          ),
          MyCode(
            theme: theme,
            hello: MyHello.solution,
            url: MyUrl.helloSolution,
          ),
        ]
      ),
      bottomNavigationBar: isMobile ? bottomBar(context) : null,
    );
  }
}
