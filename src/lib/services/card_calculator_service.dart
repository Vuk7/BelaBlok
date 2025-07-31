import 'package:bela_blok/models/playing_card.dart';

class CardCalculatorService {
  static final CardCalculatorService _instance = CardCalculatorService._internal();
  factory CardCalculatorService() => _instance;
  CardCalculatorService._internal();

  static const List<String> suits = ['herc', 'karo', 'tref', 'pik'];
  static const List<String> ranks = ['7', '8', '9', '10', 'J', 'Q', 'K', 'A'];

  List<PlayingCard> generateAllCards() {
    List<PlayingCard> cards = [];

    for (String suit in suits) {
      for (String rank in ranks) {
        cards.add(PlayingCard(
          suit: suit,
          rank: rank,
          imagePath: 'assets/cards/${rank}_$suit.png', 
        ));
      }
    }

    return cards;
  }

  List<PlayingCard> filterCardsBySuits(List<PlayingCard> allCards, List<String> selectedSuits) {
    if (selectedSuits.contains('sve')) {
      return allCards;
    }

    return allCards.where((card) => selectedSuits.contains(card.suit)).toList();
  }

  int calculateTotalScore(List<PlayingCard> selectedCards, String trumpSuit, List<String> trumpCards) {
    int total = 0;

    for (PlayingCard card in selectedCards) {
      bool isTrump = trumpCards.contains(card.id);
      total += card.getValue(isTrump);
    }

    return total;
  }


  String getSuitDisplayName(String suit) {
    switch (suit) {
      case 'herc': return 'Herc ♥';
      case 'karo': return 'Karo ♦';
      case 'tref': return 'Tref ♣';
      case 'pik': return 'Pik ♠';
      default: return suit;
    }
  }
}