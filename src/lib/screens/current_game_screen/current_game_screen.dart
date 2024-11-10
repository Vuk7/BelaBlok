import 'package:bela_blok/enums/caller_enum.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/round_score_list_item.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/top_score_details.dart';
import 'package:flutter/material.dart';

class CurrentGameScreen extends StatefulWidget {
  const CurrentGameScreen({super.key});

  @override
  State<CurrentGameScreen> createState() => _CurrentGameScreenState();
}

class _CurrentGameScreenState extends State<CurrentGameScreen> {
  Map<Caller, int> teamScore = {
    Caller.teamOne: 980,
    Caller.teamTwo: 990,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          TopScoreDetails(
              teamOneScore: teamScore[Caller.teamOne]!,
              teamTwoScore: teamScore[Caller.teamTwo]!,
              scoreDifference:
                  teamScore[Caller.teamTwo]! - teamScore[Caller.teamOne]!,
              teamInLead: Caller.teamOne,
              teamOneLeftToWin: 1001 - teamScore[Caller.teamOne]!,
              teamTwoLeftToWin: 1001 - teamScore[Caller.teamTwo]!),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: RoundScoreListItem(
              teamOneCallAmount: 20,
              teamTwoCallAmount: 0,
              teamOneScore: 100,
              teamTwoScore: 82,
              roundID: 0,
              teamCalled: Caller.teamOne,
              onTap: () {},
            ),
          ),
        ]),
      ),
    )));
  }
}
