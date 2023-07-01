// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';

import 'my_bar.dart';

const String about = '''

I'm a developer for hire. If interested, checkout my profile at Indeed or use the Contact button above to send me an email.

I created this website using Flutter to both learn and demonstrate my skills. You can checkout the source code from GitHub.

I also have a blog here where I discuss all things related to Flutter. Use the Blog button above to access it.

Enjoy!
''';

class Home extends MyBar {
  Home({super.key, required super.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        children: [
          Image.asset('images/ManojFlutter.png'),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "Hi, I'm Manoj.                                       ",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  width: 700,
                  child: Text(
                    about,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
