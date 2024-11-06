import 'package:bela_blok/screens/current_game_screen/current_game_screen.dart';
import 'package:bela_blok/screens/main_screen/main_screen.dart';
import 'package:bela_blok/screens/new_game_screen/new_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: 'main',
        builder: (BuildContext context, GoRouterState state) {
          return const MainScreen();
        },
        routes: [
          GoRoute(
            path: '/newgame',
            name: 'newgame',
            builder: (BuildContext context, GoRouterState state) {
              return const NewGameScreen();
            },
          ),
          GoRoute(
            path: '/currentgame',
            name: 'currentgame',
            builder: (BuildContext context, GoRouterState state) {
              return const CurrentGameScreen();
            },
          ),
        ]),
  ],
);
