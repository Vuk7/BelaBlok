import 'package:flutter_test/flutter_test.dart';
import 'package:bela_blok/models/playing_card.dart';
import 'package:bela_blok/enums/smart_calculator_enum.dart';


void main() {

 
  group('Card creation', () {
    test('creates card with required properties', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'assets/cards/A_herc.png',
      );

      expect(card.suit, CardSuit.herc);
      expect(card.rank, CardRank.ace);
      expect(card.imagePath, 'assets/cards/A_herc.png');
      expect(card.isSelected, false); 
    });

    test('creates card with isSelected = true', () {
      final card = PlayingCard(
        suit: CardSuit.karo,
        rank: CardRank.king,
        imagePath: 'assets/cards/K_karo.png',
        isSelected: true,
      );

      expect(card.isSelected, true);
    });
  });


  group('id getter', () {
    test('id format is rank_suit', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );

      expect(card.id, 'A_herc');
    });

    test('id for 10 of karo', () {
      final card = PlayingCard(
        suit: CardSuit.karo,
        rank: CardRank.ten,
        imagePath: 'test.png',
      );

      expect(card.id, '10_karo');
    });

    test('id for J of tref', () {
      final card = PlayingCard(
        suit: CardSuit.tref,
        rank: CardRank.jack,
        imagePath: 'test.png',
      );

      expect(card.id, 'J_tref');
    });

    test('id for 7 of pik', () {
      final card = PlayingCard(
        suit: CardSuit.pik,
        rank: CardRank.seven,
        imagePath: 'test.png',
      );

      expect(card.id, '7_pik');
    });

    test('all cards have unique ids', () {
      final ids = <String>{};
      
      for (final suit in CardSuit.values) {
        for (final rank in CardRank.values) {
          final card = PlayingCard(
            suit: suit,
            rank: rank,
            imagePath: 'test.png',
          );
          ids.add(card.id);
        }
      }

      expect(ids.length, 32); 
    });
  });

 
  group('standardValue getter', () {
    test('7 has standard value 0', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.seven,
        imagePath: 'test.png',
      );
      expect(card.standardValue, 0);
    });

    test('8 has standard value 0', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.eight,
        imagePath: 'test.png',
      );
      expect(card.standardValue, 0);
    });

    test('9 has standard value 0', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.nine,
        imagePath: 'test.png',
      );
      expect(card.standardValue, 0);
    });

    test('10 has standard value 10', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ten,
        imagePath: 'test.png',
      );
      expect(card.standardValue, 10);
    });

    test('J has standard value 2', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.jack,
        imagePath: 'test.png',
      );
      expect(card.standardValue, 2);
    });

    test('Q has standard value 3', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.queen,
        imagePath: 'test.png',
      );
      expect(card.standardValue, 3);
    });

    test('K has standard value 4', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.king,
        imagePath: 'test.png',
      );
      expect(card.standardValue, 4);
    });

    test('A has standard value 11', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );
      expect(card.standardValue, 11);
    });
  });

  group('trumpValue getter', () {
    test('7 has trump value 0', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.seven,
        imagePath: 'test.png',
      );
      expect(card.trumpValue, 0);
    });

    test('8 has trump value 0', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.eight,
        imagePath: 'test.png',
      );
      expect(card.trumpValue, 0);
    });

    test('9 has trump value 14', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.nine,
        imagePath: 'test.png',
      );
      expect(card.trumpValue, 14);
    });

    test('10 has trump value 10', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ten,
        imagePath: 'test.png',
      );
      expect(card.trumpValue, 10);
    });

    test('J has trump value 20', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.jack,
        imagePath: 'test.png',
      );
      expect(card.trumpValue, 20);
    });

    test('Q has trump value 3', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.queen,
        imagePath: 'test.png',
      );
      expect(card.trumpValue, 3);
    });

    test('K has trump value 4', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.king,
        imagePath: 'test.png',
      );
      expect(card.trumpValue, 4);
    });

    test('A has trump value 11', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );
      expect(card.trumpValue, 11);
    });
  });


  group('getValue', () {
    test('getValue(false) returns standard value', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.jack,
        imagePath: 'test.png',
      );

      expect(card.getValue(false), 2); 
    });

    test('getValue(true) returns trump value', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.jack,
        imagePath: 'test.png',
      );

      expect(card.getValue(true), 20); 
    });

    test('9 standard vs trump value difference', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.nine,
        imagePath: 'test.png',
      );

      expect(card.getValue(false), 0);  
      expect(card.getValue(true), 14);  
    });

    test('A has same value for standard and trump', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );

      expect(card.getValue(false), 11);
      expect(card.getValue(true), 11);
    });
  });

 
  group('copyWith', () {
    test('copyWith no changes returns same values', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
        isSelected: false,
      );

      final copy = card.copyWith();

      expect(copy.suit, card.suit);
      expect(copy.rank, card.rank);
      expect(copy.imagePath, card.imagePath);
      expect(copy.isSelected, card.isSelected);
    });

    test('copyWith changes isSelected', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
        isSelected: false,
      );

      final copy = card.copyWith(isSelected: true);

      expect(copy.isSelected, true);
      expect(copy.suit, card.suit); 
      expect(copy.rank, card.rank); 
    });

    test('copyWith changes suit', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );

      final copy = card.copyWith(suit: CardSuit.karo);

      expect(copy.suit, CardSuit.karo);
      expect(copy.rank, CardRank.ace); 
    });

    test('copyWith changes rank', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );

      final copy = card.copyWith(rank: CardRank.king);

      expect(copy.rank, CardRank.king);
      expect(copy.suit, CardSuit.herc); 
    });

    test('copyWith changes multiple properties', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
        isSelected: false,
      );

      final copy = card.copyWith(
        suit: CardSuit.pik,
        rank: CardRank.seven,
        isSelected: true,
      );

      expect(copy.suit, CardSuit.pik);
      expect(copy.rank, CardRank.seven);
      expect(copy.isSelected, true);
      expect(copy.imagePath, 'test.png'); 
    });

    test('original card is not modified after copyWith', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
        isSelected: false,
      );

      card.copyWith(isSelected: true);

      expect(card.isSelected, false);
    });
  });


  group('equality operator', () {
    test('same suit and rank are equal', () {
      final card1 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'path1.png',
      );

      final card2 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'path2.png', 
      );

      expect(card1 == card2, true);
    });

    test('different suits are not equal', () {
      final card1 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );

      final card2 = PlayingCard(
        suit: CardSuit.karo,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );

      expect(card1 == card2, false);
    });

    test('different ranks are not equal', () {
      final card1 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );

      final card2 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.king,
        imagePath: 'test.png',
      );

      expect(card1 == card2, false);
    });

    test('isSelected does not affect equality', () {
      final card1 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
        isSelected: false,
      );

      final card2 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
        isSelected: true,
      );

      expect(card1 == card2, true);
    });

    test('identical cards are equal', () {
      final card = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );

      expect(card == card, true);
    });
  });


  group('hashCode', () {
    test('same cards have same hashCode', () {
      final card1 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'path1.png',
      );

      final card2 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'path2.png',
      );

      expect(card1.hashCode, card2.hashCode);
    });

    test('different cards may have different hashCode', () {
      final card1 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'test.png',
      );

      final card2 = PlayingCard(
        suit: CardSuit.karo,
        rank: CardRank.king,
        imagePath: 'test.png',
      );

  
      expect(card1.hashCode != card2.hashCode, true);
    });

    test('cards work correctly in Set', () {
      final card1 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'path1.png',
      );

      final card2 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'path2.png',
      );

      final set = {card1, card2};

      expect(set.length, 1); 
    });

    test('cards work correctly in Map as keys', () {
      final card1 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'path1.png',
      );

      final card2 = PlayingCard(
        suit: CardSuit.herc,
        rank: CardRank.ace,
        imagePath: 'path2.png',
      );

      final map = <PlayingCard, int>{};
      map[card1] = 1;
      map[card2] = 2;

      expect(map.length, 1); 
      expect(map[card1], 2); 
    });
  });

  
  group('Edge cases', () {
    test('all 32 cards can be created', () {
      final cards = <PlayingCard>[];

      for (final suit in CardSuit.values) {
        for (final rank in CardRank.values) {
          cards.add(PlayingCard(
            suit: suit,
            rank: rank,
            imagePath: 'assets/cards/${rank.label}_${suit.name}.png',
          ));
        }
      }

      expect(cards.length, 32);
    });

    test('total standard value of all cards = 120', () {
    
      int total = 0;

      for (final suit in CardSuit.values) {
        for (final rank in CardRank.values) {
          final card = PlayingCard(
            suit: suit,
            rank: rank,
            imagePath: 'test.png',
          );
          total += card.standardValue;
        }
      }

      expect(total, 120);
    });

    test('total trump value of one suit = 62', () {
 
      int total = 0;

      for (final rank in CardRank.values) {
        final card = PlayingCard(
          suit: CardSuit.herc,
          rank: rank,
          imagePath: 'test.png',
        );
        total += card.trumpValue;
      }

      expect(total, 62);
    });
  });
}
