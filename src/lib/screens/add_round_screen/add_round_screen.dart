import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/calculated_score_show.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/choose_caller.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/choose_input_type.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/show_lost_text.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/top_score.dart';
import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:bela_blok/screens/widgets/big_button_input_number.dart';
import 'package:bela_blok/screens/widgets/player_shuffling.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddRoundScreen extends StatefulWidget {
  const AddRoundScreen({super.key});

  @override
  State<AddRoundScreen> createState() => _AddRoundScreenState();
}

class _AddRoundScreenState extends State<AddRoundScreen> {
  int selectedCaller = 0;

  TextEditingController inputTeamOne = TextEditingController();
  TextEditingController inputTeamTwo = TextEditingController();

  int selectedInputType = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(children: [
                const TopScore(teamOneScore: 989, teamTwoScore: 900),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "6. RUNDA",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(
                  height: 10,
                ),
                ChooseCaller(
                    selectedChoice: selectedCaller,
                    selectedColor: AppTheme.green,
                    notSelectedColor: Theme.of(context).colorScheme.primary,
                    onTap: (id) {
                      setState(() {
                        selectedCaller = id;
                      });
                    }),
                const SizedBox(
                  height: 30,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BigButtonInputNumber(
                        text: "0",
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        bgColor: Theme.of(context).colorScheme.primary,
                        onTap: () {},
                        inputController: inputTeamOne,
                        textPadding: 10,
                        width: screenWidth / 3,
                      ),
                      BigButtonInputNumber(
                        text: "0",
                        textStyle: const TextStyle(
                            color: AppTheme.green,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        bgColor: Theme.of(context).colorScheme.secondary,
                        onTap: () {},
                        inputController: inputTeamTwo,
                        textPadding: 10,
                        width: screenWidth / 3,
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                ChooseInputType(
                    selectedChoice: selectedInputType,
                    selectedColor: AppTheme.green,
                    notSelectedColor: Theme.of(context).colorScheme.primary,
                    onTap: (id) {
                      setState(() {
                        selectedInputType = id;
                      });
                    },
                    boxWidth: screenWidth / 3),
                const SizedBox(
                  height: 20,
                ),
                const CalculatedScoreShow(teamOneScore: 102, teamTwoScore: 98),
                const ShowLostText(show: true, teamLost: Team.teamTwo),
                const Spacer(),
                Text(
                  "TRENUTNO MIJEŠA",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                PlayerShuffling(
                  onTap: (id) {},
                  selectedColor: Theme.of(context).colorScheme.primary,
                  selected: 2,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: BigButton(
                    text: "SAČUVAJ",
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                    bgColor: AppTheme.green,
                    onTap: () {
                      context.pop();
                    },
                    textPadding: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ]),
            ),
          ),
        ));
  }
}
