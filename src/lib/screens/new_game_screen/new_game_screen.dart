import 'package:bela_blok/db/database.dart';
import 'package:bela_blok/db/models/game_model.dart';
import 'package:bela_blok/screens/new_game_screen/widgets/game_settings_menu.dart';
import 'package:bela_blok/screens/main_screen/widgets/animated_button.dart';
import 'package:bela_blok/screens/new_game_screen/widgets/team_wins_reset_section.dart';
import 'package:bela_blok/screens/widgets/animated_big_button.dart';
import 'package:bela_blok/screens/widgets/player_shuffling.dart';
import 'package:bela_blok/services/games_service.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:bela_blok/enums/play_direction_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class NewGameScreen extends StatefulWidget {
  final VoidCallback? updateGamesListCallback;

  const NewGameScreen({super.key, this.updateGamesListCallback});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  late final AppDatabase _db;
  late final GamesService _gamesService;
  final TextEditingController customGameController = TextEditingController();
  int selectedGameType = 0;
  bool isCustomGame = false;
  int playDirectionSelect = 0;
  int playerShufflingSelect = 1;

  late Game? latestGame;

  // Track New Game Team Wins
  int newGameTeamOneWins = 0;
  int newGameTeamTwoWins = 0;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
    _gamesService = GamesService(_db);
    _setDefaultGameSettings();
    _loadLatestGame();
  }

  Future<void> _loadLatestGame() async {
    latestGame = await _gamesService.getLatestGame();

    // Update Team Wins
    if (latestGame != null) {
      setNewGameTeamWins(
          latestGame?.teamOneWins ?? 0, latestGame?.teamTwoWins ?? 0);
    } else {
      setNewGameTeamWins(0, 0);
    }
  }

  Future<void> _setDefaultGameSettings() async {
    int nextShuffler =
        await _gamesService.getNextStartingShuffler(playerCount: 4);
    int previousDirection = await _gamesService.getPreviousGameDirection();

    setState(() {
      playerShufflingSelect = nextShuffler;
      playDirectionSelect = previousDirection;
    });
  }

  Future<int?> getSelectedTargetScore() async {
    if (selectedGameType == 0) return 1001;
    if (selectedGameType == 1) return 501;

    if (customGameController.text.isNotEmpty) {
      return int.tryParse(customGameController.text);
    }
    return null;
  }

  Future<void> handleCreateNewGame() async {
    final targetScore = await getSelectedTargetScore();
    if (targetScore == null) {
      if (isCustomGame && mounted) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            const SnackBar(
              content: Text('Unesite ispravan cilj igre (1 - 10000).'),
              backgroundColor: AppTheme.red,
            ),
          );
      }
      return;
    }
    if (targetScore < 1 || targetScore > 10000) {
      if (mounted) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            const SnackBar(
              content: Text('Cilj igre mora biti između 1 i 10000.'),
              backgroundColor: AppTheme.red,
            ),
          );
      }
      return;
    }

    try {
      latestGame = await _gamesService.createNewGameWithParameters(
        gameType: targetScore,
        playDirection: playDirectionSelect == 0
            ? PlayDirection.clockwise
            : PlayDirection.counterClockwise,
        teamOneWins: newGameTeamOneWins,
        teamTwoWins: newGameTeamTwoWins,
        currentlyShuffling: playerShufflingSelect,
      );

      if (latestGame != null && latestGame?.id != null && mounted) {
        if (widget.updateGamesListCallback != null) {
          widget.updateGamesListCallback!();
        }

        context.goNamed('currentgame',
            queryParameters: {'id': latestGame?.id!},
            extra: widget.updateGamesListCallback);
      } else if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e, stack) {
      debugPrint('Greška pri kreiranju igre: $e\n$stack');
      if (!mounted) return;
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          const SnackBar(
            content: Text('Došlo je do greške. Pokušajte ponovno.'),
            backgroundColor: AppTheme.red,
          ),
        );
    }
  }

  Future<String?> _showCustomGameDialog() async {
    final TextEditingController dialogController = TextEditingController();
    String? errorText;

    void clearError(StateSetter setDialogState) {
      if (errorText != null) {
        setDialogState(() => errorText = null);
      }
    }

    void submitCustomGame(BuildContext ctx, StateSetter setDialogState) {
      final text = dialogController.text.trim();
      if (text.isEmpty) {
        setDialogState(() => errorText = 'Unesite broj.');
        return;
      }
      final value = int.tryParse(text);
      if (value == null) {
        setDialogState(() => errorText = 'Neispravan unos.');
        return;
      }
      if (value < 1) {
        setDialogState(() => errorText = 'Broj mora biti najmanje 1.');
        return;
      }
      if (value > 10000) {
        setDialogState(
            () => errorText = 'Broj ne smije biti veći od 10000.');
        return;
      }
      Navigator.of(ctx).pop(text);
    }

    return showDialog<String>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Unesite cilj igre'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: dialogController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5),
                ],
                decoration: InputDecoration(
                  hintText: 'Npr. 751',
                  border: const OutlineInputBorder(),
                  errorText: errorText,
                ),
                autofocus: true,
                onChanged: (_) => clearError(setDialogState),
              ),
              const SizedBox(height: 8),
              Text(
                'Dozvoljeni raspon: 1 - 10000',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('ODUSTANI'),
            ),
            TextButton(
              onPressed: () => submitCustomGame(ctx, setDialogState),
              child: const Text('POTVRDI'),
            ),
          ],
        ),
      ),
    );
  }

  void setNewGameTeamWins(int teamOneWins, int teamTwoWins) {
    setState(() {
      newGameTeamOneWins = teamOneWins;
      newGameTeamTwoWins = teamTwoWins;
    });
  }

  void resetTeamWinsScore() {
    setNewGameTeamWins(0, 0);
  }

  @override
  void dispose() {
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
                    GameSettingsMenu(
                      playDirectionSelect: playDirectionSelect,
                      onPlayDirectionChanged: (id) =>
                          setState(() => playDirectionSelect = id),
                    ),
                    const SizedBox(height: 15),
                    // Team Wins Score
                    TeamWinsResetSection(
                        teamOneWins: newGameTeamOneWins,
                        teamTwoWins: newGameTeamTwoWins,
                        onTap: resetTeamWinsScore),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.getCardBackgroundColor(context),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color:
                                AppTheme.getOverlayColor(context, opacity: 0),
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
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          PlayerShuffling(
                            selected: playerShufflingSelect,
                            selectedColor: AppTheme.red,
                            onTap: (id) =>
                                setState(() => playerShufflingSelect = id),
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
