import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bela_blok/themes/app_theme.dart';

class ZvanjaHelpDialog {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ZvanjaHelpBottomSheet(),
    );
  }
}

class ZvanjaHelpBottomSheet extends StatelessWidget {
  const ZvanjaHelpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * AppTheme.zvanjaHelpDialogHeightRatio,
      decoration: BoxDecoration(
        color: AppTheme.getZvanjaHelpDialogBackgroundColor(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppTheme.zvanjaHelpDialogBorderRadius)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getOverlayColor(context, opacity: AppTheme.zvanjaHelpDialogShadowOpacity),
            blurRadius: AppTheme.zvanjaHelpDialogShadowBlurRadius,
            offset: AppTheme.zvanjaHelpDialogShadowOffset,
          ),
        ],
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: AppTheme.zvanjaHelpDialogHandleBarMargin,
            width: AppTheme.zvanjaHelpDialogHandleBarWidth,
            height: AppTheme.zvanjaHelpDialogHandleBarHeight,
            decoration: BoxDecoration(
              color: AppTheme.getZvanjaHelpDialogHandleBarColor(),
              borderRadius: BorderRadius.circular(AppTheme.zvanjaHelpDialogHandleBarBorderRadius),
            ),
          ),
          
          // Header
          Padding(
            padding: AppTheme.zvanjaHelpDialogHeaderPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sva moguća zvanja u Belotu',
                  style: AppTheme.zvanjaHelpDialogTitleTextStyle.copyWith(
                    color: AppTheme.getZvanjaHelpDialogTextColor(context),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: AppTheme.getZvanjaHelpDialogTextColor(context),
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                left: AppTheme.zvanjaHelpDialogContentPadding.left,
                right: AppTheme.zvanjaHelpDialogContentPadding.right,
                bottom: MediaQuery.of(context).padding.bottom + AppTheme.zvanjaHelpDialogContentBottomPadding,
              ),
              children: [
                _buildZvanjeCard(
                  context,
                  'Bela',
                  '20 bodova',
                  'Dama i kralj adut boje',
                  null,
                  Colors.red,
                  svgAsset: 'assets/icons/bela.svg',
                ),
                _buildZvanjeCard(
                  context,
                  'Terz',
                  '20 bodova',
                  '3 uzastopne karte iste boje',
                  Icons.looks_3,
                  Colors.blue,
                ),
                _buildZvanjeCard(
                  context,
                  'Kvinta',
                  '50 bodova',
                  '4 uzastopne karte iste boje',
                  Icons.looks_4,
                  Colors.green,
                ),
                _buildZvanjeCard(
                  context,
                  'Kvart',
                  '100 bodova',
                  '5 uzastopnih karata iste boje',
                  Icons.looks_5,
                  Colors.purple,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Dečka',
                  '200 bodova',
                  '4 dečka (svih boja)',
                  Icons.man,
                  Colors.orange,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Devetke',
                  '150 bodova',
                  '4 devetke (svih boja)',
                  null,
                  Colors.teal,
                  svgAsset: 'assets/icons/nine.svg',
                ),
                _buildZvanjeCard(
                  context,
                  '4 Asa',
                  '100 bodova',
                  '4 asa (svih boja)',
                  Icons.star, // fallback ikona
                  Colors.amber,
                  svgAsset: 'assets/icons/four-aces.svg',
                ),
                _buildZvanjeCard(
                  context,
                  '4 Desetke',
                  '100 bodova',
                  '4 desetke (svih boja)',
                  null,
                  Colors.indigo,
                  svgAsset: 'assets/icons/ten.svg',
                ),
                _buildZvanjeCard(
                  context,
                  '4 Kraljice',
                  '100 bodova',
                  '4 kraljice (svih boja)',
                  null,
                  Colors.pink,
                  svgAsset: 'assets/icons/queen.svg',
                ),
                _buildZvanjeCard(
                  context,
                  '4 Kralja',
                  '100 bodova',
                  '4 kralja (svih boja)',
                  null, 
                  Colors.brown,
                  svgAsset: 'assets/icons/king.svg',
                ),
                
                // Napomene
               const SizedBox(height: AppTheme.zvanjaHelpDialogNotesTopSpacing),
                Container(
                  padding: AppTheme.zvanjaHelpDialogNotesPadding,
                  decoration: BoxDecoration(
                    color: AppTheme.getZvanjaHelpDialogNotesBackgroundColor(context),
                    borderRadius: BorderRadius.circular(AppTheme.zvanjaHelpDialogCardBorderRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Napomene:',
                        style: AppTheme.zvanjaHelpDialogNotesHeaderTextStyle.copyWith(
                          color: AppTheme.getZvanjaHelpDialogTextColor(context),
                        ),
                      ),
                     const SizedBox(height: AppTheme.zvanjaHelpDialogNotesTitleSpacing),
                      Text(
                        '• Zvanja se prijavljuju prije početka igre\n'
                        '• Bodove za zvanja dobiva tim koji ima najveće zvanje\n'
                        '• Adut karte imaju prednost kod terz/kvinta/kvart zvanja\n'
                        '• Bela se može prijaviti samo ako se ima i dama i kralj adut boje',
                        style: AppTheme.zvanjaHelpDialogNotesContentTextStyle.copyWith(
                          color: AppTheme.getZvanjaHelpDialogNotesContentColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
              const  SizedBox(height: AppTheme.zvanjaHelpDialogContentBottomPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZvanjeCard(
    BuildContext context,
    String naziv,
    String bodovi,
    String opis,
    IconData? icon,
    Color iconColor, {
    String? svgAsset,
  }) {
    return Container(
      margin: AppTheme.zvanjaHelpDialogCardMargin,
      padding: AppTheme.zvanjaHelpDialogCardPadding,
      decoration: BoxDecoration(
        color: AppTheme.getZvanjaHelpDialogCardBackgroundColor(context),
        borderRadius: BorderRadius.circular(AppTheme.zvanjaHelpDialogCardBorderRadius),
        border: Border.all(
          color: AppTheme.getZvanjaHelpDialogCardBorderColor(context),
          width: AppTheme.zvanjaHelpDialogCardBorderWidth,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: AppTheme.zvanjaHelpDialogIconContainerPadding,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: AppTheme.zvanjaHelpDialogIconOpacity),
              borderRadius: BorderRadius.circular(AppTheme.zvanjaHelpDialogIconContainerBorderRadius),
            ),
            child: svgAsset != null
                ? SvgPicture.asset(
                    svgAsset,
                    width: AppTheme.zvanjaHelpDialogIconSize,
                    height: AppTheme.zvanjaHelpDialogIconSize,
                    // Ako SVG ne može biti učitan, koristi fallback ikonu
                    placeholderBuilder: (context) => Icon(
                      icon ?? Icons.help_outline,
                      color: iconColor,
                      size: AppTheme.zvanjaHelpDialogIconSize,
                    ),
                  )
                : Icon(
                    icon!,
                    color: iconColor,
                    size: AppTheme.zvanjaHelpDialogIconSize,
                  ),
          ),
        const  SizedBox(width: AppTheme.zvanjaHelpDialogContentSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      naziv,
                      style: AppTheme.zvanjaHelpDialogCardTitleTextStyle.copyWith(
                        color: AppTheme.getZvanjaHelpDialogTextColor(context),
                      ),
                    ),
                    Container(
                      padding: AppTheme.zvanjaHelpDialogBadgePadding,
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.circular(AppTheme.zvanjaHelpDialogBadgeBorderRadius),
                      ),
                      child: Text(
                        bodovi,
                        style: AppTheme.zvanjaHelpDialogBadgeTextStyle,
                      ),
                    ),
                  ],
                ),
               const SizedBox(height: AppTheme.zvanjaHelpDialogTitleSpacing),
                Text(
                  opis,
                  style: AppTheme.zvanjaHelpDialogCardDescriptionTextStyle.copyWith(
                    color: AppTheme.getZvanjaHelpDialogDescriptionTextColor(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
