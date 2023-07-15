// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'bar.dart';
import 'display.dart';

class MyBlog extends MyBar {
  MyBlog({super.key, required super.page});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 605;

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: isMobile ? null : appBar(context),
      body: ListView(
        children: const [
          MyDisplay(page: MyPage.blog, sec: 0),
        ],
      ),
      bottomNavigationBar: isMobile ? bottomBar(context) : null,
    );
  }
}
