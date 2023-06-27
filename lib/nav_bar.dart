// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_page.dart';

class NavBar extends StatelessWidget {
  NavBar({
    super.key,
    required this.page,
  }) {
    switch (page) {
      case MyPage.home:
        icons[MyPage.home.idx] = Icons.home;
      case MyPage.about:
        icons[MyPage.about.idx] = Icons.person;
      case MyPage.blog:
        icons[MyPage.blog.idx] = Icons.article;
      case MyPage.contact:
        icons[MyPage.contact.idx] = Icons.email;
    }
  }

  final MyPage page;
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.person_outlined,
    Icons.article_outlined,
    Icons.email_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomScrollView(slivers: <Widget>[
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
                onPressed: () => context.go('/about'),
                icon: Icon(icons[MyPage.about.idx]),
                label: const Text('About'),
              ),
              const SizedBox(width: 10),
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
            ]),
      ]),
    ]);
  }

  void _launchMailClient() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'manoj_ca@yahoo.com',
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
}
