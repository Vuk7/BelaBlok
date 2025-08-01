import 'package:bela_blok/screens/add_round_screen/widgets/call_show.dart';
import 'package:bela_blok/db/database.dart'; 
import 'package:bela_blok/db/models/round_model.dart'; 
import 'package:bela_blok/models/score.model.dart';
import 'package:bela_blok/models/fall_score.model.dart';
import 'package:bela_blok/services/games_service.dart'; 
import 'package:bela_blok/services/rounds_service.dart'; 
import 'package:bela_blok/screens/add_round_screen/widgets/choose_caller.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/choose_input_type.dart';
import 'package:bela_blok/screens/widgets/big_button_input_number.dart';
import 'package:bela_blok/screens/widgets/help_dialog.dart';
import 'package:bela_blok/screens/widgets/player_shuffling.dart';
import 'package:bela_blok/screens/widgets/pulsing_fab.dart';
import 'package:bela_blok/screens/current_game_screen/widgets/falling_arrow_icon.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bela_blok/common/constants.dart';
import 'package:bela_blok/enums/call_value_enum.dart';
import 'package:drift/drift.dart' hide Column;



class AddRoundScreen extends StatefulWidget {
  final String? gameId;
  final String? roundId;
  final dynamic roundToEdit; 

  const AddRoundScreen({super.key, this.gameId, this.roundId, this.roundToEdit});

  @override
  State<AddRoundScreen> createState() => _AddRoundScreenState();
}

class _AddRoundScreenState extends State<AddRoundScreen> with TickerProviderStateMixin {
  int? _currentGameType;
  List<CallEntry> _callsTeamOne = [];
  List<CallEntry> _callsTeamTwo = [];
  int selectedCaller = 0;
  final TextEditingController inputTeamOne = TextEditingController();
  final TextEditingController inputTeamTwo = TextEditingController();
  bool _isAutoCompleting = false;
  int selectedInputType = 0;
  int selectedMode = 0; 
  bool showGameScore = true;
  int focusedInput = -1;

  late final AnimationController _bounceController1;
  late final AnimationController _bounceController2;
  late final Animation<double> _bounceAnimation1;
  late final Animation<double> _bounceAnimation2;

  
  late final AppDatabase db;
  late final GamesService gamesService;
  late final RoundsService roundsService;

  int? currentlyShuffling;
  int? gameDirection;
  int totalPlayers = 4; 
  int roundsCount = 0;

  Map<String, dynamic>? _calculatorResult; 

  @override
  void initState() {
    super.initState();
    db = AppDatabase();
    gamesService = GamesService(db);
    roundsService = RoundsService(db);

    _bounceController1 = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _bounceController2 = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _bounceAnimation1 = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _bounceController1, curve: Curves.elasticOut),
    );
    _bounceAnimation2 = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _bounceController2, curve: Curves.elasticOut),
    );

    inputTeamOne.addListener(_handleTeamOneInput);
    inputTeamTwo.addListener(_handleTeamTwoInput);

    if (widget.roundToEdit != null) {
      inputTeamOne.text = (widget.roundToEdit.teamOneScore ?? 0).toString();
      inputTeamTwo.text = (widget.roundToEdit.teamTwoScore ?? 0).toString();
      selectedCaller = widget.roundToEdit.teamCalled ?? 0;

      final t1 = widget.roundToEdit.teamOneCallAmount ?? 0;
      final t2 = widget.roundToEdit.teamTwoCallAmount ?? 0;
      _callsTeamOne = t1 > 0 ? [CallEntry(CallType.z20, (t1 / 20).round())] : [];
      _callsTeamTwo = t2 > 0 ? [CallEntry(CallType.z20, (t2 / 20).round())] : [];

     
      _loadCalculatorResult(widget.roundToEdit.id);
    }

    _loadGameData();
    _loadRoundsCount();
  }

  Future<void> _loadCalculatorResult(String? roundId) async {
    if (roundId == null) return;
    final result = await (db.select(db.calculatorResultTable)
      ..where((tbl) => tbl.roundId.equals(roundId)))
      .getSingleOrNull();
    if (result != null && mounted) {
      setState(() {
        _calculatorResult = {
          'teamOneDeclarations': result.teamOneDeclarations,
          'teamOneDeclarationsSum': result.teamOneDeclarationsSum,
          'teamOneFails': result.teamOneFails,
          'teamTwoDeclarations': result.teamTwoDeclarations,
          'teamTwoDeclarationsSum': result.teamTwoDeclarationsSum,
          'teamTwoFails': result.teamTwoFails,
        };
      });
    }
  }

  Future<void> _loadGameData() async {
    if (widget.gameId != null) {
      final game = await gamesService.getGameById(widget.gameId!);
      if (game != null) {
        setState(() {
          currentlyShuffling = game.currentlyShuffling ?? 1;
          gameDirection = game.gameDirection ?? 0;
          _currentGameType = game.gameType;
        });
      }
    }
  }

  Future<void> _loadRoundsCount() async {
    if (widget.gameId != null) {
      final count = await roundsService.getRoundsForGameCount(widget.gameId!);
      setState(() {
        roundsCount = count;
      });
    }
  }

  @override
  void dispose() {
    _bounceController1.dispose();
    _bounceController2.dispose();
    inputTeamOne.dispose();
    inputTeamTwo.dispose();
    super.dispose();
  }


  String? get isReadyToSaveMessage {
    bool teamOneBelot = _callsTeamOne.any((c) => c.type == SpecialCall.belot);
    bool teamTwoBelot = _callsTeamTwo.any((c) => c.type == SpecialCall.belot);
    if (teamOneBelot || teamTwoBelot) {
     
      return null;
    }
    if (selectedCaller < 0) return 'Odaberite tko je zvao.';
    if (focusedInput < 0) return 'Odaberite unos bodova.';
    if (inputTeamOne.text.isEmpty && inputTeamTwo.text.isEmpty) {
      return 'Unesite bodove za barem jednu ekipu.';
    }
    return null;
  }

  bool get isReadyToSave => isReadyToSaveMessage == null;

  Future<void> handleSaveRound() async {
    try {
      final game = await gamesService.getGameById(widget.gameId!);
      final int gameType = _currentGameType ?? game?.gameType ?? 1001;
      bool teamOneBelot = _callsTeamOne.any((c) => c.type == SpecialCall.belot);
      bool teamTwoBelot = _callsTeamTwo.any((c) => c.type == SpecialCall.belot);

      if (teamOneBelot || teamTwoBelot) {
        await _saveBelotRound(game, gameType, teamOneBelot, teamTwoBelot);
        return;
      }

      final roundData = _prepareRoundData();
      final scores = _calculateScores(roundData);
      await _saveNormalRound(game, scores);
    } catch (e, stack) {
      debugPrint('Greška pri spremanju runde: $e\n$stack');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Došlo je do greške. Pokušajte ponovno.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
  }

  Future<void> _saveBelotRound(dynamic game, int gameType, bool teamOneBelot, bool teamTwoBelot) async {
    int teamOneCallAmount = teamOneBelot ? gameType : 0;
    int teamTwoCallAmount = teamTwoBelot ? gameType : 0;
    final round = widget.roundToEdit ?? Round(gameId: widget.gameId!);
    round.teamCalled = selectedCaller;
    round.teamOneScore = teamOneCallAmount;
    round.teamTwoScore = teamTwoCallAmount;
    round.teamFailed = false;
    round.teamOneCallAmount = teamOneCallAmount;
    round.teamTwoCallAmount = teamTwoCallAmount;
    if (widget.roundToEdit != null) {
      await roundsService.updateRound(round);
    } else {
      await roundsService.createRound(round);
    }
    await _updateGameScores(game);
    if (!mounted) return;
    context.pop();
  }

  ScoreModel _prepareRoundData() {
    int teamOneBase = int.tryParse(inputTeamOne.text) ?? 0;
    int teamTwoBase = int.tryParse(inputTeamTwo.text) ?? 0;
    int teamOneCallAmount = _callsTeamOne.fold(0, (prev, c) => prev + _callValue(c.type) * c.count);
    int teamTwoCallAmount = _callsTeamTwo.fold(0, (prev, c) => prev + _callValue(c.type) * c.count);

    if (teamOneBase == 0 && teamTwoBase > 0) {
      teamTwoBase = 252;
    } else if (teamTwoBase == 0 && teamOneBase > 0) {
      teamOneBase = 252;
    }

    
    return ScoreModel(
      teamOneBase: teamOneBase,
      teamTwoBase: teamTwoBase,
      teamOneCallAmount: teamOneCallAmount,
      teamTwoCallAmount: teamTwoCallAmount,
      teamOneTotal: 0,
      teamTwoTotal: 0,
      teamFailed: false,
    );
  }

  ScoreModel _calculateScores(ScoreModel roundData) {
    int teamOneBase = roundData.teamOneBase;
    int teamTwoBase = roundData.teamTwoBase;
    int teamOneCallAmount = roundData.teamOneCallAmount;
    int teamTwoCallAmount = roundData.teamTwoCallAmount;

    var scores = roundsService.calculateRoundScores(
      teamOneBase: teamOneBase,
      teamTwoBase: teamTwoBase,
      teamOneCallAmount: teamOneCallAmount,
      teamTwoCallAmount: teamTwoCallAmount,
    );
    int teamOneTotal = scores['teamOneTotal']!;
    int teamTwoTotal = scores['teamTwoTotal']!;
    int callerScore = selectedCaller == 0 ? teamOneTotal : teamTwoTotal;
    int otherScore = selectedCaller == 0 ? teamTwoTotal : teamOneTotal;

    bool teamFailed = false;
    if (callerScore <= otherScore || callerScore < 82) {
      int failedTeam = selectedCaller;
      scores = roundsService.calculateRoundScores(
        teamOneBase: teamOneBase,
        teamTwoBase: teamTwoBase,
        teamOneCallAmount: teamOneCallAmount,
        teamTwoCallAmount: teamTwoCallAmount,
        failedTeam: failedTeam,
      );
      teamOneTotal = scores['teamOneTotal']!;
      teamTwoTotal = scores['teamTwoTotal']!;
      teamFailed = true;
    }

    return ScoreModel(
      teamOneBase: teamOneBase,
      teamTwoBase: teamTwoBase,
      teamOneCallAmount: teamOneCallAmount,
      teamTwoCallAmount: teamTwoCallAmount,
      teamOneTotal: teamOneTotal,
      teamTwoTotal: teamTwoTotal,
      teamFailed: teamFailed,
    );
  }

  Future<void> _saveNormalRound(dynamic game, ScoreModel scores) async {
    final round = widget.roundToEdit ?? Round(gameId: widget.gameId!);
    round.teamCalled = selectedCaller;
    round.teamOneScore = scores.teamOneTotal;
    round.teamTwoScore = scores.teamTwoTotal;
    round.teamFailed = scores.teamFailed;
    round.teamOneCallAmount = scores.teamOneCallAmount;
    round.teamTwoCallAmount = scores.teamTwoCallAmount;

    if (widget.roundToEdit != null) {
      await roundsService.updateRound(round);
    } else {
      await roundsService.createRound(round);
    }

    // After saving the round
    if (_calculatorResult != null && round.id != null) {
      await db.into(db.calculatorResultTable).insert(
        CalculatorResultTableCompanion(
          roundId: Value(round.id!),
          teamOneDeclarations: Value(_calculatorResult?['teamOneDeclarations'] ?? 0),
          teamOneDeclarationsSum: Value(_calculatorResult?['teamOneDeclarationsSum'] ?? 0),
          teamOneFails: Value(_calculatorResult?['teamOneFails'] ?? 0),
          teamTwoDeclarations: Value(_calculatorResult?['teamTwoDeclarations'] ?? 0),
          teamTwoDeclarationsSum: Value(_calculatorResult?['teamTwoDeclarationsSum'] ?? 0),
          teamTwoFails: Value(_calculatorResult?['teamTwoFails'] ?? 0),
        ),
      );
    }

    await _updateGameScores(game);
    if (!mounted) return;
    context.pop();
  }

  Future<void> _updateGameScores(dynamic game) async {
    final rounds = await roundsService.getRoundsForGameSorted(widget.gameId!);
    int newScoreTeamOne = 0;
    int newScoreTeamTwo = 0;
    for (final r in rounds) {
      newScoreTeamOne += r.teamOneScore ?? 0;
      newScoreTeamTwo += r.teamTwoScore ?? 0;
    }
    if (game != null) {
      game.teamOneScore = newScoreTeamOne;
      game.teamTwoScore = newScoreTeamTwo;
      await gamesService.updateGame(game);
    }
  }

  void handleHelpDialog() {
    ZvanjaHelpDialog.show(context);
  }

  void handleInputTap(int i) {
    final controller = i == 0 ? _bounceController1 : _bounceController2;
    controller.forward().then((_) => controller.reverse());
    setState(() => focusedInput = i);
  }

  void handleCallerChange(int id) {
    setState(() {
      selectedCaller = id;
       
      focusedInput = id; 
    });
  }

  void handleInputTypeChange(int id) {
    setState(() => selectedInputType = id);
  }

  void handleToggleScore() {
    setState(() => showGameScore = !showGameScore);
  }

  void _handleTeamOneInput() {
    if (_isAutoCompleting) return;
    _isAutoCompleting = true;
    final value = int.tryParse(inputTeamOne.text);
    if (value == null) {
      inputTeamTwo.text = '';
      _isAutoCompleting = false;
      setState(() {});
      return;
    }
    if (value == 0) {
      if (inputTeamTwo.text != '252') {
        inputTeamTwo.text = '252';
      }
      _isAutoCompleting = false;
      setState(() {});
      return;
    }
    if (value > 0 && value <= maxScore) {
      final other = maxScore - value;
      if (inputTeamTwo.text != other.toString()) {
        inputTeamTwo.text = other.toString();
      }
      _isAutoCompleting = false;
      setState(() {});
      return;
    }
    _isAutoCompleting = false;
    setState(() {});
  }

  void _handleTeamTwoInput() {
    if (_isAutoCompleting) return;
    _isAutoCompleting = true;
    final value = int.tryParse(inputTeamTwo.text);
    if (value == null) {
      inputTeamOne.text = '';
      _isAutoCompleting = false;
      setState(() {});
      return;
    }
    if (value == 0) {
      if (inputTeamOne.text != '252') {
        inputTeamOne.text = '252';
      }
      _isAutoCompleting = false;
      setState(() {});
      return;
    }
    if (value > 0 && value <= maxScore) {
      final other = maxScore - value;
      if (inputTeamOne.text != other.toString()) {
        inputTeamOne.text = other.toString();
      }
      _isAutoCompleting = false;
      setState(() {});
      return;
    }
    _isAutoCompleting = false;
    setState(() {});
  }

  
  void handleSaveButtonPressed() {
    final msg = isReadyToSaveMessage;
    if (msg == null) {
      handleSaveRound();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  int _callValue(CallType t) {
    return CallValueEnum.values[t.index].value;
  }

  Future<void> _handleCalculatorButtonPressed() async {
    context.pushNamed(
      'calculator',
      extra: _calculatorResult,
    ).then((result) {
      if (result != null && result is Map) {
        final score = result['score'] as int? ?? 0;
        final team = result['team'] as String? ?? 'mi';
        if (mounted) {
          setState(() {
            if (team == 'mi') {
              inputTeamOne.text = score.toString();
              focusedInput = 0;
            } else {
              inputTeamTwo.text = score.toString();
              focusedInput = 1;
            }
           
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate pad (fall) for UI only using FallScoreModel
    int teamOneVal = int.tryParse(inputTeamOne.text) ?? 0;
    int teamTwoVal = int.tryParse(inputTeamTwo.text) ?? 0;
    int teamOneCallAmount = _callsTeamOne.where((c) => c.type is CallType).fold(0, (prev, c) => prev + _callValue(c.type) * c.count) + (_callsTeamOne.any((c) => c.type == SpecialCall.belot) ? 100 : 0);
    int teamTwoCallAmount = _callsTeamTwo.where((c) => c.type is CallType).fold(0, (prev, c) => prev + _callValue(c.type) * c.count) + (_callsTeamTwo.any((c) => c.type == SpecialCall.belot) ? 100 : 0);
    int allCalls = teamOneCallAmount + teamTwoCallAmount;
    FallScoreModel fallScore = selectedCaller == 0
        ? FallScoreModel(
            teamOneTotal: 0,
            teamTwoTotal: maxScore + allCalls,
            teamOneBase: 0,
            teamTwoBase: maxScore,
            teamOneCallAmount: 0,
            teamTwoCallAmount: allCalls,
            allCalls: allCalls,
          )
        : FallScoreModel(
            teamOneTotal: maxScore + allCalls,
            teamTwoTotal: 0,
            teamOneBase: maxScore,
            teamTwoBase: 0,
            teamOneCallAmount: allCalls,
            teamTwoCallAmount: 0,
            allCalls: allCalls,
          );
    int teamOneTotal = teamOneVal + teamOneCallAmount;
    int teamTwoTotal = teamTwoVal + teamTwoCallAmount;
    int callerScoreUI = selectedCaller == 0 ? teamOneTotal : teamTwoTotal;
    int otherScoreUI = selectedCaller == 0 ? teamTwoTotal : teamOneTotal;
    bool teamFailedUI = (callerScoreUI <= otherScoreUI || callerScoreUI < 82);
    final screenWidth = MediaQuery.of(context).size.width;

    
    String getInputSuffix(int i) {
      final base = i == 0 ? teamOneVal : teamTwoVal;
      final zvanja = i == 0 ? teamOneCallAmount : teamTwoCallAmount;
      final ukupno = base + zvanja;
      if (zvanja > 0) {
        return '=$ukupno';
      } else {
        return '';
      }
    }

    return Scaffold(
      backgroundColor: AppTheme.getScreenBackground(context),
      resizeToAvoidBottomInset: false,
      floatingActionButton: Stack(
        children: [
          Positioned(
            left: 30,
            bottom: 0,
            child: FloatingActionButton(
              heroTag: 'help_btn',
              onPressed: () => ZvanjaHelpDialog.show(context),
              backgroundColor: AppTheme.red,
              child: const Icon(Icons.quiz, color: AppTheme.black, size: 28),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: PulsingFloatingActionButton(
              heroTag: 'save_btn',
              onPressed: handleSaveButtonPressed,
              backgroundColor: AppTheme.green,
              isPulsing: isReadyToSaveMessage == null,
              child: const Icon(Icons.save, color: AppTheme.black, size: 28),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.vertical - 40,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [

                    Text(
                      '${roundsCount + 1}. RUNDA',
                      style: AppTheme.roundTitleTextStyle.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          showGameScore ? Icons.visibility : Icons.visibility_off,
                          size: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: (0.6 * 255).toDouble()),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => setState(() => showGameScore = !showGameScore),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'MI/VI rezultat',
                                  style: AppTheme.toggleTextStyle.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: (0.6 * 255).toDouble()),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  showGameScore
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: (0.6 * 255).toDouble()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (showGameScore) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppTheme.getScoreBackground(context),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'MI',
                                  style: AppTheme.toggleTextStyle.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: (0.6 * 255).toDouble()),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      teamFailedUI ? '${fallScore.teamOneTotal}' : '$teamOneTotal',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                    if ((teamFailedUI ? fallScore.teamOneCallAmount : teamOneCallAmount) > 0)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          '+${teamFailedUI ? fallScore.teamOneCallAmount : teamOneCallAmount}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppTheme.green,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    if (teamFailedUI && selectedCaller == 0)
                                      const Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: FallingArrowIcon(animateOnce: false),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: (0.3 * 255).toDouble()),
                            ),
                            Column(
                              children: [
                                Text(
                                  'VI',
                                  style: AppTheme.toggleTextStyle.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: (0.6 * 255).toDouble()),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      teamFailedUI ? '${fallScore.teamTwoTotal}' : '$teamTwoTotal',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.green,
                                      ),
                                    ),
                                    if ((teamFailedUI ? fallScore.teamTwoCallAmount : teamTwoCallAmount) > 0)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          '+${teamFailedUI ? fallScore.teamTwoCallAmount : teamTwoCallAmount}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppTheme.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    if (teamFailedUI && selectedCaller == 1)
                                      const Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: FallingArrowIcon(animateOnce: false),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    _buildSection(
                      context: context,
                      icon: Icons.record_voice_over,
                      iconColor: AppTheme.green,
                      title: 'TKO JE ZVAO?',
                      child: Column(
                        children: [
                          ChooseCaller(
                            selectedChoice: selectedCaller,
                            selectedColor: AppTheme.green,
                            notSelectedColor: Theme.of(context).colorScheme.primary,
                            onTap: handleCallerChange,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _labelText('MI', selectedCaller == 0, context),
                              _labelText('VI', selectedCaller == 1, context),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    _buildSection(
                      context: context,
                      icon: Icons.edit,
                      iconColor: AppTheme.green,
                      title: 'UNOS BODOVA',
                      child: Column(
                        children: [
                          ChooseInputType(
                            selectedChoice: selectedMode,
                            selectedColor: AppTheme.green,
                            notSelectedColor: AppTheme.getDisabledButtonColor(context),
                            onTap: (id) => setState(() => selectedMode = id),
                            boxWidth: screenWidth / 3,
                          ),
                          const SizedBox(height: 16),
                          if (selectedMode == 0) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                2,
                                (i) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AnimatedBuilder(
                                      animation: i == 0
                                          ? _bounceAnimation1
                                          : _bounceAnimation2,
                                      builder: (_, __) => Transform.scale(
                                        scale: i == 0
                                            ? _bounceAnimation1.value
                                            : _bounceAnimation2.value,
                                        child: BigButtonInputNumber(
                                          text: '0',
                                          textStyle: TextStyle(
                                            color: focusedInput == i
                                                ? AppTheme.getInverseTextColor(context)
                                                : AppTheme.getTextColor(context),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          bgColor: focusedInput == i
                                              ? AppTheme.green
                                              : focusedInput == (1 - i)
                                                  ? AppTheme.red
                                                  : AppTheme.getDisabledButtonColor(context),
                                          onTap: () {
                                            final controller =
                                                i == 0 ? _bounceController1 : _bounceController2;
                                            controller.forward().then((_) => controller.reverse());
                                            setState(() => focusedInput = i);
                                          },
                                          inputController: i == 0
                                              ? inputTeamOne
                                              : inputTeamTwo,
                                          textPadding: 10,
                                          width: screenWidth / 3,
                                         
                                          suffixText: getInputSuffix(i),
                                        ),
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ],
                          if (selectedMode == 1) ...[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CallShowWidget(
                                    teamLabel: 'MI',
                                    color: AppTheme.green,
                                    onChanged: (calls) => setState(() => _callsTeamOne = List.from(calls)),
                                    initialCalls: List<CallEntry>.from(_callsTeamOne),
                                    gameType: _currentGameType ?? 1001,
                                  ),
                                ),
                                const SizedBox(width: 18),
                                Expanded(
                                  child: CallShowWidget(
                                    teamLabel: 'VI',
                                    color: AppTheme.primary,
                                    onChanged: (calls) => setState(() => _callsTeamTwo = List.from(calls)),
                                    initialCalls: List<CallEntry>.from(_callsTeamTwo),
                                    gameType: _currentGameType ?? 1001,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildSection(
                      context: context,
                      icon: Icons.style,
                      iconColor: AppTheme.green,
                      title: 'TRENUTNO MIJEŠA',
                      child: PlayerShuffling(
                        onTap: (_) {},
                        selectedColor: Theme.of(context).colorScheme.primary,
                        selected: getNextShuffler(roundsCount),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.calculate),
                      label: const Text('Pomoć kod izračuna'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.green, 
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _handleCalculatorButtonPressed,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required Widget child,
  }) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
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
                Icon(icon, color: iconColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: AppTheme.sectionHeaderTextStyle.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      );

  Widget _labelText(String text, bool selected, BuildContext context) => Text(
        text,
        style: AppTheme.toggleTextStyle.copyWith(
          color: selected
              ? AppTheme.green
              : Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: (0.6 * 255).toDouble()),
        ),
      );

  int getNextShuffler(int roundCount) {
    if (currentlyShuffling == null || gameDirection == null) return 1;
    return roundsService.getNextShuffler(
      roundCount: roundCount,
      currentlyShuffling: currentlyShuffling!,
      gameDirection: gameDirection!,
      totalPlayers: totalPlayers,
    );
  }
}
