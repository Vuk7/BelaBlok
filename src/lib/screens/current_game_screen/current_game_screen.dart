import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/round_score_list_item.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/top_score_details.dart';
import 'package:bela_blok/screens/widgets/animated_list_item.dart';
import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:bela_blok/screens/widgets/confetti_animation.dart';
import 'package:bela_blok/screens/widgets/game_stats_widget.dart';
import 'package:bela_blok/screens/widgets/morphing_widgets.dart';
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
  bool _wobbleTrigger = false; // Dodano za wobble efekt

  Map<Team, int> teamScore = {
    Team.teamOne: 1005,  // Povećano da možete vidjeti glow efekt
    Team.teamTwo: 890,
  };

  // Dodajemo statistike
  Map<String, dynamic> gameStats = {
    'teamOneCalls': 5,     // koliko puta je tim 1 zvao
    'teamTwoCalls': 7,     // koliko puta je tim 2 zvao
    'teamOneFails': 1,     // koliko puta je tim 1 pao
    'teamTwoFails': 2,     // koliko puta je tim 2 pao
    'teamOneDeclarations': 3, // koliko zvanja je tim 1 imao
    'teamTwoDeclarations': 4, // koliko zvanja je tim 2 imao
  };

  // Provjeri da li je igra završena
  bool get isGameFinished => teamScore[Team.teamOne]! >= 1001 || teamScore[Team.teamTwo]! >= 1001;

  List<Map<String, dynamic>> dummyRoundData = List.generate(10, (index) {
    return {
      'teamOneCallAmount': 0,
      'teamTwoCallAmount': 20,
      'teamOneScore': 62,
      'teamTwoScore': 100,
      'roundID': index,
      'teamCalled': Team.teamTwo
    };
  });

  @override
  void initState() {
    super.initState();
    
    // Trigger wobble when widget loads and there's a winner
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isGameFinished) {
        setState(() {
          _wobbleTrigger = true;
        });
        
        // Reset trigger after animation
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              _wobbleTrigger = false;
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine if someone won
    final teamOneWon = teamScore[Team.teamOne]! >= 1001;
    final teamTwoWon = teamScore[Team.teamTwo]! >= 1001;
    final hasWinner = teamOneWon || teamTwoWon;
    final winnerColor = teamOneWon ? Colors.orange : Colors.blue;

    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark 
          ? const Color(0xFF2C3E50) 
          : const Color(0xFFF5E6D3), // boja kože
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    MorphingContainer(
                      child: TopScoreDetails(
                          teamOneScore: teamScore[Team.teamOne]!,
                          teamTwoScore: teamScore[Team.teamTwo]!,
                          scoreDifference:
                              teamScore[Team.teamTwo]! - teamScore[Team.teamOne]!,
                          teamInLead: Team.teamOne,
                          teamOneLeftToWin: 1001 - teamScore[Team.teamOne]!,
                          teamTwoLeftToWin: 1001 - teamScore[Team.teamTwo]!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Statistike box - samo se prikazuje kada je igra završena
                    if (isGameFinished) ...[
                      GestureDetector(
                        onTap: () {
                          // Ručno triggeriranje wobble-a
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
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(5.0),
                        itemCount: dummyRoundData.length,
                        itemBuilder: (context, index) {
                          final round = dummyRoundData[index];
                          return AnimatedListItem(
                            index: index,
                            animationType: AnimationType.slideUp,
                            staggerDelay: 80, // Enhanced staggered delay
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: RoundScoreListItem(
                                teamOneCallAmount: round['teamOneCallAmount'],
                                teamTwoCallAmount: round['teamTwoCallAmount'],
                                teamOneScore: round['teamOneScore'],
                                teamTwoScore: round['teamTwoScore'],
                                roundID: round['roundID'],
                                teamCalled: round['teamCalled'],
                                onTap: () {},
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Hero(
                        tag: "add_round_button",
                        child: BigButton(
                          text: "DODAJ",
                          icon: Icons.add,
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                          bgColor: AppTheme.green,
                          onTap: () {
                            context.goNamed("addround");
                          },
                          textPadding: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ]),
                ),
              ),
            ),
            // Confetti overlay
            ConfettiAnimation(
              isActive: hasWinner,
              primaryColor: winnerColor,
              secondaryColor: Colors.amber,
            ),
          ],
        ));
  }


}
