import 'package:bela_blok/models/playing_card.dart';

class CardCalculatorService {
  static final CardCalculatorService _instance = CardCalculatorService._internal();
  factory CardCalculatorService() => _instance;
  CardCalculatorService._internal();

  // Svi aduti
  static const List<String> suits = ['herc', 'karo', 'tref', 'pik'];
  static const List<String> ranks = ['7', '8', '9', '10', 'J', 'Q', 'K', 'A'];

  // Generiraj sve karte
  List<PlayingCard> generateAllCards() {
    List<PlayingCard> cards = [];
    
    for (String suit in suits) {
      for (String rank in ranks) {
        cards.add(PlayingCard(
          suit: suit,
          rank: rank,
          imagePath: 'assets/cards/${rank}_$suit.png', // Putanja do slika karata
        ));
      }
    }
    
    return cards;
  }

  // Filtriraj karte po boji
  List<PlayingCard> filterCardsBySuits(List<PlayingCard> allCards, List<String> selectedSuits) {
    if (selectedSuits.contains('sve')) {
      return allCards;
    }
    
    return allCards.where((card) => selectedSuits.contains(card.suit)).toList();
  }

  // Izračunaj ukupan rezultat
  int calculateTotalScore(List<PlayingCard> selectedCards, String trumpSuit, List<String> trumpCards) {
    int total = 0;
    
    for (PlayingCard card in selectedCards) {
      bool isTrump = trumpCards.contains(card.id);
      total += card.getValue(isTrump);
    }
    
    // Provjeri za specijalne kombinacije
    total += _checkForBela(selectedCards, trumpSuit, trumpCards);
    total += _checkForTerces(selectedCards);
    
    return total;
  }

  // Provjeri za Belu (Kralj i Dama u adutu)
  int _checkForBela(List<PlayingCard> cards, String trumpSuit, List<String> trumpCards) {
    bool hasKing = cards.any((card) => card.rank == 'K' && card.suit == trumpSuit && trumpCards.contains(card.id));
    bool hasDama = cards.any((card) => card.rank == 'Q' && card.suit == trumpSuit && trumpCards.contains(card.id));
    
    return (hasKing && hasDama) ? 20 : 0;
  }

  // Provjeri za Terce (3 uzastopne karte iste boje)
  int _checkForTerces(List<PlayingCard> cards) {
    // Grupaj karte po bojama
    Map<String, List<String>> cardsBySuit = {};
    
    for (PlayingCard card in cards) {
      if (!cardsBySuit.containsKey(card.suit)) {
        cardsBySuit[card.suit] = [];
      }
      cardsBySuit[card.suit]!.add(card.rank);
    }
    
    int terceBonus = 0;
    
    // Provjeri svaku boju
    for (List<String> suitCards in cardsBySuit.values) {
      if (suitCards.length >= 3) {
        // Sortiranje karata po vrijednosti za provjeru uzastopnih
        List<int> rankValues = suitCards.map((rank) => _getRankValue(rank)).toList();
        rankValues.sort();
        
        // Provjeri za uzastopne kombinacije
        for (int i = 0; i <= rankValues.length - 3; i++) {
          if (rankValues[i + 1] == rankValues[i] + 1 && 
              rankValues[i + 2] == rankValues[i] + 2) {
            
            if (rankValues.length - i >= 5) {
              terceBonus += 100; // Pet karata
            } else if (rankValues.length - i >= 4) {
              terceBonus += 50;  // Četiri karte
            } else {
              terceBonus += 20;  // Tri karte (terca)
            }
            break;
          }
        }
      }
    }
    
    return terceBonus;
  }

  int _getRankValue(String rank) {
    switch (rank) {
      case '7': return 1;
      case '8': return 2;
      case '9': return 3;
      case '10': return 4;
      case 'J': return 5;
      case 'Q': return 6;
      case 'K': return 7;
      case 'A': return 8;
      default: return 0;
    }
  }

  // Dobij naziv boje na hrvatskom
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
