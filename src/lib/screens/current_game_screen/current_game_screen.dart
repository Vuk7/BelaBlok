import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/db/models/user_settings_model.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/round_score_list_item.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/top_score_details.dart';
import 'package:bela_blok/screens/widgets/animated_big_button.dart' as button;
import 'package:bela_blok/screens/widgets/animated_list_item.dart';
import 'package:bela_blok/screens/widgets/confetti_animation.dart';
import 'package:bela_blok/screens/widgets/game_stats_widget.dart';
import 'package:bela_blok/screens/widgets/morphing_widgets.dart';
import 'package:bela_blok/screens/widgets/error_message_widget.dart';
import 'package:bela_blok/services/games_service.dart';
import 'package:bela_blok/services/rounds_service.dart';
import 'package:bela_blok/services/settings_services.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/db/models/round_model.dart';
import 'package:bela_blok/models/game_stats.dart'; 
import 'package:bela_blok/themes/app_theme.dart';
import 'package:bela_blok/models/game_stats_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CurrentGameScreen extends StatefulWidget {
  final String? gameId;
  final VoidCallback? updateGamesListCallback;

  const CurrentGameScreen(
      {super.key, this.gameId, this.updateGamesListCallback});

  @override
  State<CurrentGameScreen> createState() => _CurrentGameScreenState();
}

class _CurrentGameScreenState extends State<CurrentGameScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showStatsPopup = false; // Popup NIJE aktivan na početku
  bool _wobbleTrigger = false; // Za wobble animaciju

  GamesService? gamesService;
  RoundsService? roundsService;
  SettingsService? settingsService;
  Game? currentGame;
  bool isLoadingGame = true;
  String? errorMessage;
  UserSettings? settings;

  List<Round>? rounds;
  bool isLoadingRounds = true;

  @override
  void initState() {
    super.initState();
    gamesService = GamesService(AppDatabase());
    roundsService = RoundsService(AppDatabase());
    settingsService = SettingsService(AppDatabase());
    () async {
      await handleInitializeGame(gameId: widget.gameId);
    }();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> handleInitializeGame({String? gameId}) async {
    setState(() {
      isLoadingGame = true;
      errorMessage = null;
    });

    Game? game;
    if (gameId != null) {
      game = await gamesService!.getGameById(gameId);
      if (game == null) {
        handleGameError("Igra s ID-om $gameId nije pronađena.");
        return;
      }
    } else {
      game = await gamesService!.getLatestGame();
      if (game == null) {
        handleGameError("Nema aktivne igre, kreirajte ju!");
        return;
      }
    }

    setState(() => currentGame = game);
    await loadRounds(game.id!);

    // Load settings
    settings = await settingsService!.fetchSettings();

    setState(() => isLoadingGame = false);
  }

  Future<void> loadRounds(String gameId) async {
    setState(() => isLoadingRounds = true);
    final roundRows = await roundsService!.getRoundsForGameSorted(gameId);
    setState(() {
      rounds = roundRows.map((r) => r.toModel()).toList();
      isLoadingRounds = false;
    });
  }

  void scrollToBottom() {
    if (_scrollController.hasClients && rounds != null && rounds!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void handleAddRound() async {
    if (currentGame?.id == null) {
      showErrorMessage("Nema aktivne igre");
      return;
    }

    await context.pushNamed('addround',
        queryParameters: {'id': currentGame!.id!},
        extra: widget.updateGamesListCallback);

    await handleInitializeGame(gameId: currentGame!.id!);
    scrollToBottom();
  }

  void handleGameError(String error) {
    setState(() => errorMessage = error);
    showErrorMessage(error);
  }

  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showErrorMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Došlo je do greške. Pokušajte ponovno.'),
        backgroundColor: AppTheme.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  Map<Team, int> get teamScore => {
        Team.teamOne: currentGame?.teamOneScore ?? 0,
        Team.teamTwo: currentGame?.teamTwoScore ?? 0,
      };

  int get gameTargetScore => currentGame?.gameType ?? 1001;
  int get totalRounds => rounds?.length ?? 0;
  double get averageScore {
    final one = teamScore[Team.teamOne]!;
    final two = teamScore[Team.teamTwo]!;
    return (one + two) / 2;
  }

  String? get winningTeam {
    if (!isGameFinished) return null;
    return teamScore[Team.teamOne]! >= gameTargetScore ? 'Tim 1' : 'Tim 2';
  }

  GameStats get gameStats => _aggregateTeamStats();

  GameStats _aggregateTeamStats() {
    if (rounds == null || rounds!.isEmpty) {
      return GameStats(
        totalRounds: totalRounds,
        averageScore: averageScore,
        winner: winningTeam,
        teamOneCalls: 0,
        teamTwoCalls: 0,
        teamOneFails: 0,
        teamTwoFails: 0,
        teamOneDeclarations: 0,
        teamTwoDeclarations: 0,
      );
    }

    int teamOneCalls = 0;
    int teamTwoCalls = 0;
    int teamOneFails = 0;
    int teamTwoFails = 0;
    int teamOneDeclarations = 0; //(sum of call amounts)
    int teamTwoDeclarations = 0;

    for (final r in rounds!) {
      final called = r.teamCalled;
      if (called == Team.teamOne.index) {
        teamOneCalls++;
      } else if (called == Team.teamTwo.index) {
        teamTwoCalls++;
      }
      final failed = (r.teamFailed ?? false) && called != null;
      if (failed) {
        if (called == Team.teamOne.index) {
          teamOneFails++;
        } else if (called == Team.teamTwo.index) {
          teamTwoFails++;
        }
      }
      teamOneDeclarations += r.teamOneCallAmount ?? 0;
      teamTwoDeclarations += r.teamTwoCallAmount ?? 0;
    }

    return GameStats(
      totalRounds: totalRounds,
      averageScore: averageScore,
      winner: winningTeam,
      teamOneCalls: teamOneCalls,
      teamTwoCalls: teamTwoCalls,
      teamOneFails: teamOneFails,
      teamTwoFails: teamTwoFails,
      teamOneDeclarations: teamOneDeclarations,
      teamTwoDeclarations: teamTwoDeclarations,
    );
  }

  bool get isGameFinished =>
      teamScore[Team.teamOne]! >= gameTargetScore ||
      teamScore[Team.teamTwo]! >= gameTargetScore;

  void _openStatsPopup() {
    setState(() {
      _showStatsPopup = true;
    });
  }

  void _closeStatsPopup() {
    setState(() {
      _showStatsPopup = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).scaffoldBackgroundColor;
    if (isLoadingGame) {
      return Scaffold(
        backgroundColor: bg,
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (errorMessage != null) {
      return Scaffold(
        backgroundColor: bg,
        body: ErrorMessageWidget(
          message: errorMessage!,
          onRetry: handleInitializeGame,
        ),
      );
    }
    if (currentGame == null) {
      return Scaffold(
        backgroundColor: bg,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nema aktivne igre, kreirajte ju!',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: handleInitializeGame,
                child: const Text('Kreiraj novu igru'),
              ),
            ],
          ),
        ),
      );
    }

    final teamOneWon = teamScore[Team.teamOne]! >= gameTargetScore;
    final winnerColor = teamOneWon ? AppTheme.orange : AppTheme.blue;

    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        MorphingContainer(
                          child: TopScoreDetails(
                            teamOneScore: teamScore[Team.teamOne]!,
                            teamTwoScore: teamScore[Team.teamTwo]!,
                            scoreDifference:
                                teamScore[Team.teamTwo]! - teamScore[Team.teamOne]!,
                            teamInLead: Team.teamOne,
                            teamOneLeftToWin:
                                gameTargetScore - teamScore[Team.teamOne]!,
                            teamTwoLeftToWin:
                                gameTargetScore - teamScore[Team.teamTwo]!,
                            gameTargetScore: gameTargetScore,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (isGameFinished && settings?.showGameStats == true)
                          GestureDetector(
                            onTap: () =>
                                setState(() => _wobbleTrigger = !_wobbleTrigger),
                            child: WobbleWidget(
                              triggerWobble: _wobbleTrigger,
                              child: GameStatsWidget(gameStats: gameStats),
                            ),
                          ),
                        if (isGameFinished && settings?.showGameStats == true)
                          const SizedBox(height: 16),
                        if (!isGameFinished || settings?.showGameStats != true)
                          const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  if (isLoadingRounds)
                    const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final round = rounds![index];
                          return AnimatedListItem(
                            index: index,
                            animationType: AnimationType.slideUp,
                            staggerDelay: 80,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: RoundScoreListItem(
                                teamOneCallAmount:
                                    round.teamOneCallAmount ?? 0,
                                teamTwoCallAmount:
                                    round.teamTwoCallAmount ?? 0,
                                teamOneScore: round.teamOneScore ?? 0,
                                teamTwoScore: round.teamTwoScore ?? 0,
                                teamFailed: round.teamFailed ?? false,
                                roundID: index,
                                teamCalled: Team.values[
                                    round.teamCalled ??
                                        Team.teamOne.index],
                                onTap: () async {
                                  await context.pushNamed('addround',
                                      queryParameters: {
                                        'id': currentGame!.id!,
                                        'roundId': round.id ?? '',
                                      }, extra: () {
                                    widget.updateGamesListCallback!();
                                  });
                                  await handleInitializeGame(
                                      gameId: currentGame!.id!);
                                  scrollToBottom();
                                },
                              ),
                            ),
                          );
                        },
                        childCount: rounds?.length ?? 0,
                      ),
                    ),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 100),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 8, 25, 5),
                child: Hero(
                  tag: isGameFinished
                      ? "return_to_main_button"
                      : "add_round_button",
                  child: button.AnimatedBigButton(
                    text: isGameFinished ? "NOVA IGRA" : "DODAJ",
                    icon: isGameFinished ? Icons.home : Icons.add,
                    iconAnimationType: button.AnimationType.scale,
                    textStyle: TextStyle(
                      color: AppTheme.getInverseTextColor(context),
                      fontSize:
                          AppTheme.defaultButtonTextStyle.fontSize,
                      fontWeight: AppTheme
                          .defaultButtonTextStyle.fontWeight,
                    ),
                    bgColor: isGameFinished
                        ? AppTheme.primary
                        : AppTheme.green,
                    onTap: isGameFinished
                        ? () => context.goNamed('main')
                        : handleAddRound,
                    textPadding: 15,
                  ),
                ),
              ),
            ),
          ),
          if (_showStatsPopup)
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10), 
              child: Center(
                child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width * 1, 
                    height: MediaQuery.of(context).size.height * 0.40, 
                    child: GameStatsWidget(gameStats: gameStats),
                  ),
                  actions: [
                    TextButton(
                      onPressed: _closeStatsPopup,
                      child: const Text('Zatvori'),
                    ),
                  ],
                ),
              ),
            ),
          ConfettiAnimation(
            isActive: isGameFinished,
            primaryColor: winnerColor,
            secondaryColor: AppTheme.accent,
          ),
        ],
      ),
    );
  }
}
