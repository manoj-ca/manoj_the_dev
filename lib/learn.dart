// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'bar.dart';
import 'code.dart';
import 'display.dart';
import 'url.dart';

const String mobileDartPad =
    'Note: on small screens, DartPad is not available. '
    'Access https://manoj-the-dev.web.app/ from a desktop '
    'to use DartPad.';

class MyLearn extends MyBar {
  MyLearn({super.key, required super.page});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final styleSmall = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: isMobile ? null : appBar(context),
      body: ListView(children: [
        isMobile ? 
          Text(
            mobileDartPad,
            style: styleSmall,
          ) : const Text(''),
        const MyDisplay(
          page: MyPage.learn,
          sec: 1,
        ),
        MyCode(
          theme: theme,
          isMobile: isMobile,
          hello: MyHello.dart,
          url: MyUrl.helloDart,
        ),
        const MyDisplay(
          page: MyPage.learn,
          sec: 2,
        ),
        MyCode(
          theme: theme,
          isMobile: isMobile,
          hello: MyHello.flutter,
          url: MyUrl.helloFlutter,
        ),
        const MyDisplay(
          page: MyPage.learn,
          sec: 3,
        ),
        MyCode(
          theme: theme,
          isMobile: isMobile,
          hello: MyHello.solution,
          url: MyUrl.helloSolution,
        ),
      ]),
      bottomNavigationBar: isMobile ? bottomBar(context) : null,
    );
  }
}
