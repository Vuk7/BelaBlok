
import 'package:flutter/material.dart';

class AppTheme {
  // Boje
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF3DB328);
  static const Color gray = Color(0xFFD9D9D9);
  static const Color darkBackground = Color(0xFF2C3E50);
  static const Color lightBackground = Color(0xFFF5E6D3);
  static const Color screenBackgroundDark = Color(0xFF1E2A38);
  static const Color primary = Color(0xFFFBB117);
  static const Color orange = Color(0xFFFF9500);
  static const Color blue = Color(0xFF2196F3);
  static const Color black = Color(0xFF000000);
  static const Color accent = Colors.amber;
  static const Color brownShadow = Colors.brown;
  static const Color lightScoreBackground = Color(0xFFE8E8E8);

  // Overlay boje (transparentni slojevi)
  static const Color lightOverlay = Color(0x1A000000);
  static const Color mediumOverlay = Color(0x33000000);
  static const Color heavyOverlay = Color(0x66000000);

  // Tematski Data
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 2,
      titleTextStyle: TextStyle(color: black),
    ),
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: primary,
      secondary: black,
      tertiary: Colors.white,
      outline: Color(0xFFE0E0E0),
      outlineVariant: Color(0xFFF5F5F5),
      surfaceContainerHighest: black,
      error: red,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 2,
      titleTextStyle: TextStyle(color: black),
    ),
    colorScheme: const ColorScheme.dark(
      surface: darkBackground,
      primary: primary,
      secondary: Colors.white,
      tertiary: black,
      outline: Color(0xFF424242),
      outlineVariant: Color(0xFF1E1E1E),
      surfaceContainerHighest: Colors.white,
      error: red,
    ),
  );

  // Stilovi teksta
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.bold,
    color: primary,
    letterSpacing: 2,
    shadows: [
      Shadow(
        color: brownShadow,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  );

  static const TextStyle screenTitleTextStyle = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: primary,
  );

  static const TextStyle roundTitleTextStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle sectionHeaderTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle optionButtonTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle manualOptionTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle defaultButtonTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bigButtonText28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle toggleTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle playDirectionLabelTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  // Play Direction Widget Styles
  static const double playDirectionIconContainerSize = 32.0;
  static const double playDirectionIconSize = 20.0;
  static const double playDirectionBorderRadius = 20.0;
  static const double playDirectionSpacingHorizontal = 8.0;
  static const double playDirectionSpacingVertical = 10.0;
  static const Color playDirectionIconColor = Colors.white;

  // Game Type Choice Widget Styles
  static const EdgeInsets gameTypeButtonPadding = EdgeInsets.only(right: 90, left: 90, top: 10, bottom: 10);
  static const EdgeInsets gameTypeButtonPaddingNoTop = EdgeInsets.only(right: 90, left: 90, bottom: 10);
  static const double gameTypeButtonTextPadding = 10.0;
  static const Color gameTypeButtonTextColor = Colors.black;

  static const TextStyle gameTypeNumberButtonTextStyle = TextStyle(
    color: gameTypeButtonTextColor,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle gameTypeManualButtonTextStyle = TextStyle(
    color: gameTypeButtonTextColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  // Game Settings Menu Widget Styles
  static const EdgeInsets gameSettingsMenuMargin = EdgeInsets.symmetric(vertical: 10);
  static const double gameSettingsMenuBorderRadius = 16.0;
  static const EdgeInsets gameSettingsMenuHeaderPadding = EdgeInsets.all(16);
  static const EdgeInsets gameSettingsMenuContentPadding = EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const double gameSettingsMenuIconSize = 28.0;
  static const double gameSettingsMenuIconSpacing = 12.0;
  static const double gameSettingsMenuSectionSpacing = 16.0;
  static const double gameSettingsMenuItemSpacing = 12.0;
  static const double gameSettingsMenuBottomSpacing = 8.0;
  static const Duration gameSettingsMenuAnimationDuration = Duration(milliseconds: 300);
  static const Curve gameSettingsMenuAnimationCurve = Curves.easeInOut;
  static const double gameSettingsMenuShadowBlurRadius = 4.0;
  static const Offset gameSettingsMenuShadowOffset = Offset(0, 2);
  static const double gameSettingsMenuShadowOpacity = 0.1;

  static const TextStyle gameSettingsMenuHeaderTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle gameSettingsMenuSectionTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Animated Play Direction Choice Widget Styles
  static const Duration animatedPlayDirectionAnimationDuration = Duration(milliseconds: 600);
  static const Duration animatedPlayDirectionTapDelay = Duration(milliseconds: 50);
  static const Curve animatedPlayDirectionAnimationCurve = Curves.easeInOut;
  static const double animatedPlayDirectionRotationAngle = 6.28318; // 2 * pi (full rotation)
  static const double animatedPlayDirectionClockwiseRotation = 1.0;
  static const double animatedPlayDirectionCounterClockwiseRotation = -1.0;

  // Animated Button Widget Styles
  static const double animatedButtonScale = 0.95;
  static const Duration animatedButtonAnimationDuration = Duration(milliseconds: 120);
  static const double animatedButtonBorderRadius = 16.0;
  static const double animatedButtonShadowBlurRadius = 10.0;
  static const Offset animatedButtonShadowOffset = Offset(0, 4);
  static const double animatedButtonShadowOpacity = 0.3;
  static const double animatedButtonIconSpacing = 12.0;
  static const double animatedButtonIconSizeMultiplier = 0.8;
  static const double animatedButtonDefaultTextPadding = 20.0;

  // Animated History List Item Widget Styles
  static const Duration animatedHistoryListItemScaleDuration = Duration(milliseconds: 150);
  static const Duration animatedHistoryListItemSlideDuration = Duration(milliseconds: 600);
  static const double animatedHistoryListItemScaleBegin = 1.0;
  static const double animatedHistoryListItemScaleEnd = 0.95;
  static const Offset animatedHistoryListItemSlideBegin = Offset(0.3, 0);
  static const Offset animatedHistoryListItemSlideEnd = Offset.zero;
  static const double animatedHistoryListItemFadeBegin = 0.0;
  static const double animatedHistoryListItemFadeEnd = 1.0;
  static const double animatedHistoryListItemFadeIntervalStart = 0.0;
  static const double animatedHistoryListItemFadeIntervalEnd = 0.8;
  static const int animatedHistoryListItemStaggerDelayMultiplier = 150;
  static const Duration animatedHistoryListItemDefaultDelay = Duration(milliseconds: 100);
  static const Curve animatedHistoryListItemScaleCurve = Curves.easeInOut;
  static const Curve animatedHistoryListItemSlideCurve = Curves.easeOutCubic;
  static const Curve animatedHistoryListItemFadeCurve = Curves.easeOut;

  // Top Score Details Widget Styles
  static const Color topScoreDetailsTeamOneColor = Colors.orange;
  static const Color topScoreDetailsTeamTwoColor = Colors.blue;
  static const EdgeInsets topScoreDetailsPadding = EdgeInsets.symmetric(vertical: 20);
  static const double topScoreDetailsGlowRadius = 30.0;

  // Round Score List Item Widget Styles
  static const Color roundScoreListItemBackgroundColor = Color(0xFFD4B896);
  static const Color roundScoreListItemTextColor = Color(0xFF2C3E50);
  static const Color roundScoreListItemShadowColor = Colors.black;
  static const Color roundScoreListItemInactiveIconColor = Colors.grey;
  static const EdgeInsets roundScoreListItemMargin = EdgeInsets.symmetric(vertical: 6);
  static const EdgeInsets roundScoreListItemPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const double roundScoreListItemBorderRadius = 16.0;
  static const double roundScoreListItemShadowBlurRadius = 4.0;
  static const Offset roundScoreListItemShadowOffset = Offset(0, 2);
  static const double roundScoreListItemShadowOpacity = 0.1;
  static const double roundScoreListItemTopSpacing = 8.0;
  static const double roundScoreListItemIconTextSpacing = 4.0;
  static const double roundScoreListItemArrowSpacing = 6.0;
  static const double roundScoreListItemCenterSpacing = 8.0;
  static const double roundScoreListItemIconSize = 16.0;

  static const TextStyle roundScoreListItemCallTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static const TextStyle roundScoreListItemScoreTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );

  static const TextStyle roundScoreListItemCallAmountTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static const TextStyle roundScoreListItemRoundNumberTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle roundScoreListItemTotalTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  // Help Dialog Widget Styles
  static const Color helpDialogDarkBackgroundColor = Color(0xFF34495E);
  static const Color helpDialogLightBackgroundColor = Colors.white;
  static const Color helpDialogShadowColor = Colors.black;
  static const Color helpDialogHandleBarColor = Colors.grey;
  static const double helpDialogHeightRatio = 0.85;
  static const double helpDialogBorderRadius = 20.0;
  static const double helpDialogCardBorderRadius = 12.0;
  static const double helpDialogIconBorderRadius = 8.0;
  static const double helpDialogBadgeBorderRadius = 12.0;
  static const double helpDialogHandleBarBorderRadius = 2.0;
  static const double helpDialogHandleBarWidth = 40.0;
  static const double helpDialogHandleBarHeight = 4.0;
  static const double helpDialogShadowBlurRadius = 10.0;
  static const Offset helpDialogShadowOffset = Offset(0, -5);
  static const double helpDialogShadowOpacity = 0.1;
  static const double helpDialogIconBackgroundOpacity = 0.1;
  static const double helpDialogIconSize = 24.0;
  static const double helpDialogTextLineHeight = 1.4;
  static const EdgeInsets helpDialogHandleBarMargin = EdgeInsets.only(top: 12);
  static const EdgeInsets helpDialogHeaderPadding = EdgeInsets.all(20);
  static const EdgeInsets helpDialogContentPadding = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets helpDialogCardMargin = EdgeInsets.only(bottom: 12);
  static const EdgeInsets helpDialogCardPadding = EdgeInsets.all(16);
  static const EdgeInsets helpDialogIconPadding = EdgeInsets.all(12);
  static const EdgeInsets helpDialogBadgePadding = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const EdgeInsets helpDialogNotePadding = EdgeInsets.all(16);
  static const double helpDialogSpacing16 = 16.0;
  static const double helpDialogSpacing8 = 8.0;
  static const double helpDialogSpacing4 = 4.0;
  static const double helpDialogSpacing20 = 20.0;

  static const TextStyle helpDialogTitleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle helpDialogCardTitleTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle helpDialogCardDescriptionTextStyle = TextStyle(
    fontSize: 14,
  );

  static const TextStyle helpDialogBadgeTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle helpDialogNoteHeaderTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle helpDialogNoteContentTextStyle = TextStyle(
    fontSize: 14,
  );

  // Top Score Widget Styles
  static const TextStyle topScoreTeamLabelTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );

  static const TextStyle topScoreTeamScoreTextStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 36,
  );

  static const double topScoreVerticalSpacing = 10.0;
  static const double topScoreHorizontalSpacing = 20.0;

  // Falling Arrow Icon Widget Styles
  static const Duration fallingArrowAnimationDuration = Duration(milliseconds: 600);
  static const double fallingArrowShakeBegin = 0.0;
  static const double fallingArrowShakeEnd = 12.0;
  static const Curve fallingArrowAnimationCurve = Curves.elasticIn;
  static const Color fallingArrowIconColor = Colors.red;
  static const double fallingArrowIconSize = 28.0;
  static const IconData fallingArrowIcon = Icons.arrow_downward;

  // Pomoćne metode za boje prema temi
  static Color getScreenBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? screenBackgroundDark
        : lightBackground;
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.surfaceContainerHighest;
  }

  static Color getInverseTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? black : Colors.white;
  }

  static Color getDisabledButtonColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey[700]! : Colors.grey[300]!;
  }

  static Color getCardBackgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey[800]! : Colors.white;
  }

  static Color getOverlayColor(BuildContext context, {double opacity = 0.1}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return (isDark ? Colors.white : black).withValues(alpha: (opacity * 255).toDouble());
  }

  static Color getScoreBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? getCardBackgroundColor(context)
        : lightScoreBackground;
  }

  // Help Dialog Helper Methods
  static Color getHelpDialogBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? helpDialogDarkBackgroundColor 
        : helpDialogLightBackgroundColor;
  }

  static Color getHelpDialogTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? Colors.white 
        : Colors.black87;
  }

  static Color getHelpDialogCardBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? Colors.grey[800]! 
        : Colors.grey[50]!;
  }

  static Color getHelpDialogCardBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? Colors.grey[700]! 
        : Colors.grey[300]!;
  }

  static Color getHelpDialogNoteBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? Colors.grey[800]! 
        : Colors.grey[100]!;
  }

  static Color getHelpDialogNoteTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? Colors.grey[300]! 
        : Colors.grey[700]!;
  }

  static Color getHelpDialogDescriptionTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? Colors.grey[300]! 
        : Colors.grey[600]!;
  }

  static Color getHelpDialogHandleBarColor() {
    return Colors.grey[400]!;
  }

  static Color getHelpDialogShadowColor() {
    return helpDialogShadowColor.withValues(alpha: helpDialogShadowOpacity);
  }
}