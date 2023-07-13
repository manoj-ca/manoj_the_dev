// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'url.dart';

const String _helloDartCode = '''
void main() {
  print('Hello, World!');
}''';

const String _helloFlutterCode = '''
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        'Hello, World!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}''';

const String _helloSolutionCode = '''
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        'Hello, World!',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 30,
          color: Colors.red,
        ),
      ),
    ),
  );
}''';

enum MyHello {
  dart(idx: 0, code: _helloDartCode),
  flutter(idx: 1, code: _helloFlutterCode),
  solution(idx: 2, code: _helloSolutionCode);

  const MyHello({required this.idx, required this.code});

  final int idx;
  final String code;
}

class MyCode extends StatelessWidget {
  const MyCode({
    super.key,
    required this.theme,
    required this.isMobile,
    required this.hello,
    required this.url,
  });

  final ThemeData theme;
  final bool isMobile;
  final MyHello hello;
  final MyUrl url;

  @override
  Widget build(BuildContext context) {
    final styleButton = theme.textTheme.headlineSmall!
        .copyWith(color: theme.colorScheme.onSecondaryContainer);

    if (isMobile) {
      if (hello.idx == MyHello.dart.idx) {
        return Image.asset('images/helloDart.jpg');
      } else if (hello.idx == MyHello.flutter.idx) {
        return Image.asset('images/helloFlutter.jpg');
      } else {
        return Image.asset('images/helloSolution.jpg');
      }
    } else {
      return Column(children: [
        SizedBox(
          width: 700,
          child: Card(
            color: theme.colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      hello.code,
                      style: GoogleFonts.courierPrime(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text(
                        'Open in DartPad',
                        style: styleButton,
                      ),
                      onPressed: () => url.myLaunch(url.uri),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ]);
    }
  }
}
