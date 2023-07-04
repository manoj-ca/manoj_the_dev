// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

enum MyPage {
  home(idx: 0),
  blog(idx: 1),
  contact(idx: 2);

  const MyPage({required this.idx});
  final int idx;
}

abstract class MyBar extends StatelessWidget {
  MyBar({
    super.key,
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

  final MyPage page;
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.article_outlined,
    Icons.email_outlined
  ];

  void _launchMailClient() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'manoj.the.yogi@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Manoj the Dev website',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          onPressed: () => _launchMailClient(),
          icon: Icon(icons[MyPage.contact.idx]),
          label: const Text('Contact'),
        ),
        const SizedBox(width: 10),
      ]
    );
  }
}
