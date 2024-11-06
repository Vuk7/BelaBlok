import 'package:bela_blok/routes/routes.dart';
import 'package:bela_blok/screens/new_game_screen/widgets/game_type_choice.dart';
import 'package:bela_blok/screens/new_game_screen/widgets/play_direction_choice.dart';
import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:bela_blok/screens/widgets/player_shuffling.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({super.key});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  TextEditingController inputGameTypeController = TextEditingController();
  int selectedGameType = 0;

  int playDirectionSelect = 0;
  int playerShufflingSelect = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Text(
              "NOVA IGRA",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            GameTypeChoice(
              inputGameTypeController: inputGameTypeController,
              selectedChoice: selectedGameType,
              selectedColor: AppTheme.green,
              notSelectedColor: Theme.of(context).colorScheme.primary,
              onTap: (int id) {
                setState(() {
                  selectedGameType = id;
                });
              },
            ),
            Text(
              "SMJER",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(
              height: 10,
            ),
            PlayDirectionChoice(
              selectedChoice: playDirectionSelect,
              selectedColor: AppTheme.green,
              notSelectedColor: Theme.of(context).colorScheme.secondary,
              onTap: (int id) {
                setState(() {
                  playDirectionSelect = id;
                });
              },
            ),
            const Spacer(),
            Text(
              "PRVI MIJEŠA",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(
              height: 10,
            ),
            PlayerShuffling(
              onTap: (int id) {
                setState(() {
                  playerShufflingSelect = id;
                });
              },
              selectedColor: AppTheme.red,
              selected: playerShufflingSelect,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: BigButton(
                text: "ZAPOČNI",
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
                bgColor: AppTheme.green,
                onTap: () {
                  context.goNamed("currentgame");
                },
                textPadding: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    )));
  }

  @override
  void dispose() {
    inputGameTypeController.dispose();
    super.dispose();
  }
}

class PlayerShuffeling {}
