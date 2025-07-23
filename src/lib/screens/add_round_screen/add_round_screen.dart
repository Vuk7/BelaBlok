
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

class _AddRoundScreenState extends State<AddRoundScreen> with TickerProviderStateMixin {
  int selectedCaller = 0;
  final TextEditingController inputTeamOne = TextEditingController();
  final TextEditingController inputTeamTwo = TextEditingController();
  int selectedInputType = 0;
  bool showGameScore = true;
  int focusedInput = -1;

  late final AnimationController _bounceController1;
  late final AnimationController _bounceController2;
  late final Animation<double> _bounceAnimation1;
  late final Animation<double> _bounceAnimation2;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  void dispose() {
    _bounceController1.dispose();
    _bounceController2.dispose();
    inputTeamOne.dispose();
    inputTeamTwo.dispose();
    super.dispose();
  }

  bool get isReadyToSave {
    return selectedCaller >= 0 && focusedInput >= 0 &&
        (inputTeamOne.text.isNotEmpty || inputTeamTwo.text.isNotEmpty);
  }


  void handleSaveRound() {
   
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
    setState(() => selectedCaller = id);
  }

  void handleInputTypeChange(int id) {
    setState(() => selectedInputType = id);
  }

  void handleToggleScore() {
    setState(() => showGameScore = !showGameScore);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
              onPressed: () => context.pop(),
              backgroundColor: AppTheme.green,
              isPulsing: isReadyToSave,
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
                      '6. RUNDA',
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
                                Text(
                                  '540',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
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
                              const  Text(
                                  '460',
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
                            onTap: (id) => setState(() => selectedCaller = id),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              2,
                              (i) => AnimatedBuilder(
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ChooseInputType(
                            selectedChoice: selectedInputType,
                            selectedColor: AppTheme.green,
                            notSelectedColor:
                                AppTheme.getDisabledButtonColor(context),
                            onTap: (id) => setState(() => selectedInputType = id),
                            boxWidth: screenWidth / 3,
                          ),
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
                        selectedColor:
                            Theme.of(context).colorScheme.primary,
                        selected: 2,
                      ),
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
}
