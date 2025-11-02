import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/db/models/user_settings_model.dart';
import 'package:bela_blok/screens/main_screen/widgets/animated_history_list_item.dart';
import 'package:bela_blok/screens/widgets/rules_widget.dart';
import 'package:bela_blok/services/games_service.dart';
import 'package:bela_blok/services/settings_services.dart';
import 'package:bela_blok/screens/widgets/animated_big_button.dart';
import 'package:bela_blok/utils/date_helper.dart';
import 'package:bela_blok/utils/lifecycle_event_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:bela_blok/screens/widgets/settings_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late GamesService gamesService;
  late SettingsService settingsService;
  List<Game> gamesHistory = [];
  var isLoadingGameHistory = true;
  UserSettings? settings;

  var isLoadingMoreGames = false;
  var hasMoreGames = true;

  static const int _pageSize = 20;
  int _currentPage = 1;
  late ScrollController _scrollController;
  Game? latestGame; // cache of the most recent game to show Continue button

  // LIfecycle handler for updating screen data
  late LifecycleEventHandler _lifecycleHandler;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Listen for app resume and update games
    _lifecycleHandler = LifecycleEventHandler(resumeCallback: () async {
      _refreshGameHistory();
    });
    WidgetsBinding.instance.addObserver(_lifecycleHandler);

    _initGames();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_lifecycleHandler);

    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Load more when user is 200 pixels from the bottom
      _loadMoreGames();
    }
  }

  Future<void> _initGames() async {
    setState(() {
      isLoadingGameHistory = true;
      gamesHistory = [];
      _currentPage = 1;
      hasMoreGames = true;
    });

    gamesService = GamesService(AppDatabase());
    settingsService = SettingsService(AppDatabase());

    // Load settings
    settings = await settingsService.fetchSettings();

    await _loadGamePage();
    // Fetch latest game for Continue button
    latestGame = await gamesService.getLatestGame();

    setState(() {
      isLoadingGameHistory = false;
    });
  }

  Future<void> _loadGamePage() async {
    if (!hasMoreGames || isLoadingMoreGames) return;

    final newGames = await gamesService.getGamesPaginated(
      nextPage: _currentPage,
      perPage: _pageSize,
    );

    setState(() {
      gamesHistory.addAll(newGames);
      _currentPage++;
      hasMoreGames = newGames.length == _pageSize;
    });
  }

  Future<void> _loadMoreGames() async {
    if (!hasMoreGames || isLoadingMoreGames || isLoadingGameHistory) return;

    setState(() {
      isLoadingMoreGames = true;
    });

    await _loadGamePage();

    setState(() {
      isLoadingMoreGames = false;
    });
  }

  Future<void> _refreshGameHistory() async {
    await _initGames();
  }

  Future<void> _refreshSettings() async {
    settings = await settingsService.fetchSettings();
    setState(() {});
  }

  Future<bool> _showDeleteConfirmationDialog(String gameId) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Potvrda brisanja'),
              content:
                  const Text('Jeste li sigurni da želite obrisati ovu igru?'),
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
        ) ??
        false;
  }

  Future<void> handleDeleteGame(String gameId) async {
    await gamesService.deleteGame(gameId);

    setState(() {
      gamesHistory.removeWhere((game) => game.id == gameId);
    });

    if (hasMoreGames && gamesHistory.length < _pageSize) {
      await _loadMoreGames();
    }

    // Update latestGame cache
    latestGame = await gamesService.getLatestGame();

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.history,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 26,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Povijest:",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            isLoadingGameHistory
                                ? const Center(
                                    child: CircularProgressIndicator())
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
                                            controller: _scrollController,
                                            itemCount: gamesHistory.length +
                                                (hasMoreGames ? 1 : 0),
                                            itemBuilder: (context, index) {
                                              if (index ==
                                                  gamesHistory.length) {
                                                return Container(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  alignment: Alignment.center,
                                                  child: isLoadingMoreGames
                                                      ? const SizedBox(
                                                          height: 24,
                                                          width: 24,
                                                          child:
                                                              CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      2),
                                                        )
                                                      : const SizedBox.shrink(),
                                                );
                                              }

                                              final game = gamesHistory[index];
                                              return Dismissible(
                                                key: Key(game.id ??
                                                    index.toString()),
                                                direction:
                                                    DismissDirection.endToStart,
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
                                                  await handleDeleteGame(
                                                      game.id ?? "");
                                                },
                                                child: AnimatedHistoryListItem(
                                                  gameID: game.id ?? "N/A",
                                                  date: formatDate(
                                                      game.createdAt),
                                                  teamOneScore:
                                                      game.teamOneScore ?? 0,
                                                  teamTwoScore:
                                                      game.teamTwoScore ?? 0,
                                                  onTap: () async {
                                                    await context.pushNamed(
                                                        "currentgame",
                                                        queryParameters: {
                                                          'id': game.id
                                                        }, extra: () {
                                                      _refreshGameHistory();
                                                    });
                                                    await _refreshGameHistory();
                                                    latestGame =
                                                        await gamesService
                                                            .getLatestGame();
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

                    // Conditionally show RulesWidget based on settings
                    if (settings?.showRules == true) ...[
                      const RulesWidget(),
                      const SizedBox(height: 20),
                    ],

                    // Continue game button if the latest game exists and is unfinished
                    if (latestGame != null && latestGame!.finished != true)
                      Padding(
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
                              context.goNamed("currentgame",
                                  queryParameters: {'id': latestGame!.id},
                                  extra: () {
                                _refreshGameHistory();
                              });
                            },
                          ),
                        ),
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
                          onTap: () async {
                            await context.pushNamed("newgame", extra: () {
                              _refreshGameHistory();
                            });
                            await _refreshGameHistory();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SettingsButton(
                        onTap: () async {
                          await context.pushNamed('settings');
                          await _refreshSettings();
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
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
