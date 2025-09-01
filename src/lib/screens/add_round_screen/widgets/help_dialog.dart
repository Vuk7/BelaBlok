import 'package:flutter/material.dart';
import '../../../themes/app_theme.dart';

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
      height: MediaQuery.of(context).size.height * AppTheme.helpDialogHeightRatio,
      decoration: BoxDecoration(
        color: AppTheme.getHelpDialogBackgroundColor(context),
        borderRadius:const BorderRadius.vertical(top: Radius.circular(AppTheme.helpDialogBorderRadius)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getHelpDialogShadowColor(),
            blurRadius: AppTheme.helpDialogShadowBlurRadius,
            offset: AppTheme.helpDialogShadowOffset,
          ),
        ],
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: AppTheme.helpDialogHandleBarMargin,
            width: AppTheme.helpDialogHandleBarWidth,
            height: AppTheme.helpDialogHandleBarHeight,
            decoration: BoxDecoration(
              color: AppTheme.getHelpDialogHandleBarColor(),
              borderRadius: BorderRadius.circular(AppTheme.helpDialogHandleBarBorderRadius),
            ),
          ),
          
          // Header
          Padding(
            padding: AppTheme.helpDialogHeaderPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sva moguća zvanja u Belotu',
                  style: AppTheme.helpDialogTitleTextStyle.copyWith(
                    color: AppTheme.getHelpDialogTextColor(context),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: AppTheme.getHelpDialogTextColor(context),
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Expanded(
            child: ListView(
              padding: AppTheme.helpDialogContentPadding,
              children: [
                _buildZvanjeCard(
                  context,
                  'Bela',
                  '20 bodova',
                  'Dama i kralj adut boje',
                  Icons.favorite,
                  Colors.red,
                ),
                _buildZvanjeCard(
                  context,
                  'Terz',
                  '20 bodova',
                  '3 uzastopne karte iste boje',
                  Icons.view_stream,
                  Colors.blue,
                ),
                _buildZvanjeCard(
                  context,
                  'Kvinta',
                  '50 bodova',
                  '4 uzastopne karte iste boje',
                  Icons.view_carousel,
                  Colors.green,
                ),
                _buildZvanjeCard(
                  context,
                  'Kvart',
                  '100 bodova',
                  '5 uzastopnih karata iste boje',
                  Icons.view_quilt,
                  Colors.purple,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Dečka',
                  '200 bodova',
                  '4 dečka (svih boja)',
                  Icons.people,
                  Colors.orange,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Devetke',
                  '150 bodova',
                  '4 devetke (svih boja)',
                  Icons.grid_3x3,
                  Colors.teal,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Asa',
                  '100 bodova',
                  '4 asa (svih boja)',
                  Icons.star,
                  Colors.amber,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Desetke',
                  '100 bodova',
                  '4 desetke (svih boja)',
                  Icons.crop_square,
                  Colors.indigo,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Kraljice',
                  '100 bodova',
                  '4 kraljice (svih boja)',
                  Icons.woman,
                  Colors.pink,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Kraljeva',
                  '100 bodova',
                  '4 kraljeva (svih boja)',
                  Icons.person,
                  Colors.brown,
                ),
                
                // Napomene
                 const SizedBox(height: AppTheme.helpDialogSpacing20),
                Container(
                  padding: AppTheme.helpDialogNotePadding,
                  decoration: BoxDecoration(
                    color: AppTheme.getHelpDialogNoteBackgroundColor(context),
                    borderRadius: BorderRadius.circular(AppTheme.helpDialogCardBorderRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Napomene:',
                        style: AppTheme.helpDialogNoteHeaderTextStyle.copyWith(
                          color: AppTheme.getHelpDialogTextColor(context),
                        ),
                      ),
                     const SizedBox(height: AppTheme.helpDialogSpacing8),
                      Text(
                        '• Zvanja se prijavljuju prije početka igre\n'
                        '• Bodove za zvanja dobiva tim koji ima najveće zvanje\n'
                        '• Adut karte imaju prednost kod terz/kvinta/kvart zvanja\n'
                        '• Bela se može prijaviti samo ako se ima i dama i kralj adut boje',
                        style: AppTheme.helpDialogNoteContentTextStyle.copyWith(
                          color: AppTheme.getHelpDialogNoteTextColor(context),
                          height: AppTheme.helpDialogTextLineHeight,
                        ),
                      ),
                    ],
                  ),
                ),
               const SizedBox(height: AppTheme.helpDialogSpacing20),
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
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      margin: AppTheme.helpDialogCardMargin,
      padding: AppTheme.helpDialogCardPadding,
      decoration: BoxDecoration(
        color: AppTheme.getHelpDialogCardBackgroundColor(context),
        borderRadius: BorderRadius.circular(AppTheme.helpDialogCardBorderRadius),
        border: Border.all(
          color: AppTheme.getHelpDialogCardBorderColor(context),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: AppTheme.helpDialogIconPadding,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: AppTheme.helpDialogIconBackgroundOpacity),
              borderRadius: BorderRadius.circular(AppTheme.helpDialogIconBorderRadius),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: AppTheme.helpDialogIconSize,
            ),
          ),
        const  SizedBox(width: AppTheme.helpDialogSpacing16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      naziv,
                      style: AppTheme.helpDialogCardTitleTextStyle.copyWith(
                        color: AppTheme.getHelpDialogTextColor(context),
                      ),
                    ),
                    Container(
                      padding: AppTheme.helpDialogBadgePadding,
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.circular(AppTheme.helpDialogBadgeBorderRadius),
                      ),
                      child: Text(
                        bodovi,
                        style: AppTheme.helpDialogBadgeTextStyle,
                      ),
                    ),
                  ],
                ),
               const SizedBox(height: AppTheme.helpDialogSpacing4),
                Text(
                  opis,
                  style: AppTheme.helpDialogCardDescriptionTextStyle.copyWith(
                    color: AppTheme.getHelpDialogDescriptionTextColor(context),
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
