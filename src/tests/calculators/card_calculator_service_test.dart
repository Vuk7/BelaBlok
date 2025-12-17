import 'package:flutter_test/flutter_test.dart';
import 'package:bela_blok/models/playing_card.dart';
import 'package:bela_blok/enums/smart_calculator_enum.dart';
import 'card_calculator_service.dart';

//
void main() {
  late CardCalculatorService service;

  setUp(() {
    service = CardCalculatorService();
  });


  group('generateAllCards', () {
    test('generates exactly 32 cards (4 suits × 8 ranks)', () {
      final cards = service.generateAllCards();
      expect(cards.length, 32);
    });

    test('each suit has 8 cards', () {
      final cards = service.generateAllCards();
      
      final hercCards = cards.where((c) => c.suit == CardSuit.herc).toList();
      final karoCards = cards.where((c) => c.suit == CardSuit.karo).toList();
      final trefCards = cards.where((c) => c.suit == CardSuit.tref).toList();
      final pikCards = cards.where((c) => c.suit == CardSuit.pik).toList();

      expect(hercCards.length, 8);
      expect(karoCards.length, 8);
      expect(trefCards.length, 8);
      expect(pikCards.length, 8);
    });

    test('each card has correct image path', () {
      final cards = service.generateAllCards();
      
      final firstCard = cards.first;
      expect(firstCard.imagePath, contains('assets/cards/'));
      expect(firstCard.imagePath, contains('.png'));
    });

    test('all cards are unique', () {
      final cards = service.generateAllCards();
      final uniqueIds = cards.map((c) => c.id).toSet();
      
      expect(uniqueIds.length, 32);
    });

    test('cards contain all ranks', () {
      final cards = service.generateAllCards();
      final ranks = cards.map((c) => c.rank).toSet();

      expect(ranks.length, 8);
      expect(ranks, contains(CardRank.seven));
      expect(ranks, contains(CardRank.eight));
      expect(ranks, contains(CardRank.nine));
      expect(ranks, contains(CardRank.ten));
      expect(ranks, contains(CardRank.jack));
      expect(ranks, contains(CardRank.queen));
      expect(ranks, contains(CardRank.king));
      expect(ranks, contains(CardRank.ace));
    });
  });

  
  group('filterCardsBySuits', () {
    late List<PlayingCard> allCards;

    setUp(() {
      allCards = service.generateAllCards();
    });

    test('all 4 suits returns all cards', () {
      final filtered = service.filterCardsBySuits(
        allCards,
        [CardSuit.herc, CardSuit.karo, CardSuit.tref, CardSuit.pik],
      );

      expect(filtered.length, 32);
    });

    test('only herc returns 8 cards', () {
      final filtered = service.filterCardsBySuits(
        allCards,
        [CardSuit.herc],
      );

      expect(filtered.length, 8);
      expect(filtered.every((c) => c.suit == CardSuit.herc), true);
    });

    test('only karo returns 8 cards', () {
      final filtered = service.filterCardsBySuits(
        allCards,
        [CardSuit.karo],
      );

      expect(filtered.length, 8);
      expect(filtered.every((c) => c.suit == CardSuit.karo), true);
    });

    test('herc and karo returns 16 cards', () {
      final filtered = service.filterCardsBySuits(
        allCards,
        [CardSuit.herc, CardSuit.karo],
      );

      expect(filtered.length, 16);
    });

    test('3 suits returns 24 cards', () {
      final filtered = service.filterCardsBySuits(
        allCards,
        [CardSuit.herc, CardSuit.karo, CardSuit.tref],
      );

      expect(filtered.length, 24);
    });

    test('empty suit list returns empty list', () {
      final filtered = service.filterCardsBySuits(
        allCards,
        [],
      );

      expect(filtered.length, 0);
    });
  });

 
  group('calculateTotalScore', () {
    
    
    PlayingCard createCard(CardRank rank, CardSuit suit) {
      return PlayingCard(
        rank: rank,
        suit: suit,
        imagePath: 'assets/cards/${rank.label}_${suit.name}.png',
      );
    }

    group('Standard values (not trump)', () {
      test('7 is worth 0 points', () {
        final card = createCard(CardRank.seven, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.karo, 
          [],
        );
        expect(score, 0);
      });

      test('8 is worth 0 points', () {
        final card = createCard(CardRank.eight, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.karo,
          [],
        );
        expect(score, 0);
      });

      test('9 is worth 0 points (standard)', () {
        final card = createCard(CardRank.nine, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.karo,
          [], 
        );
        expect(score, 0);
      });

      test('10 is worth 10 points', () {
        final card = createCard(CardRank.ten, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.karo,
          [],
        );
        expect(score, 10);
      });

      test('J is worth 2 points (standard)', () {
        final card = createCard(CardRank.jack, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.karo,
          [], 
        );
        expect(score, 2);
      });

      test('Q is worth 3 points', () {
        final card = createCard(CardRank.queen, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.karo,
          [],
        );
        expect(score, 3);
      });

      test('K is worth 4 points', () {
        final card = createCard(CardRank.king, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.karo,
          [],
        );
        expect(score, 4);
      });

      test('A is worth 11 points', () {
        final card = createCard(CardRank.ace, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.karo,
          [],
        );
        expect(score, 11);
      });
    });

    group('Trump values (9 and J)', () {
      test('9 as trump is worth 14 points', () {
        final card = createCard(CardRank.nine, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.herc, 
          ['9_herc'],
        );
        expect(score, 14);
      });

      test('J as trump is worth 20 points', () {
        final card = createCard(CardRank.jack, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.herc,
          ['J_herc'],
        );
        expect(score, 20);
      });

      test('9 same suit as trump BUT not in trump list = 0 points', () {
        final card = createCard(CardRank.nine, CardSuit.herc);
        final score = service.calculateTotalScore(
          [card],
          CardSuit.herc,
          [], 
        );
        expect(score, 0);
      });
    });

    group('Card combinations', () {
      test('all cards of one suit (standard) = 30 points', () {
        
        final cards = [
          createCard(CardRank.seven, CardSuit.herc),
          createCard(CardRank.eight, CardSuit.herc),
          createCard(CardRank.nine, CardSuit.herc),
          createCard(CardRank.ten, CardSuit.herc),
          createCard(CardRank.jack, CardSuit.herc),
          createCard(CardRank.queen, CardSuit.herc),
          createCard(CardRank.king, CardSuit.herc),
          createCard(CardRank.ace, CardSuit.herc),
        ];

        final score = service.calculateTotalScore(
          cards,
          CardSuit.karo, 
          [],
        );
        expect(score, 30);
      });

      test('all cards of one suit as trump = 62 points', () {
        
        final cards = [
          createCard(CardRank.seven, CardSuit.herc),
          createCard(CardRank.eight, CardSuit.herc),
          createCard(CardRank.nine, CardSuit.herc),
          createCard(CardRank.ten, CardSuit.herc),
          createCard(CardRank.jack, CardSuit.herc),
          createCard(CardRank.queen, CardSuit.herc),
          createCard(CardRank.king, CardSuit.herc),
          createCard(CardRank.ace, CardSuit.herc),
        ];

        final score = service.calculateTotalScore(
          cards,
          CardSuit.herc, 
          ['9_herc', 'J_herc'], 
        );
        expect(score, 62);
      });

      test('empty card list = 0 points', () {
        final score = service.calculateTotalScore(
          [],
          CardSuit.herc,
          [],
        );
        expect(score, 0);
      });

      test('only 9 and J as trump = 34 points', () {
        final cards = [
          createCard(CardRank.nine, CardSuit.herc),
          createCard(CardRank.jack, CardSuit.herc),
        ];

        final score = service.calculateTotalScore(
          cards,
          CardSuit.herc,
          ['9_herc', 'J_herc'],
        );
        expect(score, 34); 
      });

      test('mixed suits - only trump suit gets bonus', () {
        final cards = [
          createCard(CardRank.nine, CardSuit.herc), 
          createCard(CardRank.nine, CardSuit.karo), 
        ];

        final score = service.calculateTotalScore(
          cards,
          CardSuit.herc,
          ['9_herc'], 
        );
        expect(score, 14);
      });
    });

    group('Bela scenarios', () {
      test('bela (K + Q trump) = 7 points (as cards, call is separate)', () {
        final cards = [
          createCard(CardRank.king, CardSuit.herc),
          createCard(CardRank.queen, CardSuit.herc),
        ];

        final score = service.calculateTotalScore(
          cards,
          CardSuit.herc,
          [],
        );
        expect(score, 7); 
      });
    });

    group('Complex scenarios', () {
      test('typical hand - 4 cards of different suits', () {
        final cards = [
          createCard(CardRank.ace, CardSuit.herc),   
          createCard(CardRank.ten, CardSuit.karo),   
          createCard(CardRank.king, CardSuit.tref),  
          createCard(CardRank.jack, CardSuit.pik),   
        ];

        final score = service.calculateTotalScore(
          cards,
          CardSuit.herc,
          [],
        );
        expect(score, 27); 
      });

      test('typical hand with trump J = more points', () {
        final cards = [
          createCard(CardRank.ace, CardSuit.herc),   
          createCard(CardRank.ten, CardSuit.karo),   
          createCard(CardRank.king, CardSuit.tref),  
          createCard(CardRank.jack, CardSuit.herc),  
        ];

        final score = service.calculateTotalScore(
          cards,
          CardSuit.herc,
          ['J_herc'],
        );
        expect(score, 45); 
      });

      test('maximum possible points (all trumps)', () {
        final cards = [
          createCard(CardRank.ace, CardSuit.herc),
          createCard(CardRank.ten, CardSuit.herc),
          createCard(CardRank.king, CardSuit.herc),
          createCard(CardRank.queen, CardSuit.herc),
          createCard(CardRank.jack, CardSuit.herc),
          createCard(CardRank.nine, CardSuit.herc),
          createCard(CardRank.eight, CardSuit.herc),
          createCard(CardRank.seven, CardSuit.herc),
        ];

        final score = service.calculateTotalScore(
          cards,
          CardSuit.herc,
          ['J_herc', '9_herc'],
        );
        expect(score, 62);
      });
    });
  });

 
  group('Edge cases', () {
    test('trump list with non-existent card has no effect', () {
      final card = PlayingCard(
        rank: CardRank.nine,
        suit: CardSuit.herc,
        imagePath: 'test.png',
      );

      final score = service.calculateTotalScore(
        [card],
        CardSuit.herc,
        ['9_karo'], 
      );
      expect(score, 0); 
    });

    test('same card can only be once in list', () {
      final card = PlayingCard(
        rank: CardRank.ace,
        suit: CardSuit.herc,
        imagePath: 'test.png',
      );

     
      final score = service.calculateTotalScore(
        [card, card, card],
        CardSuit.karo,
        [],
      );
      expect(score, 33); 
    });
  });
}
