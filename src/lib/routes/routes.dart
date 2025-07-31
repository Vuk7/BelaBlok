import 'package:bela_blok/screens/add_round_screen/add_round_screen.dart';
import 'package:bela_blok/screens/current_game_screen/current_game_screen.dart';
import 'package:bela_blok/screens/main_screen/main_screen.dart';
import 'package:bela_blok/screens/new_game_screen/new_game_screen.dart';
import 'package:bela_blok/screens/smart_calculator_screen/smart_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Custom page transitions
Page<void> _slideTransition({
  required Widget child,
  required GoRouterState state,
  Offset beginOffset = const Offset(1.0, 0.0),
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        )),
        child: child,
      );
    },
  );
}

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
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _slideTransition(
                child: const NewGameScreen(),
                state: state,
                beginOffset: const Offset(1.0, 0.0), // slide from right
              );
            },
          ),
          GoRoute(
            path: '/currentgame',
            name: 'currentgame',
            pageBuilder: (BuildContext context, GoRouterState state) {
              final id = state.uri.queryParameters['id'];
              return _slideTransition(
                child: CurrentGameScreen(gameId: id),
                state: state,
                beginOffset: const Offset(1.0, 0.0),
              );
            },
            routes: [
              GoRoute(
                path: '/addround',
                name: 'addround',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  final id = state.uri.queryParameters['id'];
                  final roundId = state.uri.queryParameters['roundId'];
                  final roundToEdit = state.extra; // može biti null ili Round
                  return _slideTransition(
                    child: AddRoundScreen(
                      gameId: id,
                      roundId: roundId,
                      roundToEdit: roundToEdit,
                    ),
                    state: state,
                    beginOffset: const Offset(0.0, 1.0),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/calculator',
            name: 'calculator',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _slideTransition(
                child: const SmartCalculatorScreen(),
                state: state,
                beginOffset: const Offset(0.0, 1.0), // slide from bottom
              );
            },
          ),
        ]),
  ],
);

