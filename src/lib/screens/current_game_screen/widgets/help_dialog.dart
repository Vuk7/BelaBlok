import 'package:flutter/material.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF34495E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sva moguća zvanja u Belotu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildZvanjeCard(
                  context,
                  'Bela',
                  '20 bodova',
                  'Dama i kralj adut boje',
                  Icons.favorite,
                  Colors.red,
                  isDark,
                ),
                _buildZvanjeCard(
                  context,
                  'Terz',
                  '20 bodova',
                  '3 uzastopne karte iste boje',
                  Icons.view_stream,
                  Colors.blue,
                  isDark,
                ),
                _buildZvanjeCard(
                  context,
                  'Kvinta',
                  '50 bodova',
                  '4 uzastopne karte iste boje',
                  Icons.view_carousel,
                  Colors.green,
                  isDark,
                ),
                _buildZvanjeCard(
                  context,
                  'Kvart',
                  '100 bodova',
                  '5 uzastopnih karata iste boje',
                  Icons.view_quilt,
                  Colors.purple,
                  isDark,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Dečka',
                  '200 bodova',
                  '4 dečka (svih boja)',
                  Icons.people,
                  Colors.orange,
                  isDark,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Devetke',
                  '150 bodova',
                  '4 devetke (svih boja)',
                  Icons.grid_3x3,
                  Colors.teal,
                  isDark,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Asa',
                  '100 bodova',
                  '4 asa (svih boja)',
                  Icons.star,
                  Colors.amber,
                  isDark,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Desetke',
                  '100 bodova',
                  '4 desetke (svih boja)',
                  Icons.crop_square,
                  Colors.indigo,
                  isDark,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Kraljice',
                  '100 bodova',
                  '4 kraljice (svih boja)',
                  Icons.woman,
                  Colors.pink,
                  isDark,
                ),
                _buildZvanjeCard(
                  context,
                  '4 Kraljeva',
                  '100 bodova',
                  '4 kraljeva (svih boja)',
                  Icons.person,
                  Colors.brown,
                  isDark,
                ),
                
                // Napomene
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Napomene:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '• Zvanja se prijavljuju prije početka igre\n'
                        '• Bodove za zvanja dobiva tim koji ima najveće zvanje\n'
                        '• Adut karte imaju prednost kod terz/kvinta/kvart zvanja\n'
                        '• Bela se može prijaviti samo ako se ima i dama i kralj adut boje',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? Colors.grey[300] : Colors.grey[700],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
    bool isDark,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      naziv,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        bodovi,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  opis,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey[300] : Colors.grey[600],
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
