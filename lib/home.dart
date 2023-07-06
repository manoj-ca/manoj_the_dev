// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bar.dart';
import 'state.dart';
import 'block.dart';

enum MyUrl {
  indeed(url: 'https://ca.indeed.com/'),
  github(url: 'https://github.com/manoj-ca/manoj_the_dev');

  const MyUrl({required this.url});
  final String url;

  Uri get uri => Uri.parse(url);
}

class Home extends MyBar {
  Home({super.key, required super.page});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: appBar(context),
        body: ListView(
          children: [
            Image.asset('images/ManojFlutter.png'),
            const SizedBox(height: 50),
            Consumer<MyState>(
              builder: (context, myState, _) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  SizedBox(
                    width: 700,
                    child: RichText(
                      text: TextSpan(children: [
                        for (final block in myState.blocks)
                          BlockSpan(block: block).textSpn(context),
                      ]),
                    ),
                  ),
                ]),
              ),
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

    switch (block.type) {
      case 'title':
        return TextSpan(
          text: _textRet(block),
          style: styleTitle,
        );
      case 'body':
        return TextSpan(
          text: _textRet(block),
          style: styleBody,
        );
      case 'link':
        return TextSpan(
          text: _textRet(block),
          style: styleLink,
          recognizer: TapGestureRecognizer()
            ..onTap = () => _launchUrl(_destUrl(block.text).uri),
        );
    }
    throw const FormatException('Unexpected Block format');
  }

  String _textRet(Block block) {
    return switch (block.ret) {
      0 => '${block.text}',
      1 => '${block.text}\n',
      2 => '${block.text}\n\n',
      _ => throw const FormatException('Unexpected Block format'),
    };
  }

  MyUrl _destUrl(text) {
    return switch (text) {
      "Indeed" => MyUrl.indeed,
      "GitHub" => MyUrl.github,
      _ => throw const FormatException('Unexpected Block format'),
    };
  }
}
