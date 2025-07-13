import 'package:bela_blok/screens/add_round_screen/widgets/choose_caller.dart';
import 'package:bela_blok/screens/add_round_screen/widgets/choose_input_type.dart';
import 'package:bela_blok/screens/widgets/big_button_input_number.dart';
import 'package:bela_blok/screens/widgets/help_dialog.dart';
import 'package:bela_blok/screens/widgets/player_shuffling.dart';
import 'package:bela_blok/screens/widgets/pulsing_fab.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddRoundScreen extends StatefulWidget {
  const AddRoundScreen({super.key});

  @override
  State<AddRoundScreen> createState() => _AddRoundScreenState();
}

class _AddRoundScreenState extends State<AddRoundScreen> 
    with TickerProviderStateMixin {
  int selectedCaller = 0;

  TextEditingController inputTeamOne = TextEditingController();
  TextEditingController inputTeamTwo = TextEditingController();

  int selectedInputType = 0;
  bool showGameScore = true; // Nova varijabla za kontrolu prikaza rezultata
  int focusedInput = -1; // -1 = nema fokusa, 0 = prvi input, 1 = drugi input

  // Animation controllers
  late AnimationController _bounceController1;
  late AnimationController _bounceController2;
  late Animation<double> _bounceAnimation1;
  late Animation<double> _bounceAnimation2;

  @override
  void initState() {
    super.initState();
    
    // Initialize bounce animations
    _bounceController1 = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _bounceController2 = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _bounceAnimation1 = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _bounceController1,
      curve: Curves.elasticOut,
    ));
    
    _bounceAnimation2 = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _bounceController2,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _bounceController1.dispose();
    _bounceController2.dispose();
    super.dispose();
  }

  // Check if all required data is filled for save button pulsing
  bool get isReadyToSave {
    return selectedCaller >= 0 && 
           focusedInput >= 0 && 
           (inputTeamOne.text.isNotEmpty || inputTeamTwo.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark 
          ? const Color(0xFF1e2a38) 
          : const Color(0xFFF5E6D3), // boja kože
        resizeToAvoidBottomInset: false,
        floatingActionButton: Stack(
          children: [
            // Help button u lijevom kutu
            Positioned(
              left: 30,
              bottom: 0,
              child: FloatingActionButton(
                heroTag: "help_btn",
                onPressed: () {
                  ZvanjaHelpDialog.show(context);
                },
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.quiz,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            // Save button u desnom kutu (default pozicija)
            Positioned(
              right: 0,
              bottom: 0,
              child: PulsingFloatingActionButton(
                heroTag: "save_btn",
                onPressed: () {
                  context.pop();
                },
                backgroundColor: AppTheme.green,
                isPulsing: isReadyToSave,
                child: const Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 28,
                ),
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
                            MediaQuery.of(context).padding.top - 
                            MediaQuery.of(context).padding.bottom - 40,
                ),
                child: IntrinsicHeight(
                  child: Column(children: [
                Text(
                  "6. RUNDA",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(height: 8),
                // Dropdown za prikaz rezultata
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      showGameScore ? Icons.visibility : Icons.visibility_off,
                      size: 16,
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showGameScore = !showGameScore;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              showGameScore ? "MI/VI rezultat" : "MI/VI rezultat",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              showGameScore ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              size: 16,
                              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Prikaz rezultata igre (kondicionalno)
                if (showGameScore) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark 
                        ? Colors.grey[850] 
                        : const Color(0xFFE8E8E8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "MI",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                              ),
                            ),
                            Text(
                              "540", // Primjer rezultata - kasnije povezati s pravim podacima
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
                        ),
                        Column(
                          children: [
                            Text(
                              "VI",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                              ),
                            ),
                            Text(
                              "460", // Primjer rezultata - kasnije povezati s pravim podacima
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(
                  height: 20,
                ),
                // Izbor tko zove - u okviru
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
                        color: Colors.black.withOpacity(0.1),
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
                          Icon(
                            Icons.record_voice_over,  // Ikona čovjeka koji govori
                            color: AppTheme.green,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "TKO JE ZVAO?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ChooseCaller(
                          selectedChoice: selectedCaller,
                          selectedColor: AppTheme.green,
                          notSelectedColor: Theme.of(context).colorScheme.primary,
                          onTap: (id) {
                            setState(() {
                              selectedCaller = id;
                            });
                          }),
                      const SizedBox(height: 8),
                      // Oznake MI i VI
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            "MI",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: selectedCaller == 0 
                                ? AppTheme.green 
                                : Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(width: 20),
                          const Spacer(),
                          Text(
                            "VI",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: selectedCaller == 1 
                                ? AppTheme.green 
                                : Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Unos bodova - u okviru
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
                        color: Colors.black.withOpacity(0.1),
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
                          Icon(
                            Icons.edit,  // Ikona za unos/editiranje
                            color: AppTheme.green,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "UNOS BODOVA",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AnimatedBuilder(
                              animation: _bounceAnimation1,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _bounceAnimation1.value,
                                  child: BigButtonInputNumber(
                                    text: "0",
                                    textStyle: TextStyle(
                                        color: focusedInput == 0 ? Colors.white : Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    bgColor: focusedInput == 0 
                                      ? AppTheme.green 
                                      : (focusedInput == 1 
                                        ? Colors.red 
                                        : (Theme.of(context).brightness == Brightness.dark 
                                          ? Colors.grey[700]! 
                                          : const Color(0xFFE0E0E0))),
                                    onTap: () {
                                      _bounceController1.forward().then((_) {
                                        _bounceController1.reverse();
                                      });
                                      setState(() {
                                        focusedInput = 0;
                                      });
                                    },
                                    inputController: inputTeamOne,
                                    textPadding: 10,
                                    width: screenWidth / 3,
                                  ),
                                );
                              },
                            ),
                            AnimatedBuilder(
                              animation: _bounceAnimation2,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _bounceAnimation2.value,
                                  child: BigButtonInputNumber(
                                    text: "0",
                                    textStyle: TextStyle(
                                        color: focusedInput == 1 ? Colors.white : Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    bgColor: focusedInput == 1 
                                      ? AppTheme.green 
                                      : (focusedInput == 0 
                                        ? Colors.red 
                                        : (Theme.of(context).brightness == Brightness.dark 
                                          ? Colors.grey[700]! 
                                          : const Color(0xFFE0E0E0))),
                                    onTap: () {
                                      _bounceController2.forward().then((_) {
                                        _bounceController2.reverse();
                                      });
                                      setState(() {
                                        focusedInput = 1;
                                      });
                                    },
                                    inputController: inputTeamTwo,
                                    textPadding: 10,
                                    width: screenWidth / 3,
                                  ),
                                );
                              },
                            ),
                          ]),
                      const SizedBox(height: 16),
                      ChooseInputType(
                          selectedChoice: selectedInputType,
                          selectedColor: AppTheme.green, // Nije više potrebno, ali zadržavam zbog kompatibilnosti
                          notSelectedColor: Theme.of(context).brightness == Brightness.dark 
                            ? Colors.grey[700]! 
                            : const Color(0xFFE0E0E0),
                          onTap: (id) {
                            setState(() {
                              selectedInputType = id;
                            });
                          },
                          boxWidth: screenWidth / 3),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Direktno prelazimo na "TRENUTNO MIJEŠA" jer se rezultat automatski izračunava
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
                        color: Colors.black.withOpacity(0.1),
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
                          Icon(
                            Icons.style,  // Ikona karata/špila
                            color: AppTheme.green,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "TRENUTNO MIJEŠA",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onBackground),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      PlayerShuffling(
                        onTap: (id) {},
                        selectedColor: Theme.of(context).colorScheme.primary,
                        selected: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ]),
            ),
          ),
        ))));
  }
}
