class PlayingCard {
  final String suit; // 'herc', 'karo', 'tref', 'pik'
  final String rank; // '7', '8', '9', '10', 'J', 'Q', 'K', 'A'
  final String imagePath;
  final bool isSelected;

  PlayingCard({
    required this.suit,
    required this.rank,
    required this.imagePath,
    this.isSelected = false,
  });

  String get id => '${rank}_$suit';

  // Vrijednosti karata u standardnom načinu
  int get standardValue {
    switch (rank) {
      case 'A': return 11;
      case '10': return 10;
      case 'K': return 4;
      case 'Q': return 3;
      case 'J': return 2;
      case '9': return 0;
      case '8': return 0;
      case '7': return 0;
      default: return 0;
    }
  }

  // Vrijednosti karata u adutu
  int get trumpValue {
    switch (rank) {
      case 'J': return 20;  // Fant u adutu
      case '9': return 14;  // Devet u adutu
      case 'A': return 11;
      case '10': return 10;
      case 'K': return 4;
      case 'Q': return 3;
      case '8': return 0;
      case '7': return 0;
      default: return 0;
    }
  }

  int getValue(bool isTrump) {
    return isTrump ? trumpValue : standardValue;
  }

  PlayingCard copyWith({
    String? suit,
    String? rank,
    String? imagePath,
    bool? isSelected,
  }) {
    return PlayingCard(
      suit: suit ?? this.suit,
      rank: rank ?? this.rank,
      imagePath: imagePath ?? this.imagePath,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PlayingCard && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
