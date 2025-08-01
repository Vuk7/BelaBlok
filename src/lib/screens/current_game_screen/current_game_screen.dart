import 'package:bela_blok/db/database.dart'; 
import 'package:bela_blok/enums/team_enum.dart';
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
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/db/models/round_model.dart';
import 'package:bela_blok/models/game_stats.dart'; 
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CurrentGameScreen extends StatefulWidget {
  final String? gameId;
  const CurrentGameScreen({super.key, this.gameId});

  @override
  State<CurrentGameScreen> createState() => _CurrentGameScreenState();
}

class _CurrentGameScreenState extends State<CurrentGameScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showStatsPopup = false; // Popup NIJE aktivan na početku

  GamesService? gamesService;
  RoundsService? roundsService; 
  Game? currentGame;
  bool isLoadingGame = true;
  String? errorMessage;

  List<Round>? rounds;
  bool isLoadingRounds = true;

  @override
  void initState() {
    super.initState();
    gamesService = GamesService(AppDatabase());
    roundsService = RoundsService(AppDatabase()); 
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

  void handleAddRound() async {
    if (currentGame?.id == null) {
      showErrorMessage("Nema aktivne igre");
      return;
    }
    if (isGameFinished) {
      showErrorMessage("Igra je već završena");
      return;
    }
    await context.pushNamed(
      'addround',
      queryParameters: {'id': currentGame!.id!},
    );
    
    await handleInitializeGame(gameId: currentGame!.id!);
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

  GameStatsModel get gameStats =>
      GameStatsModel.calculate(currentGame!, rounds ?? []);

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
                  const SizedBox(height: 10),
                  if (isGameFinished)
                    GestureDetector(
                      onTap: _openStatsPopup,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppTheme.green.withValues(alpha: 0.08),
                          border: Border.all(color: AppTheme.green, width: 2),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.green.withValues(alpha: 0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child:  const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Icon(Icons.analytics, color: AppTheme.green, size: 28),
                            SizedBox(width: 8),
                            Text(
                              'STATISTIKA IGRE',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (isLoadingRounds)
                    const Center(child: CircularProgressIndicator())
                  else
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(5.0),
                        itemCount: rounds?.length ?? 0,
                        itemBuilder: (context, index) {
                          final round = rounds![index];
                          return AnimatedListItem(
                            index: index,
                            animationType: AnimationType.slideUp,
                            staggerDelay: 80,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: RoundScoreListItem(
                                teamOneCallAmount: round.teamOneCallAmount ?? 0,
                                teamTwoCallAmount: round.teamTwoCallAmount ?? 0,
                                teamOneScore: round.teamOneScore ?? 0,
                                teamTwoScore: round.teamTwoScore ?? 0,
                                roundID: index, 
                                teamCalled: Team.values[
                                    round.teamCalled ??
                                        Team.teamOne.index],
                                onTap: () async {
                                  await context.pushNamed(
                                    'addround',
                                    queryParameters: {
                                      'id': currentGame!.id!,
                                      'roundId': round.id ?? '',
                                    },
                                    extra: round, 
                                  );
                                  await handleInitializeGame(gameId: currentGame!.id!);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Hero(
                      tag: "add_round_button",
                      child: button.AnimatedBigButton(
                        text: "DODAJ",
                        icon: Icons.add,
                        iconAnimationType: button.AnimationType.scale,
                        textStyle: TextStyle(
                          color: AppTheme.getInverseTextColor(context),
                          fontSize:
                              AppTheme.defaultButtonTextStyle.fontSize,
                          fontWeight: AppTheme
                              .defaultButtonTextStyle.fontWeight,
                        ),
                        bgColor: AppTheme.green,
                        onTap: handleAddRound,
                        textPadding: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
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
