// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bar.dart';
import 'state.dart';

class MyDisplay extends StatelessWidget {
  const MyDisplay({super.key, required this.page});

  final MyPage page;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, myState, _) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0, horizontal: 15.0),
        child: Column(children: [
          SizedBox(
            width: 700,
            child: RichText(
              text: TextSpan(children: [
                for (final block in myState.blocks(page))
                  BlockSpan(block: block).textSpn(context),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

enum MyUrl {
  indeed(url: 'https://ca.indeed.com/'),
  flutter(url: 'https://flutter.dev/'),
  github(url: 'https://github.com/manoj-ca/manoj_the_dev'),
  ionic(url: 'https://ionic.io/resources/articles/'
               'ionic-vs-flutter-comparison-guide');

  const MyUrl({required this.url});
  final String url;

  Uri get uri => Uri.parse(url);
}

class BlockSpan {
  const BlockSpan({required this.block});

  final MyBlock block;

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  TextSpan textSpn(BuildContext context) {
    final theme = Theme.of(context);
    final styleTitle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    final styleHeader = theme.textTheme.headlineLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
      decoration: TextDecoration.underline,
      decorationColor: theme.colorScheme.onPrimary,
    );
    final styleBody = theme.textTheme.headlineMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final styleBodySmall = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final styleLink = theme.textTheme.headlineMedium!.copyWith(
      color: theme.colorScheme.inversePrimary,
      decoration: TextDecoration.underline,
      decorationColor: theme.colorScheme.inversePrimary,
    );

    return switch (block.type) {
      'title' => TextSpan(
          text: _textRet(block),
          style: styleTitle,
        ),
      'header' => TextSpan(
          text: _textRet(block),
          style: styleHeader,
        ),
      'body' => TextSpan(
          text: _textRet(block),
          style: styleBody,
        ),
      'bodySmall' => TextSpan(
          text: _textRet(block),
          style: styleBodySmall,
        ),
      'link' => TextSpan(
          text: _textRet(block),
          style: styleLink,
          recognizer: TapGestureRecognizer()
            ..onTap = () => _launchUrl(_destUrl(block).uri),
        ),
      _ => throw const FormatException('Unexpected Block format'),
    };
  }

  String _textRet(MyBlock block) {
    return switch (block.ret) {
      0 => '${block.text}',
      1 => '${block.text}\n',
      2 => '${block.text}\n\n',
      _ => throw const FormatException('Unexpected Block format'),
    };
  }

  MyUrl _destUrl(MyBlock block) {
    return switch (block.text) {
      "Indeed" => MyUrl.indeed,
      "Flutter" => MyUrl.flutter,
      "GitHub" => MyUrl.github,
      "Ionic" => MyUrl.ionic,
      _ => throw const FormatException('Unexpected Block format'),
    };
  }
}

class MyBlock {
  final int? idx;
  final String? type;
  final String? text;
  final int? ret;

  MyBlock({
    this.idx,
    this.type,
    this.text,
    this.ret,
  });

  factory MyBlock.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return MyBlock(
      idx: data?['idx'],
      type: data?['type'],
      text: data?['text'],
      ret: data?['return'],
    );
  }
}
