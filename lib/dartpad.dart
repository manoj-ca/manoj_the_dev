import 'package:flutter/material.dart';
import 'package:dart_pad_widget/dart_pad_widget.dart';

const String helloDart = '''
void main() {
  print('Hello World!');
}
''';

class MyDartPad extends StatelessWidget {
  const MyDartPad({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DartPad(
              key: const Key('Hello Dart'),
              embeddingChoice: EmbeddingChoice.flutter,
              width: 800,
              height: 400,
              code: helloDart,
            ),
          ],
        ),
      ),
    );
  }
}
