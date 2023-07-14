// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'bar.dart';
import 'display.dart';
import 'url.dart';

class MyHome extends MyBar {
  MyHome({super.key, required super.page});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final styleSmall = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.inversePrimary,
      decoration: TextDecoration.underline,
      decorationColor: theme.colorScheme.inversePrimary,
    );
    const url = MyUrl.privacy;

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: isMobile ? null : appBar(context),
      body: ListView(
        children: [
          Image.asset('images/ManojFlutter.png'),
          const MyDisplay(page: MyPage.home, sec: 0),
          isMobile
              ? const Text('')
              : TextButton(
                  onPressed: () => url.myLaunch(url.uri),
                  child: Text(
                    'Privacy Policy\n',
                    style: styleSmall,
                  ),
                ),
        ],
      ),
      bottomNavigationBar: isMobile ? bottomBar(context) : null,
    );
  }
}
