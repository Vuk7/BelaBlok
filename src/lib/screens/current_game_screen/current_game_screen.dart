import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/round_score_list_item.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/top_score_details.dart';
import 'package:bela_blok/screens/widgets/animated_big_button.dart' as button;
import 'package:bela_blok/screens/widgets/animated_list_item.dart';
import 'package:bela_blok/screens/widgets/confetti_animation.dart';
import 'package:bela_blok/screens/widgets/game_stats_widget.dart';
import 'package:bela_blok/screens/widgets/morphing_widgets.dart';
import 'package:bela_blok/services/games_service.dart';
import 'package:bela_blok/db/models/game_model.dart';   
import 'package:bela_blok/db/dao/round_dao.dart';
import 'package:bela_blok/db/models/round_model.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CurrentGameScreen extends StatefulWidget {
  const CurrentGameScreen({super.key});

  @override
  State<CurrentGameScreen> createState() => _CurrentGameScreenState();
}

class _CurrentGameScreenState extends State<CurrentGameScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _wobbleTrigger = false;

  GamesService? gamesService;
  Game? currentGame;
  bool isLoadingGame = true;
  String? errorMessage;

  List<Round>? rounds;
  bool isLoadingRounds = true;

  @override
  void initState() {
    super.initState();
    handleInitializeGame();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Handle function for initializing game
  Future<void> handleInitializeGame() async {
    try {
      setState(() {
        isLoadingGame = true;
        errorMessage = null;
      });

      gamesService = await GamesService.create();
      final game = await gamesService!.getLatestGame();

      if (game != null) {
        setState(() {
          currentGame = game;
        });
        await loadRounds(game.id!);
        showSuccessMessage("Igra uspješno kreirana!");
      } else {
        handleGameError("Nema aktivne igre, kreirajte ju!");
      }
    } catch (e) {
      handleGameError("Greška pri učitavanju igre: ${e.toString()}");
    } finally {
      setState(() {
        isLoadingGame = false;
      });
    }
  }

  Future<void> loadRounds(String gameId) async {
    setState(() {
      isLoadingRounds = true;
    });
    final roundDao = RoundDao(gamesService!.database);
    final roundRows = await roundDao.getRoundsForGameSorted(gameId);
    setState(() {
      rounds = roundRows.map((r) => r.toModel()).toList();
      isLoadingRounds = false;
    });
  }

  // Handle function for navigating to add round
  void handleAddRound() {
    if (currentGame?.id == null) {
      showErrorMessage("Nema aktivne igre");
      return;
    }

    if (isGameFinished) {
      showErrorMessage("Igra je već završena");
      return;
    }

    context.goNamed("addround", extra: currentGame!.id!);
  }

  // Handle function for game errors
  void handleGameError(String error) {
    setState(() {
      errorMessage = error;
    });
    showErrorMessage(error);
  }

  // Helper function for success message
  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Helper function for error message
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Getters
  Map<Team, int> get teamScore => {
    Team.teamOne: currentGame?.teamOneScore ?? 0,
    Team.teamTwo: currentGame?.teamTwoScore ?? 0,
  };

  int get gameTargetScore => currentGame?.gameType ?? 1001;

  Map<String, dynamic> get gameStats => {
    'totalRounds': rounds?.length ?? 0,
    'averageScore': (teamScore[Team.teamOne]! + teamScore[Team.teamTwo]!) / 2,
    'winner': isGameFinished
        ? (teamScore[Team.teamOne]! >= gameTargetScore ? 'Tim 1' : 'Tim 2')
        : null,
  };

  bool get isGameFinished =>
      teamScore[Team.teamOne]! >= gameTargetScore ||
      teamScore[Team.teamTwo]! >= gameTargetScore;

  @override
  Widget build(BuildContext context) {
    // Loading state
    if (isLoadingGame) {
      return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark 
          ? const Color(0xFF2C3E50) 
          : const Color(0xFFF5E6D3),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Error state
    if (errorMessage != null) {
      return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark 
          ? const Color(0xFF2C3E50) 
          : const Color(0xFFF5E6D3),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                errorMessage!,
                style: const TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: handleInitializeGame,
                child: const Text('Pokušaj ponovo'),
              ),
            ],
          ),
        ),
      );
    }

    // No game state
    if (currentGame == null) {
      return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark 
          ? const Color(0xFF2C3E50) 
          : const Color(0xFFF5E6D3),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nema aktivne igre, kreirajte ju! ',
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

    // Game screen content
    final teamOneWon = teamScore[Team.teamOne]! >= gameTargetScore;
    final teamTwoWon = teamScore[Team.teamTwo]! >= gameTargetScore;
    final hasWinner = teamOneWon || teamTwoWon;
    final winnerColor = teamOneWon ? Colors.orange : Colors.blue;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark 
        ? const Color(0xFF2C3E50) 
        : const Color(0xFFF5E6D3),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(children: [
                  const SizedBox(height: 10),
                  MorphingContainer(
                    child: TopScoreDetails(
                      teamOneScore: teamScore[Team.teamOne]!,
                      teamTwoScore: teamScore[Team.teamTwo]!,
                      scoreDifference: teamScore[Team.teamTwo]! - teamScore[Team.teamOne]!,
                      teamInLead: Team.teamOne,
                      teamOneLeftToWin: gameTargetScore - teamScore[Team.teamOne]!,
                      teamTwoLeftToWin: gameTargetScore - teamScore[Team.teamTwo]!,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (isGameFinished) ...[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _wobbleTrigger = !_wobbleTrigger;
                        });
                      },
                      child: WobbleWidget(
                        triggerWobble: _wobbleTrigger,
                        child: GameStatsWidget(gameStats: gameStats),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                  // Loading rounds state
                  if (isLoadingRounds) ...{
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  } else ...{
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
                                roundID: int.tryParse(round.id ?? '') ?? 0,
                                teamCalled: Team.values[(round.teamCalled ?? Team.teamOne.index)],
                                onTap: () {},
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  },
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Hero(
                      tag: "add_round_button",
                      child: button.AnimatedBigButton(
                        text: "DODAJ",
                        icon: Icons.add,
                        iconAnimationType: button.AnimationType.scale,
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.bold
                        ),
                        bgColor: AppTheme.green,
                        onTap: handleAddRound,
                        textPadding: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10)
                ]),
              ),
            ),
          ),
          ConfettiAnimation(
            isActive: hasWinner,
            primaryColor: winnerColor,
            secondaryColor: Colors.amber,
          ),
        ],
      )
    );
  }
}
