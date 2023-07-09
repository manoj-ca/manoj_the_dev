// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:url_launcher/url_launcher.dart';

enum MyUrl {
  center(url: 'https://api.flutter.dev/flutter/widgets/Center-class.html'),
  dart(url: 'https://dart.dev/'),
  dartpad(url: 'https://dartpad.dev/'),
  flutter(url: 'https://flutter.dev/'),
  github(url: 'https://github.com/manoj-ca/manoj_the_dev'),
  hello(url: 'https://en.wikipedia.org/wiki/%22Hello,_World!%22_program'),
  helloDart(
      url: 'https://dartpad.dev/embed-flutter.html?'
          'id=cde4c71479b11e38939b1387d3fba3c1'),
  helloFlutter(
      url: 'https://dartpad.dev/embed-flutter.html?'
          'id=12c7bf977077c0978b846703791bf27a'),
  helloSolution(
    url: 'https://dartpad.dev/embed-flutter.html?'
        'id=53f7a6aad22a55305959ccec02358b84'),
  indeed(
    url: 'https://profile.indeed.com/p/manojp-yq71skp'),
  ionic(
      url: 'https://ionic.io/resources/articles/'
          'ionic-vs-flutter-comparison-guide'),
  named(
    url: 'https://dart.dev/language/functions#named-parameters'),
  text(
    url: 'https://api.flutter.dev/flutter/widgets/Text-class.html'),
  textdir(
    url: 'https://api.flutter.dev/flutter/intl/TextDirection-class.html');

  const MyUrl({required this.url});
  final String url;

  Uri get uri => Uri.parse(url);

  Future<void> myLaunch(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
