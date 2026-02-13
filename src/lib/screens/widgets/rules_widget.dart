import 'package:flutter/material.dart';

class RulesWidget extends StatefulWidget {
  const RulesWidget({super.key});

  @override
  State<RulesWidget> createState() => _RulesWidgetState();
}

class _RulesWidgetState extends State<RulesWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.red.withValues(alpha: 0.3),
          width: 2,
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
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu_book,
                    color: Colors.red,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'PRAVILA',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.casino,
                    color: Colors.red,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.expand_more,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Expandable content
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isExpanded ? null : 0,
            child: isExpanded ? Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(color: Colors.red),
                  const SizedBox(height: 16),
                  
                  _buildRuleSection(
                    'CILJ IGRE',
                    'Prva ekipa koja postigne 1001 bod pobjeđuje.',
                    Icons.flag,
                    isDark,
                  ),
                  
                  _buildRuleSection(
                    'SNAGA KARATA (ADUT)',
                    'Dečko (20), Devetka (14), As (11), Desetka (10), Kralj (4), Kraljica (3), Osmica (0), Sedmica (0)',
                    Icons.workspace_premium,
                    isDark,
                  ),
                  
                  _buildRuleSection(
                    'SNAGA KARATA (OBIČNA BOJA)',
                    'As (11), Desetka (10), Kralj (4), Kraljica (3), Dečko (2), Deveta (0), Osmica (0), Sedmica (0)',
                    Icons.style,
                    isDark,
                  ),
                  
                  _buildRuleSection(
                    'ZVANJE',
                    '20 - Tri uzastopne karte iste boje\n50 - Četiri uzastopne karte iste boje\n100 - Pet uzastopnih karata iste boje\n100 - Četiri desetke, četiri kralja, četiri kraljice\n150 - Četiri devetke, četiri asa\n200 - Četiri dečka',
                    Icons.star,
                    isDark,
                  ),
                  
                  _buildRuleSection(
                    'BELA',
                    'Kralj i kraljica aduta u istoj ruci = +20 bodova\nMora se najaviti prilikom igranja jedne od karata',
                    Icons.favorite,
                    isDark,
                  ),
                  
                  _buildRuleSection(
                    'ZVANJE',
                    'Tim koji zove mora uzeti barem toliko bodova koliko je pozvao + pozive (npr. u igri bez zvanja tim koji zove mora imati barem 82 od 162 boda), inače "pada" i suparnici dobivaju 162 boda + svoje zvanje.',
                    Icons.phone_callback,
                    isDark,
                  ),
                  
                  _buildRuleSection(
                    'CAPOT/ŠTIGLJA',
                    'Ako tim uzme svih 8 štiha, dobiva 90 dodatnih bodova (ukupno 252 boda).',
                    Icons.emoji_events,
                    isDark,
                  ),
                  
                  _buildRuleSection(
                    'BELOT',
                    'Ako jedan od igrača ima 8 karata iste boje i zove to je automatksa pobjeda toga tima (znači piše ima se 1001)',
                    Icons.emoji_events,
                    isDark,
                  ),

                  _buildRuleSection(
                    'BODOVANJE',
                    'Ukupno bodova u partiji je 162. Broj bodova partije se poveća proporcijalno znvanjima u rudni.',
                    Icons.calculate,
                    isDark,
                  ),
                ],
              ),
            ) : null,
          ),
        ],
      ),
    );
  }
  
  Widget _buildRuleSection(String title, String content, IconData icon, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[700] : Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.red.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.grey[300] : Colors.grey[700],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
