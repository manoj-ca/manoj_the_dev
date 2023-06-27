// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'my_page.dart';

class NavBar extends StatelessWidget {
  NavBar({
    super.key,
    required this.icons,
    required this.page,
  }) {
    switch (page) {
      case MyPage.home:
        icons[MyPage.home.idx] = Icons.home;
      case MyPage.blog:
        icons[MyPage.blog.idx] = Icons.article;
      case MyPage.contact:
        icons[MyPage.contact.idx] = Icons.email;
    }
  }

  final List<IconData> icons;
  final MyPage page;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              floating: true,
              leading: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/'),
                  icon: Icon(icons[MyPage.home.idx]),
                  label: const Text('Home'),
                ),
              ),
              leadingWidth: 140,
              actions: <Widget>[
                ElevatedButton.icon(
                  onPressed: () => context.go('/blog'),
                  icon: Icon(icons[MyPage.blog.idx]),
                  label: const Text('Blog'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => context.go('/contact'),
                  icon: Icon(icons[MyPage.contact.idx]),
                  label: const Text('Contact'),
                ),
                const SizedBox(width: 10),
              ]
            ),
          ]
        ),
      ]
    );
  }
}
