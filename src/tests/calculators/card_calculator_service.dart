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
      int value;
      if (card.rank == CardRank.nine || card.rank == CardRank.jack) {
       
        value = trumpCards.contains(card.id)
            ? card.rank.trumpValue
            : card.rank.standardValue;
      } else {
       
        value = card.suit == trumpSuit
            ? card.rank.trumpValue
            : card.rank.standardValue;
      }
      total += value;
    }

    return total;
  }
}
