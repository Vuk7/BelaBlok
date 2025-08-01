import 'package:bela_blok/models/playing_card.dart';
import 'package:bela_blok/enums/smart_calculator_enum.dart';

class CardCalculatorService {
  final List<CardSuit> suits = CardSuit.values;
  final List<CardRank> ranks = CardRank.values;

  List<PlayingCard> generateAllCards() {
    List<PlayingCard> cards = [];

    for (CardSuit suit in suits) {
      for (CardRank rank in ranks) {
        cards.add(PlayingCard(
          suit: suit,
          rank: rank,
          imagePath: 'assets/cards/${rank.label}_${suit.name}.png',
        ));
      }
    }

    return cards;
  }

  List<PlayingCard> filterCardsBySuits(List<PlayingCard> allCards, List<CardSuit> selectedSuits) {
    if (selectedSuits.length == CardSuit.values.length) {
      return allCards;
    }

    return allCards.where((card) => selectedSuits.contains(card.suit)).toList();
  }

  int calculateTotalScore(List<PlayingCard> selectedCards, CardSuit trumpSuit, List<String> trumpCards) {
    int total = 0;

    for (PlayingCard card in selectedCards) {
      bool isTrump = card.suit == trumpSuit || trumpCards.contains(card.id);
      total += card.getValue(isTrump);
    }

    return total;
  }

  String getSuitDisplayName(CardSuit suit) {
    switch (suit) {
      case CardSuit.herc: return 'Herc ♥';
      case CardSuit.karo: return 'Karo ♦';
      case CardSuit.tref: return 'Tref ♣';
      case CardSuit.pik: return 'Pik ♠';
    }
  }
}