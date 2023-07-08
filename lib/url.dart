// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:url_launcher/url_launcher.dart';

enum MyUrl {
  dart(
    url: 'https://dart.dev/'),
  dartpad(
    url: 'https://dartpad.dev/'),
  flutter(
    url: 'https://flutter.dev/'),
  github(
    url: 'https://github.com/manoj-ca/manoj_the_dev'),
  hello(
    url: 'https://en.wikipedia.org/wiki/%22Hello,_World!%22_program'),
  helloDart(
    url: 'https://dartpad.dev/embed-flutter.html?'
        'id=cde4c71479b11e38939b1387d3fba3c1'),
  helloFlutter(
    url: 'https://dartpad.dev/embed-flutter.html?'
        'id=12c7bf977077c0978b846703791bf27a'),
  indeed(
    url: 'https://ca.indeed.com/'),
  ionic(
    url: 'https://ionic.io/resources/articles/'
        'ionic-vs-flutter-comparison-guide');

  const MyUrl({required this.url});
  final String url;

  Uri get uri => Uri.parse(url);

  Future<void> myLaunch(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
