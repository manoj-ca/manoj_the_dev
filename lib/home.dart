// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_bar.dart';
import 'json.dart';

const homeRawJson = '''
{
  "blocks": [
    {
      "type": "title",
      "text": "Hi, I'm Manoj.                                      ",
      "return": 2
    },
    {
      "type": "body",
      "text": "I'm a developer for hire. If interested, checkout my profile at ",
      "return": 0
    },
    {
      "type": "link",
      "text": "Indeed",
      "return": 0
    },
    {
      "type": "body",
      "text": " or use the Contact button above to send me an email.",
      "return": 2
    },
    {
      "type": "body",
      "text": "I created this website using Flutter to both learn and demonstrate my skills. You can checkout the source code at ",
      "return": 0
    },
    {
      "type": "link",
      "text": "GitHub",
      "return": 0
    },
    {
      "type": "body",
      "text": ".",
      "return": 2
    },
    {
      "type": "body",
      "text": "I also have a blog here where I discuss all things related to Flutter. Use the Blog button above to access it.",
      "return": 2
    },
    {
      "type": "title",
      "text": "Enjoy!                                                    ",
      "return": 2
    }
  ]
}
''';

enum MyUrl {
  indeed(url: 'https://ca.indeed.com/'),
  github(url: 'https://github.com/manoj-ca/manoj_the_dev');

  const MyUrl({required this.url});
  final String url;

  Uri get uri => Uri.parse(url);
}

class Home extends MyBar {
  Home({super.key, required super.page, required this.homeDoc});

  final Document homeDoc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final blocks = homeDoc.getBlocks();

    return Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: appBar(context),
        body: ListView(
          children: [
            Image.asset('images/ManojFlutter.png'),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                SizedBox(
                  width: 700,
                  child: RichText(
                    text: TextSpan(children: [
                      for (final block in blocks)
                        BlockSpan(block: block).textSpn(context),
                    ]),
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}

class BlockSpan {
  const BlockSpan({required this.block});

  final Block block;

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  TextSpan textSpn(BuildContext context) {
    final theme = Theme.of(context);
    final styleTitle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final styleBody = theme.textTheme.headlineMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final styleLink = theme.textTheme.headlineMedium!.copyWith(
      color: theme.colorScheme.inversePrimary,
      decoration: TextDecoration.underline,
      decorationColor: theme.colorScheme.inversePrimary,
    );

    switch (block) {
      case TitleBlock(:final text, :final ret):
        return TextSpan(
          text: _textRet(text, ret),
          style: styleTitle,
        );
      case BodyBlock(:final text, :final ret):
        return TextSpan(
          text: _textRet(text, ret),
          style: styleBody,
        );
      case LinkBlock(:final text, :final ret):
        return TextSpan(
          text: _textRet(text, ret),
          style: styleLink,
          recognizer: TapGestureRecognizer()
            ..onTap = () => _launchUrl(MyUrl.indeed.uri)
        );
    }
  }

  String _textRet(String text, int ret) {
    return switch (ret) {
      0 => text,
      1 => '$text\n',
      2 => '$text\n\n',
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
}
