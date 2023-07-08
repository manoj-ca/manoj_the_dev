// Copyright 2023 Manoj Prasad. All rights reserved.

// This code is currently not being used as this DartPad widget
// seemed rather buggy compared to going to the DartPad website.
// See code.dart instead for this functionality.

import 'package:flutter/material.dart';
import 'package:dart_pad_widget/dart_pad_widget.dart';

const String helloDart = 'Hello Dart';
const String helloDartCode = '''
void main() {
  print('Hello World!');
}
''';

const String helloFlutter = 'Hello Flutter';
const String helloFlutterCode = '''
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        'Hello, World!',
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
''';

enum MyCode {
  dart(key: helloDart, code: helloDartCode),
  flutter(key: helloFlutter, code: helloFlutterCode);

  const MyCode({required this.key, required this.code});

  final String key;
  final String code;
}

class MyDartPad extends StatelessWidget {
  const MyDartPad({
    super.key,
    required this.lang,
  });

  final MyCode lang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        SizedBox(
          width: 700,
          child: DartPad(
            key: Key(lang.key),
            embeddingChoice: EmbeddingChoice.flutter,
            width: 700,
            height: 350,
            code: lang.code,
          ),
        ),
      ]),
    );
  }
}
