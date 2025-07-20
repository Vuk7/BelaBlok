import 'package:bela_blok/screens/new_game_screen/widgets/game_settings_menu.dart';
import 'package:bela_blok/screens/main_screen/widgets/animated_button.dart';
import 'package:bela_blok/screens/widgets/animated_big_button.dart';
import 'package:bela_blok/screens/widgets/player_shuffling.dart';
import 'package:bela_blok/services/games_service.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:bela_blok/enums/play_direction_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({super.key});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  TextEditingController inputGameTypeController = TextEditingController();
  TextEditingController customGameController = TextEditingController();
  int selectedGameType = 0;
  bool isCustomGame = false;

  int playDirectionSelect = 0;
  int playerShufflingSelect = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark 
          ? const Color(0xFF2C3E50) 
          : const Color(0xFFF5E6D3), // boja kože
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 
                      MediaQuery.of(context).padding.top - 
                      MediaQuery.of(context).padding.bottom - 40,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
            Text(
              "NOVA IGRA",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 20),
            // Okviri za 1001 i 501
            Row(
              children: [
                Expanded(
                  child: AnimatedButton(
                    text: "1001",
                    textStyle: TextStyle(
                        color: selectedGameType == 0 ? AppTheme.getInverseTextColor(context) : AppTheme.getTextColor(context),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    bgColor: selectedGameType == 0 ? AppTheme.green : AppTheme.getDisabledButtonColor(context),
                    onTap: () {
                      setState(() {
                        selectedGameType = 0;
                        isCustomGame = false;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: AnimatedButton(
                    text: "501",
                    textStyle: TextStyle(
                        color: selectedGameType == 1 ? AppTheme.getInverseTextColor(context) : AppTheme.getTextColor(context),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    bgColor: selectedGameType == 1 ? AppTheme.green : AppTheme.getDisabledButtonColor(context),
                    onTap: () {
                      setState(() {
                        selectedGameType = 1;
                        isCustomGame = false;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Ručno
            AnimatedButton(
              text: isCustomGame ? "RUČNO (${customGameController.text.isEmpty ? '---' : customGameController.text})" : "RUČNO",
              textStyle: TextStyle(
                  color: isCustomGame ? AppTheme.getInverseTextColor(context) : AppTheme.getTextColor(context),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bgColor: isCustomGame ? AppTheme.green : AppTheme.getDisabledButtonColor(context),
              onTap: () async {
                final result = await _showCustomGameDialog();
                if (result != null && result.isNotEmpty) {
                  setState(() {
                    isCustomGame = true;
                    selectedGameType = 2;
                    customGameController.text = result;
                  });
                }
              },
            ),
            const SizedBox(height: 5),
            // Settings menu
            GameSettingsMenu(
              playDirectionSelect: playDirectionSelect,
              onPlayDirectionChanged: (int id) {
                setState(() {
                  playDirectionSelect = id;
                });
              },
            ),
            const SizedBox(height: 15),
            // Prvi miješa sekcija
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark 
                  ? Colors.grey[800] 
                  : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.style,  // Ikona karata/špila za miješanje karata
                        color: AppTheme.red,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "PRVI MIJEŠA",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  PlayerShuffling(
                    onTap: (int id) {
                      setState(() {
                        playerShufflingSelect = id;
                      });
                    },
                    selectedColor: AppTheme.red,
                    selected: playerShufflingSelect,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), 
            Expanded(child: Container()), 
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedBigButton(
                text: "ZAPOČNI",
                icon: Icons.play_circle_filled,
                iconAnimationType: AnimationType.scale,
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                bgColor: AppTheme.green,
                textPadding: 20,
                onTap: handleCreateNewGame,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
    ))));
  }

  Future<void> handleCreateNewGame() async {
    final gamesService = await GamesService.create();
    int targetScore;
    
    if (selectedGameType == 0) {
      targetScore = 1001;
    } else if (selectedGameType == 1) {
      targetScore = 501;
    } else {
      if (customGameController.text.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Molimo unesite broj za custom igru'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }
      try {
        targetScore = int.parse(customGameController.text);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Molimo unesite valjan broj (samo cifre)'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }
    }
    
    try {
      await gamesService.createNewGameWithParameters(
        gameType: selectedGameType,
        targetScore: targetScore,
        playDirection: playDirectionSelect == 0 ? PlayDirection.clockwise : PlayDirection.counterClockwise,
      );
      
      final currentContext = context;
      if (mounted && currentContext.mounted) {
        currentContext.goNamed("currentgame");
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Greška pri kreiranju igre: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<String?> _showCustomGameDialog() async {
    final TextEditingController dialogController = TextEditingController();
    
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Unesite broj za igru'),
          content: TextField(
            controller: dialogController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Npr. 751',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('ODUSTANI'),
            ),
            TextButton(
              onPressed: () {
                if (dialogController.text.isNotEmpty) {
                  Navigator.of(context).pop(dialogController.text);
                }
              },
              child: const Text('POTVRDI'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    inputGameTypeController.dispose();
    customGameController.dispose();
    super.dispose();
  }
}

class PlayerShuffeling {}
