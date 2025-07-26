import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/screens/main_screen/widgets/animated_history_list_item.dart';
import 'package:bela_blok/screens/widgets/rules_widget.dart';
import 'package:bela_blok/services/games_service.dart';
import 'package:bela_blok/screens/widgets/animated_big_button.dart';
import 'package:bela_blok/utils/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:bela_blok/main.dart';
import 'package:bela_blok/themes/app_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late GamesService gamesService;
  List<Game> gamesHistory = [];
  var isLoadingGameHistory = true;

  @override
  void initState() {
    super.initState();
    _initGames();
  }

  Future<void> _initGames() async {
    isLoadingGameHistory = true;
    gamesService = GamesService(AppDatabase());
    gamesHistory = await gamesService.getAllGames();
    isLoadingGameHistory = false;
    setState(() {});
  }

  Future<void> _refreshGameHistory() async {
    gamesHistory = await gamesService.getAllGames();
    setState(() {});
  }

  Future<bool> _showDeleteConfirmationDialog(String gameId) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Potvrda brisanja'),
          content: const Text('Jeste li sigurni da želite obrisati ovu igru?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('ODUSTANI'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(foregroundColor: AppTheme.red),
              child: const Text('OBRIŠI'),
            ),
          ],
        );
      },
    ) ?? false;
  }

  Future<void> handleDeleteGame(String gameId) async {
    await gamesService.deleteGame(gameId);
    await _refreshGameHistory();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Igra je uspiješno obrisana'),
          backgroundColor: AppTheme.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: isLoadingGameHistory
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                   const Text(
                      "BELA BLOK",
                      style: AppTheme.titleTextStyle,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Card(
                      elevation: 4,
                      color: AppTheme.getCardBackgroundColor(context),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 20),
                            isLoadingGameHistory
                                ? const Center(child: CircularProgressIndicator())
                                : SizedBox(
                                    height: 200,
                                    child: gamesHistory.isEmpty
                                        ? Center(
                                            child: Text(
                                              "Trenutno nemate dostupnih igri.",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .error),
                                            ),
                                          )
                                        : ListView.builder(
                                            itemCount: gamesHistory.length,
                                            itemBuilder: (context, index) {
                                              final game = gamesHistory[index];

                                              return Dismissible(
                                                key: Key(game.id ?? index.toString()),
                                                direction: DismissDirection.endToStart,
                                                background: Container(
                                                  color: AppTheme.red,
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                                confirmDismiss: (direction) async {
                                                  return await _showDeleteConfirmationDialog(game.id ?? "");
                                                },
                                                onDismissed: (direction) async {
                                                  await handleDeleteGame(game.id ?? "");
                                                },
                                                child: AnimatedHistoryListItem(
                                                  gameID: game.id ?? "N/A",
                                                  date: formatDate(game.createdAt),
                                                  teamOneScore: game.teamOneScore ?? 0,
                                                  teamTwoScore: game.teamTwoScore ?? 0,
                                                  onTap: () {
                                                    context.goNamed(
                                                      "currentgame",
                                                      queryParameters: {'id': game.id},
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    
                    const RulesWidget(),
                    const SizedBox(height: 20),

                    
                    FutureBuilder<Game?>(
                      future: gamesService.getLatestUnfinishedGame(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        final latestUnfinishedGame = snapshot.data;
                        if (latestUnfinishedGame == null) return const SizedBox.shrink();

                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Hero(
                            tag: "continue_button",
                            child: AnimatedBigButton(
                              text: "NASTAVI",
                              icon: Icons.play_arrow,
                              iconAnimationType: AnimationType.slideRight,
                              textStyle: AppTheme.defaultButtonTextStyle,
                              bgColor: AppTheme.green,
                              onTap: () {
                                context.goNamed(
                                  "currentgame",
                                  queryParameters: {'id': latestUnfinishedGame.id},
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Hero(
                        tag: "new_game_button",
                        child: AnimatedBigButton(
                          text: "NOVA IGRA",
                          icon: Icons.refresh,
                          iconAnimationType: AnimationType.rotate,
                          textStyle: AppTheme.defaultButtonTextStyle,
                          bgColor: AppTheme.orange,
                          onTap: () {
                            context.goNamed("newgame");
                          },
                        ),
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
      
    ],
  );
}
