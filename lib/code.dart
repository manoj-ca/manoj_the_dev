// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'url.dart';

const String helloDartCode = '''
void main() {
  print('Hello, World!');
}''';

const String helloFlutterCode = '''
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

enum MyHello {
  dart(code: helloDartCode),
  flutter(code: helloFlutterCode);

  const MyHello({required this.code});

  final String code;
}

class MyCode extends StatelessWidget {
  const MyCode({
    super.key,
    required this.theme,
    required this.hello,
    required this.url,
  });

  final ThemeData theme;
  final MyHello hello;
  final MyUrl url;

  @override
  Widget build(BuildContext context) {
    final styleButton = theme.textTheme.headlineSmall!
        .copyWith(color: theme.colorScheme.onSecondaryContainer);

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
