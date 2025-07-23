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
  final TextEditingController customGameController = TextEditingController();
  int selectedGameType = 0;
  bool isCustomGame = false;
  int playDirectionSelect = 0;
  int playerShufflingSelect = 1;



  Future<int?> getSelectedTargetScore() async {
    if (selectedGameType == 0) return 1001;
    if (selectedGameType == 1) return 501;

    if (customGameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Molimo unesite broj za custom igru'),
          backgroundColor: AppTheme.red,
        ),
      );
      return null;
    }
    try {
      return int.parse(customGameController.text);
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Molimo unesite valjan broj (samo cifre)'),
          backgroundColor: AppTheme.red,
        ),
      );
      return null;
    }
  }

  Future<void> handleCreateNewGame() async {
    final targetScore = await getSelectedTargetScore();
    if (targetScore == null) return;

    final gamesService = await GamesService.create();
    try {
      await gamesService.createNewGameWithParameters(
        gameType: selectedGameType,
        targetScore: targetScore,
        playDirection: playDirectionSelect == 0
            ? PlayDirection.clockwise
            : PlayDirection.counterClockwise,
      );
      // Dohvati najnoviju igru i pošalji ID na currentgame screen
      final latestGame = await gamesService.getLatestGame();
      if (latestGame != null && latestGame.id != null && mounted) {
        context.goNamed('currentgame', queryParameters: {'id': latestGame.id});
      } else if (mounted) {
        Navigator.of(context).pop(); 
      }
    } catch (e, stack) {
      debugPrint('Greška pri kreiranju igre: $e\n$stack');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Došlo je do greške. Pokušajte ponovno.'),
          backgroundColor: AppTheme.red,
        ),
      );
    }
  }

  Future<String?> _showCustomGameDialog() async {
    final TextEditingController dialogController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
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
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('ODUSTANI'),
          ),
          TextButton(
            onPressed: () {
              if (dialogController.text.isNotEmpty) {
                Navigator.of(ctx).pop(dialogController.text);
              }
            },
            child: const Text('POTVRDI'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    customGameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bg = AppTheme.getScreenBackground(context);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom -
                    40,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                   const Text(
                      'NOVA IGRA',
                      style: AppTheme.screenTitleTextStyle,
                    ),
                    const SizedBox(height: 20),
                    // Okviri za 1001 i 501
                    Row(
                      children: [
                        Expanded(
                          child: AnimatedButton(
                            text: '1001',
                            textStyle: AppTheme.optionButtonTextStyle.copyWith(
                              color: selectedGameType == 0
                                  ? AppTheme.getInverseTextColor(context)
                                  : AppTheme.getTextColor(context),
                            ),
                            bgColor: selectedGameType == 0
                                ? AppTheme.green
                                : AppTheme.getDisabledButtonColor(context),
                            onTap: () => setState(() {
                              selectedGameType = 0;
                              isCustomGame = false;
                            }),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: AnimatedButton(
                            text: '501',
                            textStyle: AppTheme.optionButtonTextStyle.copyWith(
                              color: selectedGameType == 1
                                  ? AppTheme.getInverseTextColor(context)
                                  : AppTheme.getTextColor(context),
                            ),
                            bgColor: selectedGameType == 1
                                ? AppTheme.green
                                : AppTheme.getDisabledButtonColor(context),
                            onTap: () => setState(() {
                              selectedGameType = 1;
                              isCustomGame = false;
                            }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Ručno
                    AnimatedButton(
                      text: isCustomGame
                          ? "RUČNO (${customGameController.text.isEmpty ? '---' : customGameController.text})"
                          : "RUČNO",
                      textStyle: AppTheme.manualOptionTextStyle.copyWith(
                        color: isCustomGame
                            ? AppTheme.getInverseTextColor(context)
                            : AppTheme.getTextColor(context),
                      ),
                      bgColor: isCustomGame
                          ? AppTheme.green
                          : AppTheme.getDisabledButtonColor(context),
                      onTap: () async {
                        final result = await _showCustomGameDialog();
                        if (result != null && result.isNotEmpty) {
                          setState(() {
                            isCustomGame = true;
                            customGameController.text = result;
                            selectedGameType = 2;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 5),
                    // Settings menu
                    GameSettingsMenu(
                      playDirectionSelect: playDirectionSelect,
                      onPlayDirectionChanged: (id) =>
                          setState(() => playDirectionSelect = id),
                    ),
                    const SizedBox(height: 15),
                    // Prvi miješa sekcija
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.getCardBackgroundColor(context),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.getOverlayColor(context, opacity: 0.1),
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
                                Icons.style,
                                color: AppTheme.red,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'PRVI MIJEŠA',
                                style: AppTheme.sectionHeaderTextStyle.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          PlayerShuffling(
                            selected: playerShufflingSelect,
                            selectedColor: AppTheme.red,
                            onTap: (id) => setState(() => playerShufflingSelect = id),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AnimatedBigButton(
                        text: 'ZAPOČNI',
                        icon: Icons.play_circle_filled,
                        iconAnimationType: AnimationType.scale,
                        textStyle: AppTheme.bigButtonText28.copyWith(
                          color: AppTheme.getInverseTextColor(context),
                        ),
                        bgColor: AppTheme.green,
                        textPadding: 20,
                        onTap: handleCreateNewGame,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
