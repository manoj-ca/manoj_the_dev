// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'nav_bar.dart';
import 'my_page.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/xSmall.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: NavBar(
        page: MyPage.blog,
      ),
    );
  }
}
