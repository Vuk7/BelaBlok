import 'package:bela_blok/screens/add_round_screen/add_round_screen.dart';
import 'package:bela_blok/screens/current_game_screen/current_game_screen.dart';
import 'package:bela_blok/screens/main_screen/main_screen.dart';
import 'package:bela_blok/screens/new_game_screen/new_game_screen.dart';
import 'package:bela_blok/screens/settings_screen/settings_screen.dart';
import 'package:bela_blok/screens/smart_calculator_screen/smart_calculator_screen.dart';
import 'package:bela_blok/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Custom page transitions 
Page<void> _slideTransition({
  required Widget child,
  required GoRouterState state,
  required BuildContext context,
  Offset beginOffset = const Offset(1.0, 0.0),
}) {
  final ecoMode = context.read<EcoModeNotifier>().isEcoMode;

  if (ecoMode) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: child,
    );
  }

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
              final VoidCallback? updateGamesListCallback = state.extra as VoidCallback?;

              return _slideTransition(
                child: NewGameScreen(updateGamesListCallback: updateGamesListCallback),
                state: state,
                context: context,
                beginOffset: const Offset(1.0, 0.0), // slide from right
              );
            },
          ),
          GoRoute(
            path: '/currentgame',
            name: 'currentgame',
            pageBuilder: (BuildContext context, GoRouterState state) {
              final id = state.uri.queryParameters['id'];
              final VoidCallback? updateGamesListCallback = state.extra as VoidCallback?;
              
              return _slideTransition(
                child: CurrentGameScreen(gameId: id, updateGamesListCallback: updateGamesListCallback,),
                state: state,
                context: context,
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
                  final roundIndexStr = state.uri.queryParameters['roundIndex'];
                  final roundIndex = roundIndexStr != null ? int.tryParse(roundIndexStr) : null;
                  final VoidCallback? updateGamesListCallback = state.extra as VoidCallback?;

                  return _slideTransition(
                    child: AddRoundScreen(
                      gameId: id,
                      roundId: roundId,
                      roundIndex: roundIndex,
                      updateGamesListCallback: updateGamesListCallback
                    ),
                    state: state,
                    context: context,
                    beginOffset: const Offset(0.0, 1.0),
                  );
                },
              ),
              GoRoute(
                path: '/calculator',
                name: 'calculator',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _slideTransition(
                    child: SmartCalculatorScreen(
                      initialResult: state.extra as Map<String, dynamic>?,
                    ),
                    state: state,
                    context: context,
                    beginOffset: const Offset(0.0, 1.0), // slide from bottom
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _slideTransition(
                child: const SettingsScreen(),
                state: state,
                context: context,
                beginOffset: const Offset(1.0, 0.0),
              );
            },
          ),
         
        ]),
  ],
);

