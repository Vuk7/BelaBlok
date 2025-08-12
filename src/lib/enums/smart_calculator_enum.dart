enum CardSuit {
  herc('Herc ♥'),
  karo('Karo ♦'),
  tref('Tref ♣'),
  pik('Pik ♠');

  final String displayName;
  const CardSuit(this.displayName);
}

enum CardRank {
  seven('7', 0, 0),
  eight('8', 0, 0),
  nine('9', 0, 14),
  ten('10', 10, 10),
  jack('J', 2, 20),
  queen('Q', 3, 3),
  king('K', 4, 4),
  ace('A', 11, 11);

  final String label;
  final int _standardValue;
  final int _trumpValue;
  const CardRank(this.label, this._standardValue, this._trumpValue);

  int get standardValue => _standardValue;
  int get trumpValue => _trumpValue;

  static CardRank fromString(String value) =>
      CardRank.values.firstWhere((e) => e.label == value);
}