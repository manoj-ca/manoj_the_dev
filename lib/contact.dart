// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'nav_bar.dart';
import 'my_page.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    AssetBundle bundle = DefaultAssetBundle.of(context);
    List<IconData> icons = [
      Icons.home_outlined,
      Icons.article_outlined,
      Icons.email_outlined
    ];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'images/xSmall.jpg',
             bundle: bundle
          ),
          fit: BoxFit.cover,
        )
      ),
      child: NavBar(
        icons: icons,
        page: MyPage.contact,
      )
    );
  }
}
