import 'package:bela_blok/enums/caller_enum.dart';
import 'package:bela_blok/routes/routes.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/round_score_list_item.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/top_score_details.dart';
import 'package:bela_blok/screens/widgets/big_button.dart';
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

  Map<Caller, int> teamScore = {
    Caller.teamOne: 980,
    Caller.teamTwo: 990,
  };

  List<Map<String, dynamic>> dummyRoundData = List.generate(10, (index) {
    return {
      'teamOneCallAmount': 0,
      'teamTwoCallAmount': 20,
      'teamOneScore': 62,
      'teamTwoScore': 100,
      'roundID': index,
      'teamCalled': Caller.teamTwo
    };
  });

  void _scrollToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(5.0),
              itemCount: dummyRoundData.length,
              itemBuilder: (context, index) {
                final round = dummyRoundData[index];
                return Padding(
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
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: BigButton(
              text: "DODAJ",
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
              bgColor: AppTheme.green,
              onTap: () {
                context.goNamed("addround");
                /*
                to be used
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollToEnd();
                });*/
              },
              textPadding: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
    )));
  }
}
