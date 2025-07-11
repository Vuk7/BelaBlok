import 'package:bela_blok/screens/main_screen/widgets/history_list_item.dart';
import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:bela_blok/screens/widgets/rules_widget.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bela_blok/screens/main_screen/widgets/animated_button.dart';
import 'package:provider/provider.dart';
import 'package:bela_blok/main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark 
        ? Theme.of(context).scaffoldBackgroundColor 
        : const Color(0xFFF5E6D3), // boja kože
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "BELA BLOK",
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary, // koristi primary boju iz teme
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Colors.brown.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Card(
                elevation: 4,
                color: Theme.of(context).brightness == Brightness.dark 
                  ? Colors.grey[800] 
                  : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Povijest:",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 20),
                      HistoryListItem(
                          gameID: 0,
                          date: "21.10.2024",
                          teamOneScore: 1030,
                          teamTwoScore: 560,
                          onTap: () {}),
                      const SizedBox(height: 10),
                      HistoryListItem(
                          gameID: 1,
                          date: "21.10.2024",
                          teamOneScore: 1030,
                          teamTwoScore: 560,
                          onTap: () {}),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Dodajemo PRAVILA widget
              const RulesWidget(),
              const SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AnimatedButton(
                  text: "NASTAVI",
                  icon: Icons.play_arrow,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                  bgColor: const Color(0xFF3DB328),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AnimatedButton(
                  text: "NOVA IGRA",
                  icon: Icons.refresh,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                  bgColor: const Color(0xFFFF9500), 
                  onTap: () {
                    context.goNamed("newgame");
                  },
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(
          Theme.of(context).brightness == Brightness.dark
              ? Icons.nightlight_round
              : Icons.wb_sunny,
          color: Colors.amber,
        ),
        onPressed: () {
          Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
        },
      ),
    );
  }
}

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MainScreen();
        },
      ),
      // Add other routes here
    ],
  );
}
