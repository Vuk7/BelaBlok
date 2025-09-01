import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';

class RulesWidget extends StatefulWidget {
  const RulesWidget({super.key});

  @override
  State<RulesWidget> createState() => _RulesWidgetState();
}

class _RulesWidgetState extends State<RulesWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.getRulesWidgetBackgroundColor(context),
        borderRadius: BorderRadius.circular(AppTheme.rulesWidgetBorderRadius),
        boxShadow: [
          BoxShadow(
            color: AppTheme.getRulesWidgetShadowColor(),
            blurRadius: AppTheme.rulesWidgetShadowBlurRadius,
            offset: AppTheme.rulesWidgetShadowOffset,
          ),
        ],
        border: Border.all(
          color: AppTheme.getRulesWidgetBorderColor(),
          width: AppTheme.rulesWidgetBorderWidth,
        ),
      ),
      child: Column(
        children: [
          // Header - uvijek vidljiv
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(AppTheme.rulesWidgetBorderRadius),
            child: Padding(
              padding: AppTheme.rulesWidgetHeaderPadding,
              child: Row(
                children: [
                 const Icon(
                    Icons.menu_book,
                    color: AppTheme.rulesWidgetRedColor,
                    size: AppTheme.rulesWidgetHeaderIconSize,
                  ),
                 const SizedBox(width: AppTheme.rulesWidgetHeaderSpacing),
                 const Text(
                    'PRAVILA',
                    style: AppTheme.rulesWidgetHeaderTextStyle,
                  ),
                  const Spacer(),
                 const Icon(
                    Icons.casino,
                    color: AppTheme.rulesWidgetRedColor,
                    size: AppTheme.rulesWidgetHeaderIconSize,
                  ),
                 const SizedBox(width: AppTheme.rulesWidgetHeaderSpacing),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: AppTheme.rulesWidgetRotationDuration,
                    child: const Icon(
                      Icons.expand_more,
                      color: AppTheme.rulesWidgetRedColor,
                      size: AppTheme.rulesWidgetHeaderIconSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Expandable content
          AnimatedContainer(
            duration: AppTheme.rulesWidgetAnimationDuration,
            curve: AppTheme.rulesWidgetAnimationCurve,
            height: isExpanded ? null : 0,
            child: isExpanded ? Padding(
              padding: AppTheme.rulesWidgetContentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Divider(color: AppTheme.rulesWidgetRedColor),
                  const SizedBox(height: AppTheme.rulesWidgetContentSpacing),
                  
                  _buildRuleSection(
                    'CILJ IGRE',
                    'Prva ekipa koja postigne 1001 bod pobjeđuje.',
                    Icons.flag,
                    context,
                  ),
                  
                  _buildRuleSection(
                    'SNAGA KARATA (ADUT)',
                    'Dečko (20), Devetka (14), As (11), Desetka (10), Kralj (4), Kraljica (3), Osmica (0), Sedmica (0)',
                    Icons.workspace_premium,
                    context,
                  ),
                  
                  _buildRuleSection(
                    'SNAGA KARATA (OBIČNA BOJA)',
                    'As (11), Desetka (10), Kralj (4), Kraljica (3), Dečko (2), Deveta (0), Osmica (0), Sedmica (0)',
                    Icons.style,
                    context,
                  ),
                  
                  _buildRuleSection(
                    'ZVANJE',
                    '20 - Tri uzastopne karte iste boje\n50 - Četiri uzastopne karte iste boje\n100 - Pet uzastopnih karata iste boje\n100 - Četiri desetke, četiri kralja, četiri kraljice\n150 - Četiri devetke, četiri asa\n200 - Četiri dečka',
                    Icons.star,
                    context,
                  ),
                  
                  _buildRuleSection(
                    'BELA',
                    'Kralj i kraljica aduta u istoj ruci = +20 bodova\nMora se najaviti prilikom igranja jedne od karata',
                    Icons.favorite,
                    context,
                  ),
                  
                  _buildRuleSection(
                    'ZVANJE',
                    'Tim koji zove mora uzeti barem toliko bodova koliko je pozvao + pozive (npr. u igri bez zvanja tim koji zove mora imati barem 82 od 162 boda), inače "pada" i suparnici dobivaju 162 boda + svoje zvanje.',
                    Icons.phone_callback,
                    context,
                  ),
                  
                  _buildRuleSection(
                    'CAPOT/ŠTIGLJA',
                    'Ako tim uzme svih 8 štiha, dobiva 90 dodatnih bodova (ukupno 252 boda).',
                    Icons.emoji_events,
                    context,
                  ),
                  
                  _buildRuleSection(
                    'Belot',
                    'Ako jedan od igrača ima 8 karata iste boje i zove to je automatksa pobjeda toga tima (znači piše ima se 1001)',
                    Icons.emoji_events,
                    context,
                  ),

                  _buildRuleSection(
                    'BODOVANJE',
                    'Ukupno bodova u partiji je 162. Broj bodova partije se poveća proporcijalno znvanjima u rudni.',
                    Icons.calculate,
                    context,
                  ),
                ],
              ),
            ) : null,
          ),
        ],
      ),
    );
  }
  
  Widget _buildRuleSection(String title, String content, IconData icon, BuildContext context) {
    return Padding(
      padding: AppTheme.rulesWidgetSectionBottomPadding,
      child: Container(
        padding: AppTheme.rulesWidgetSectionPadding,
        decoration: BoxDecoration(
          color: AppTheme.getRulesWidgetSectionBackgroundColor(context),
          borderRadius: BorderRadius.circular(AppTheme.rulesWidgetSectionBorderRadius),
          border: Border.all(
            color: AppTheme.getRulesWidgetSectionBorderColor(),
            width: AppTheme.rulesWidgetSectionBorderWidth,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: AppTheme.rulesWidgetRedColor,
                  size: AppTheme.rulesWidgetSectionIconSize,
                ),
               const SizedBox(width: AppTheme.rulesWidgetSectionIconSpacing),
                Expanded(
                  child: Text(
                    title,
                    style: AppTheme.rulesWidgetSectionTitleTextStyle,
                  ),
                ),
              ],
            ),
           const SizedBox(height: AppTheme.rulesWidgetSectionTitleSpacing),
            Text(
              content,
              style: AppTheme.rulesWidgetSectionContentTextStyle.copyWith(
                color: AppTheme.getRulesWidgetSectionContentColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
