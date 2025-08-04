import '../enums/smart_calculator_enum.dart';

class PlayingCard {
  final CardSuit suit;
  final CardRank rank;
  final String imagePath;
  final bool isSelected;

  PlayingCard({
    required this.suit,
    required this.rank,
    required this.imagePath,
    this.isSelected = false,
  });

  String get id => '${rank.label}_${suit.name}';

  int get standardValue => rank.standardValue;

  int get trumpValue => rank.trumpValue;

  int getValue(bool isTrump) => isTrump ? trumpValue : standardValue;

  PlayingCard copyWith({
    CardSuit? suit,
    CardRank? rank,
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