import 'package:bela_blok/enums/caller_enum.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/round_score_list_item.dart';
import 'package:flutter/material.dart';

class CurrentGameScreen extends StatefulWidget {
  const CurrentGameScreen({super.key});

  @override
  State<CurrentGameScreen> createState() => _CurrentGameScreenState();
}

class _CurrentGameScreenState extends State<CurrentGameScreen> {
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
          Row(
            children: [
              const Spacer(),
              Text(
                "MI",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 36),
              ),
              const Spacer(),
              Text(
                "VI",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 36),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                "1001",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 36),
              ),
              const Spacer(),
              Text(
                "1001",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 36),
              ),
              const SizedBox(
                height: 10,
              ),
              const Spacer(),
            ],
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
