// Copyright 2023 Manoj Prasad. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';
import 'blog.dart';
import 'bar.dart';
import 'state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => MyState(),
    builder: ((context, child) => const MyApp()),
  ));
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        //return Home(page: MyPage.home);
        return Home(page: MyPage.home);
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'blog',
          builder: (BuildContext context, GoRouterState state) {
            return Blog(page: MyPage.blog);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Manoj the Dev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
