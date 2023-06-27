// Copyright 2023 Manoj Prasad. All rights reserved.

// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'nav_bar.dart';
import 'my_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/ManojBlue.png'),
        ),
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/xSmall.jpg'),
          fit: BoxFit.cover,
        )
      ),
      child: NavBar(
        page: MyPage.home,
      )
    );
  }
}
