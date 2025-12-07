import 'package:bela_blok/screens/add_round_screen/widgets/call_show.dart';
import 'package:bela_blok/db/database.dart'; 
import 'package:bela_blok/db/models/round_model.dart';
import 'package:bela_blok/db/models/user_settings_model.dart';
import 'package:bela_blok/db/dao/round_dao.dart';
import 'package:bela_blok/models/score.model.dart';
import 'package:bela_blok/models/calculator_result_state.model.dart';
import 'package:bela_blok/services/games_service.dart'; 
import 'package:bela_blok/services/rounds_service.dart';
import 'package:bela_blok/services/settings_services.dart';
import 'package:bela_blok/services/calculator_service.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/choose_caller.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/choose_input_type.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/show_lost_text.dart';
import 'package:bela_blok/enums/team_enum.dart';
import 'package:bela_blok/screens/widgets/big_button_input_number.dart';
import 'package:bela_blok/screens/widgets/help_dialog.dart';
import 'package:bela_blok/screens/widgets/player_shuffling.dart';
import 'package:bela_blok/screens/widgets/pulsing_fab.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bela_blok/common/constants.dart';
import 'package:bela_blok/enums/call_value_enum.dart';


class AddRoundScreen extends StatefulWidget {
  final String? gameId;
  final String? roundId;
  final int? roundIndex; 
  final VoidCallback? updateGamesListCallback;

  const AddRoundScreen(
      {super.key, this.gameId, this.roundId, this.roundIndex, this.updateGamesListCallback});

  @override
  State<AddRoundScreen> createState() => _AddRoundScreenState();
}

class _AddRoundScreenState extends State<AddRoundScreen>
    with TickerProviderStateMixin {
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
  late final SettingsService settingsService;
  UserSettings? settings;

  Round? roundToEdit;
  late final RoundDao roundDao;
  late final CalculatorService calculatorService;

  int? currentlyShuffling;
  int? gameDirection;
  int totalPlayers = 4;
  int roundsCount = 0;
  int currentGameTeamOneScore = 0;
  int currentGameTeamTwoScore = 0;

  CalculatorResultState? _calculatorResult; 

  @override
  void initState() {
    super.initState();
    db = AppDatabase();
    gamesService = GamesService(db);
    roundsService = RoundsService(db);
    settingsService = SettingsService(db);
    roundDao = RoundDao(db);
    calculatorService = CalculatorService(db);

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

    if (widget.roundId != null) {
      _loadRoundToEdit();
    }
   
    _loadGameData();
    _loadRoundsCount();
  }

  Future<void> _loadRoundToEdit() async {
    roundToEdit = await roundsService.getRoundById(widget.roundId!);
    
    if (roundToEdit != null) {
      setState(() {
        inputTeamOne.text = (roundToEdit!.teamOneScore ?? 0).toString();
        inputTeamTwo.text = (roundToEdit!.teamTwoScore ?? 0).toString();
        selectedCaller = roundToEdit!.teamCalled ?? 0;
        focusedInput = selectedCaller;

        _callsTeamOne = [];
        if ((roundToEdit!.us20 ?? 0) > 0) {
          _callsTeamOne.add(CallEntry(CallType.z20, roundToEdit!.us20!));
        }
        if ((roundToEdit!.us50 ?? 0) > 0) {
          _callsTeamOne.add(CallEntry(CallType.z50, roundToEdit!.us50!));
        }
        if ((roundToEdit!.us100 ?? 0) > 0) {
          _callsTeamOne.add(CallEntry(CallType.z100, roundToEdit!.us100!));
        }
        if ((roundToEdit!.us150 ?? 0) > 0) {
          _callsTeamOne.add(CallEntry(CallType.z150, roundToEdit!.us150!));
        }
        if ((roundToEdit!.us200 ?? 0) > 0) {
          _callsTeamOne.add(CallEntry(CallType.z200, roundToEdit!.us200!));
        }
        
        _callsTeamTwo = [];
        if ((roundToEdit!.them20 ?? 0) > 0) {
          _callsTeamTwo.add(CallEntry(CallType.z20, roundToEdit!.them20!));
        }
        if ((roundToEdit!.them50 ?? 0) > 0) {
          _callsTeamTwo.add(CallEntry(CallType.z50, roundToEdit!.them50!));
        }
        if ((roundToEdit!.them100 ?? 0) > 0) {
          _callsTeamTwo.add(CallEntry(CallType.z100, roundToEdit!.them100!));
        }
        if ((roundToEdit!.them150 ?? 0) > 0) {
          _callsTeamTwo.add(CallEntry(CallType.z150, roundToEdit!.them150!));
        }
        if ((roundToEdit!.them200 ?? 0) > 0) {
          _callsTeamTwo.add(CallEntry(CallType.z200, roundToEdit!.them200!));
        }
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
          currentGameTeamOneScore = game.teamOneScore ?? 0;
          currentGameTeamTwoScore = game.teamTwoScore ?? 0;
        });
      }
    }
    
    // Load settings
    settings = await settingsService.fetchSettings();
    setState(() {});
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
    } catch (e) {
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

  void _setRoundCallCounts(Round round, List<CallEntry> teamOneCalls, List<CallEntry> teamTwoCalls) {
    round.us20 = teamOneCalls.where((c) => c.type == CallType.z20).fold<int>(0, (sum, c) => sum + c.count);
    round.us50 = teamOneCalls.where((c) => c.type == CallType.z50).fold<int>(0, (sum, c) => sum + c.count);
    round.us100 = teamOneCalls.where((c) => c.type == CallType.z100).fold<int>(0, (sum, c) => sum + c.count);
    round.us150 = teamOneCalls.where((c) => c.type == CallType.z150).fold<int>(0, (sum, c) => sum + c.count);
    round.us200 = teamOneCalls.where((c) => c.type == CallType.z200).fold<int>(0, (sum, c) => sum + c.count);
    
    round.them20 = teamTwoCalls.where((c) => c.type == CallType.z20).fold<int>(0, (sum, c) => sum + c.count);
    round.them50 = teamTwoCalls.where((c) => c.type == CallType.z50).fold<int>(0, (sum, c) => sum + c.count);
    round.them100 = teamTwoCalls.where((c) => c.type == CallType.z100).fold<int>(0, (sum, c) => sum + c.count);
    round.them150 = teamTwoCalls.where((c) => c.type == CallType.z150).fold<int>(0, (sum, c) => sum + c.count);
    round.them200 = teamTwoCalls.where((c) => c.type == CallType.z200).fold<int>(0, (sum, c) => sum + c.count);
  }

  Future<void> _saveBelotRound(
      dynamic game, int gameType, bool teamOneBelot, bool teamTwoBelot) async {
    int teamOneCallAmount = teamOneBelot ? gameType : 0;
    int teamTwoCallAmount = teamTwoBelot ? gameType : 0;
    final round = roundToEdit ?? Round(gameId: widget.gameId!);
    round.teamCalled = selectedCaller;
    round.teamOneScore = int.tryParse(inputTeamOne.text) ?? 0;
    round.teamTwoScore = int.tryParse(inputTeamTwo.text) ?? 0;
    round.teamFailed = false;
    round.teamOneCallAmount = teamOneCallAmount;
    round.teamTwoCallAmount = teamTwoCallAmount;
    
    _setRoundCallCounts(round, _callsTeamOne, _callsTeamTwo);

    if (roundToEdit != null) {
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
    int teamOneCallAmount =
        _callsTeamOne.fold(0, (prev, c) => prev + _callValue(c.type) * c.count);
    int teamTwoCallAmount =
        _callsTeamTwo.fold(0, (prev, c) => prev + _callValue(c.type) * c.count);

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

    bool isStihak = teamOneBase == 252 || teamTwoBase == 252;

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
    if (!isStihak && (callerScore <= otherScore || callerScore < 82)) {
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
    final Round round;
    
    if (roundToEdit != null) {
      round = roundToEdit!;
    } else {
      round = Round(gameId: widget.gameId!);
    }
    
    round.teamCalled = selectedCaller;
    round.teamOneScore = scores.teamOneBase;
    round.teamTwoScore = scores.teamTwoBase;
    round.teamFailed = scores.teamFailed;
    round.teamOneCallAmount = scores.teamOneCallAmount;
    round.teamTwoCallAmount = scores.teamTwoCallAmount;
    
    _setRoundCallCounts(round, _callsTeamOne, _callsTeamTwo);

    String? actualRoundId;
    if (roundToEdit != null) {
      await roundsService.updateRound(round);
      actualRoundId = round.id; 
    } else {
      actualRoundId = await roundsService.createRound(round); 
    }

   if (_calculatorResult != null && actualRoundId != null) {
      await calculatorService.saveOrUpdateCalculatorResult(
        actualRoundId,
        _calculatorResult!,
        roundToEdit != null,
      );
    }

    await _updateGameScores(game);
    if (!mounted) return;

    refreshMainScreenListOfGames();

    context.pop();
  }

  Future<void> _updateGameScores(dynamic game) async {
    final rounds = await roundsService.getRoundsForGameSorted(widget.gameId!);
    int newScoreTeamOne = 0;
    int newScoreTeamTwo = 0;
    for (final r in rounds) {
      final baseOne = r.teamOneScore ?? 0;
      final baseTwo = r.teamTwoScore ?? 0;
      final callsOne = r.teamOneCallAmount ?? 0;
      final callsTwo = r.teamTwoCallAmount ?? 0;
      final failedTeam = (r.teamFailed ?? false) ? r.teamCalled : null;
      final computed = roundsService.calculateRoundScores(
        teamOneBase: baseOne,
        teamTwoBase: baseTwo,
        teamOneCallAmount: callsOne,
        teamTwoCallAmount: callsTwo,
        failedTeam: failedTeam,
      );
      newScoreTeamOne += computed['teamOneTotal'] ?? 0;
      newScoreTeamTwo += computed['teamTwoTotal'] ?? 0;
    }
    if (game != null) {
      game.teamOneScore = newScoreTeamOne;
      game.teamTwoScore = newScoreTeamTwo;

      // Check if game is finished and mark it as such
      final int gameTargetScore = game.gameType ?? 1001;
      if (newScoreTeamOne >= gameTargetScore ||
          newScoreTeamTwo >= gameTargetScore) {
        game.finished = true;
        game.winner = newScoreTeamOne >= gameTargetScore ? 0 : 1;
      }

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
    if (value == 252) {
      if (inputTeamTwo.text != '0') {
        inputTeamTwo.text = '0';
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
    if (value == 252) {
      if (inputTeamOne.text != '0') {
        inputTeamOne.text = '0';
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

  refreshMainScreenListOfGames() {
    if (widget.updateGamesListCallback != null) {
      widget.updateGamesListCallback!();
    }
  }

  Future<void> _handleCalculatorButtonPressed() async {
    Map<String, dynamic>? initialData;
    
    if (roundToEdit != null && roundToEdit!.id != null) {
      final result = await calculatorService.getCalculatorResultByRoundId(roundToEdit!.id!);
      if (result != null) {
        initialData = CalculatorResultState.fromCalculatorResult(result).toMap();
      }
    }
    
    if (!mounted) return;
    
    context.pushNamed(
      'calculator',
      extra: initialData,
    ).then((result) {
      if (result != null && result is Map) {
        setState(() {
          _calculatorResult = CalculatorResultState.fromMap(Map<String, dynamic>.from(result));
        });
        
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
    int teamOneVal = int.tryParse(inputTeamOne.text) ?? 0;
    int teamTwoVal = int.tryParse(inputTeamTwo.text) ?? 0;
    int teamOneCallAmount = _callsTeamOne
            .where((c) => c.type is CallType)
            .fold(0, (prev, c) => prev + _callValue(c.type) * c.count) +
        (_callsTeamOne.any((c) => c.type == SpecialCall.belot) ? 100 : 0);
    int teamTwoCallAmount = _callsTeamTwo
            .where((c) => c.type is CallType)
            .fold(0, (prev, c) => prev + _callValue(c.type) * c.count) +
        (_callsTeamTwo.any((c) => c.type == SpecialCall.belot) ? 100 : 0);
    final screenWidth = MediaQuery.of(context).size.width;

    // Provjera za stihak
    bool isStihak = teamOneVal == 252 || teamTwoVal == 252;
    bool showStihak = isStihak && (teamOneVal > 0 || teamTwoVal > 0);
    Team? stihakTeam = isStihak ? (teamOneVal == 252 ? Team.teamOne : Team.teamTwo) : null;

    // Provjera za pad
    int teamOneTotal = teamOneVal + teamOneCallAmount;
    int teamTwoTotal = teamTwoVal + teamTwoCallAmount;
    int callerScore = selectedCaller == 0 ? teamOneTotal : teamTwoTotal;
    int otherScore = selectedCaller == 0 ? teamTwoTotal : teamOneTotal;
    bool showFall = !isStihak && selectedCaller >= 0 && 
                    (teamOneVal > 0 || teamTwoVal > 0) &&
                    (callerScore <= otherScore || callerScore < 82);
    Team? fallTeam = showFall ? (selectedCaller == 0 ? Team.teamOne : Team.teamTwo) : null;

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
          // Conditionally show help button based on settings
          if (settings?.showHelpDialog == true)
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
                    MediaQuery.of(context).padding.vertical -
                    40,
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
                          showGameScore
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: (0.6 * 255).toDouble()),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () =>
                              setState(() => showGameScore = !showGameScore),
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
                                        .withValues(
                                            alpha: (0.6 * 255).toDouble()),
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
                                      .withValues(
                                          alpha: (0.6 * 255).toDouble()),
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
                                        .withValues(
                                            alpha: (0.6 * 255).toDouble()),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '$currentGameTeamOneScore',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
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
                                        .withValues(
                                            alpha: (0.6 * 255).toDouble()),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '$currentGameTeamTwoScore',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.green,
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
                            notSelectedColor:
                                Theme.of(context).colorScheme.primary,
                            onTap: handleCallerChange,
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
                            notSelectedColor:
                                AppTheme.getDisabledButtonColor(context),
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
                                                ? AppTheme.getInverseTextColor(
                                                    context)
                                                : AppTheme.getTextColor(
                                                    context),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          bgColor: focusedInput == i
                                              ? AppTheme.green
                                              : focusedInput == (1 - i)
                                                  ? AppTheme.red
                                                  : AppTheme
                                                      .getDisabledButtonColor(
                                                          context),
                                          onTap: () {
                                            final controller = i == 0
                                                ? _bounceController1
                                                : _bounceController2;
                                            controller.forward().then(
                                                (_) => controller.reverse());
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
                                    onChanged: (calls) => setState(
                                        () => _callsTeamOne = List.from(calls)),
                                    initialCalls:
                                        List<CallEntry>.from(_callsTeamOne),
                                    gameType: _currentGameType ?? 1001,
                                  ),
                                ),
                                const SizedBox(width: 18),
                                Expanded(
                                  child: CallShowWidget(
                                    teamLabel: 'VI',
                                    color: AppTheme.primary,
                                    onChanged: (calls) => setState(
                                        () => _callsTeamTwo = List.from(calls)),
                                    initialCalls:
                                        List<CallEntry>.from(_callsTeamTwo),
                                    gameType: _currentGameType ?? 1001,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    // Prikaz stihak ili pad animacije
                    if (showStihak && stihakTeam != null)
                      ShowLostText(
                        show: true,
                        teamLost: stihakTeam,
                        isStihak: true,
                      ),
                    if (showFall && fallTeam != null && !showStihak)
                      ShowLostText(
                        show: true,
                        teamLost: fallTeam,
                        isStihak: false,
                      ),
                    const SizedBox(height: 30),
                    _buildSection(
                      context: context,
                      icon: Icons.style,
                      iconColor: AppTheme.green,
                      title: 'TRENUTNO MIJEŠA',
                      child: FutureBuilder<int>(
                        future: _computeShufflerToShow(),
                        builder: (context, snapshot) {
                          final shuffler =
                              snapshot.data ?? (currentlyShuffling ?? 1);
                          return PlayerShuffling(
                            onTap: (_) {},
                            selectedColor:
                                Theme.of(context).colorScheme.primary,
                            selected: shuffler,
                          );
                        },
                      ),
                    ),
                    if (settings?.showSmartCalculator == true)
                      const SizedBox(height: 16),
                    if (settings?.showSmartCalculator == true)
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
  }) =>
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppTheme.getCardBackgroundColor(context),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppTheme.getOverlayColor(context, opacity: 0),
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

  Future<int> _computeShufflerToShow() async {
    if (currentlyShuffling == null ||
        gameDirection == null) {
      return 1;
    }
    
    final index = widget.roundIndex ?? 0;
    
    return roundsService.computeShuffler(
      firstShuffler: currentlyShuffling!,
      index: index,
      gameDirection: gameDirection!,
      totalPlayers: totalPlayers,
    );
  }
}
