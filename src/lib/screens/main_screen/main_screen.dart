import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/screens/main_screen/widgets/history_list_item.dart';
import 'package:bela_blok/screens/widgets/big_button.dart';
import 'package:bela_blok/services/games_service.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:bela_blok/utils/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late GamesService gamesService;
  List<Game> gamesHistory = [];

  @override
  void initState() {
    super.initState();
    _initGames();
  }

  Future<void> _initGames() async {
    gamesService = await GamesService.create();
    gamesHistory = await gamesService.getAllGames();
    setState(() {}); // Trigger UI rebuild
  }

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
            gamesHistory.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: gamesHistory.length,
                      itemBuilder: (context, index) {
                        final game = gamesHistory[index];

                        return HistoryListItem(
                          gameID: game.id ?? "N/A",
                          date: formatDate(game.createdAt),
                          teamOneScore: game.teamOneScore ?? 0,
                          teamTwoScore: game.teamTwoScore ?? 0,
                          onTap: () {
                            print("Tap: ${game.id}");
                          },
                        );
                      },
                    ),
                  ),
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
                onTap: () async {},
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
                onTap: () async {
                  context.goNamed("newgame");
                },
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
