import 'package:bela_blok/screens/main_screen/widgets/history_list_item.dart';
import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              "BELA BLOK",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Povijest:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            HistoryListItem(
                gameID: 0,
                date: "21.10.2024 19:44",
                teamOneScore: 1030,
                teamTwoScore: 560,
                onTap: () {}),
            HistoryListItem(
                gameID: 0,
                date: "21.10.2024 19:44",
                teamOneScore: 1030,
                teamTwoScore: 560,
                onTap: () {}),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: BigButton(
                text: "NASTAVI",
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
                bgColor: AppTheme.red,
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: BigButton(
                text: "NOVA IGRA",
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
                bgColor: AppTheme.green,
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    )));
  }
}
