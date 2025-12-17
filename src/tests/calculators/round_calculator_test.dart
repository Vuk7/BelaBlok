import 'package:flutter_test/flutter_test.dart';
import 'round_calculator.dart';

void main() {
  
  late RoundCalculator calculator;

  setUp(() {
 
    calculator = RoundCalculator();
  });


  group('Basic calculations', () {
    group('calculateDifference', () {
      test('difference between 160 and 2 is 158', () {
        expect(calculator.calculateDifference(160, 2), 158);
      });

      test('difference between 81 and 81 is 0', () {
        expect(calculator.calculateDifference(81, 81), 0);
      });

      test('difference between 0 and 162 is -162', () {
        expect(calculator.calculateDifference(0, 162), -162);
      });

      test('difference between 162 and 0 is 162', () {
        expect(calculator.calculateDifference(162, 0), 162);
      });
    });

    group('calculateTotal', () {
      test('base 100 + calls 20 = 120', () {
        expect(calculator.calculateTotal(100, 20), 120);
      });

      test('base 162 + calls 0 = 162', () {
        expect(calculator.calculateTotal(162, 0), 162);
      });

      test('base 0 + calls 100 = 100', () {
        expect(calculator.calculateTotal(0, 100), 100);
      });

      test('base 81 + calls 50 = 131', () {
        expect(calculator.calculateTotal(81, 50), 131);
      });
    });

    group('sumAllCalls', () {
      test('20 + 50 = 70', () {
        expect(calculator.sumAllCalls(20, 50), 70);
      });

      test('0 + 0 = 0', () {
        expect(calculator.sumAllCalls(0, 0), 0);
      });

      test('100 + 0 = 100', () {
        expect(calculator.sumAllCalls(100, 0), 100);
      });

      test('0 + 100 = 100', () {
        expect(calculator.sumAllCalls(0, 100), 100);
      });
    });
  });

 
  group('computeShuffler', () {
    group('Clockwise direction (gameDirection = 0)', () {
      test('first player 1, round 0 → player 1', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 0,
            gameDirection: 0,
          ),
          1,
        );
      });

      test('first player 1, round 1 → player 2', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 1,
            gameDirection: 0,
          ),
          2,
        );
      });

      test('first player 1, round 2 → player 3', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 2,
            gameDirection: 0,
          ),
          3,
        );
      });

      test('first player 1, round 3 → player 4', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 3,
            gameDirection: 0,
          ),
          4,
        );
      });

      test('first player 1, round 4 → player 1 (full circle)', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 4,
            gameDirection: 0,
          ),
          1,
        );
      });

      test('first player 3, round 0 → player 3', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 3,
            roundIndex: 0,
            gameDirection: 0,
          ),
          3,
        );
      });

      test('first player 3, round 2 → player 1 (wraps past 4)', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 3,
            roundIndex: 2,
            gameDirection: 0,
          ),
          1,
        );
      });
    });

    group('Counter-clockwise direction (gameDirection = 1)', () {
      test('first player 1, round 0 → player 1', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 0,
            gameDirection: 1,
          ),
          1,
        );
      });

      test('first player 1, round 1 → player 4', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 1,
            gameDirection: 1,
          ),
          4,
        );
      });

      test('first player 1, round 2 → player 3', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 2,
            gameDirection: 1,
          ),
          3,
        );
      });

      test('first player 1, round 3 → player 2', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 3,
            gameDirection: 1,
          ),
          2,
        );
      });

      test('first player 1, round 4 → player 1 (full circle)', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 1,
            roundIndex: 4,
            gameDirection: 1,
          ),
          1,
        );
      });

      test('first player 2, round 1 → player 1', () {
        expect(
          calculator.computeShuffler(
            firstShuffler: 2,
            roundIndex: 1,
            gameDirection: 1,
          ),
          1,
        );
      });
    });
  });

 
  group('isTeamFailed', () {
    test('failedTeam null, team 0 → not failed', () {
      expect(calculator.isTeamFailed(null, 0), false);
    });

    test('failedTeam null, team 1 → not failed', () {
      expect(calculator.isTeamFailed(null, 1), false);
    });

    test('failedTeam 0, team 0 → failed', () {
      expect(calculator.isTeamFailed(0, 0), true);
    });

    test('failedTeam 0, team 1 → not failed', () {
      expect(calculator.isTeamFailed(0, 1), false);
    });

    test('failedTeam 1, team 0 → not failed', () {
      expect(calculator.isTeamFailed(1, 0), false);
    });

    test('failedTeam 1, team 1 → failed', () {
      expect(calculator.isTeamFailed(1, 1), true);
    });
  });


  group('calculateFallScores', () {
    test('team 1 falls without calls - team 2 gets 162', () {
      final result = calculator.calculateFallScores(
        failedTeam: 0,
        teamOneCallAmount: 0,
        teamTwoCallAmount: 0,
      );

      expect(result['teamOneTotal'], 0);
      expect(result['teamTwoTotal'], 162);
      expect(result['teamOneBase'], 0);
      expect(result['teamTwoBase'], 162);
      expect(result['teamOneCallAmount'], 0);
      expect(result['teamTwoCallAmount'], 0);
    });

    test('team 1 falls with calls 20 + 50 - team 2 gets 162 + 70', () {
      final result = calculator.calculateFallScores(
        failedTeam: 0,
        teamOneCallAmount: 20,
        teamTwoCallAmount: 50,
      );

      expect(result['teamOneTotal'], 0);
      expect(result['teamTwoTotal'], 232); 
      expect(result['teamOneBase'], 0);
      expect(result['teamTwoBase'], 162);
      expect(result['teamOneCallAmount'], 0);
      expect(result['teamTwoCallAmount'], 70);
    });

    test('team 2 falls without calls - team 1 gets 162', () {
      final result = calculator.calculateFallScores(
        failedTeam: 1,
        teamOneCallAmount: 0,
        teamTwoCallAmount: 0,
      );

      expect(result['teamOneTotal'], 162);
      expect(result['teamTwoTotal'], 0);
      expect(result['teamOneBase'], 162);
      expect(result['teamTwoBase'], 0);
      expect(result['teamOneCallAmount'], 0);
      expect(result['teamTwoCallAmount'], 0);
    });

    test('team 2 falls with calls 100 + 20 - team 1 gets 162 + 120', () {
      final result = calculator.calculateFallScores(
        failedTeam: 1,
        teamOneCallAmount: 100,
        teamTwoCallAmount: 20,
      );

      expect(result['teamOneTotal'], 282); 
      expect(result['teamTwoTotal'], 0);
      expect(result['teamOneBase'], 162);
      expect(result['teamTwoBase'], 0);
      expect(result['teamOneCallAmount'], 120);
      expect(result['teamTwoCallAmount'], 0);
    });
  });

  
  group('calculateNormalScores', () {
    test('team 1: 100+20, team 2: 62+50', () {
      final result = calculator.calculateNormalScores(
        teamOneBase: 100,
        teamTwoBase: 62,
        teamOneCallAmount: 20,
        teamTwoCallAmount: 50,
      );

      expect(result['teamOneTotal'], 120);
      expect(result['teamTwoTotal'], 112);
      expect(result['teamOneBase'], 100);
      expect(result['teamTwoBase'], 62);
      expect(result['teamOneCallAmount'], 20);
      expect(result['teamTwoCallAmount'], 50);
    });

    test('team 1: 81+0, team 2: 81+0 (tie)', () {
      final result = calculator.calculateNormalScores(
        teamOneBase: 81,
        teamTwoBase: 81,
        teamOneCallAmount: 0,
        teamTwoCallAmount: 0,
      );

      expect(result['teamOneTotal'], 81);
      expect(result['teamTwoTotal'], 81);
    });

    test('team 1: 162+100, team 2: 0+0 (stigla/all tricks)', () {
      final result = calculator.calculateNormalScores(
        teamOneBase: 162,
        teamTwoBase: 0,
        teamOneCallAmount: 100,
        teamTwoCallAmount: 0,
      );

      expect(result['teamOneTotal'], 262);
      expect(result['teamTwoTotal'], 0);
    });

    test('without calls', () {
      final result = calculator.calculateNormalScores(
        teamOneBase: 90,
        teamTwoBase: 72,
        teamOneCallAmount: 0,
        teamTwoCallAmount: 0,
      );

      expect(result['teamOneTotal'], 90);
      expect(result['teamTwoTotal'], 72);
    });
  });


  //Main calculateRoundScores method

  group('calculateRoundScores', () {
    group('Normal game (no fall)', () {
      test('standard round', () {
        final result = calculator.calculateRoundScores(
          teamOneBase: 100,
          teamTwoBase: 62,
          teamOneCallAmount: 20,
          teamTwoCallAmount: 0,
        );

        expect(result['teamOneTotal'], 120);
        expect(result['teamTwoTotal'], 62);
      });

      test('failedTeam = null means normal game', () {
        final result = calculator.calculateRoundScores(
          teamOneBase: 100,
          teamTwoBase: 62,
          teamOneCallAmount: 20,
          teamTwoCallAmount: 30,
          failedTeam: null,
        );

        expect(result['teamOneTotal'], 120);
        expect(result['teamTwoTotal'], 92);
      });
    });

    group('Team 1 fall (failedTeam = 0)', () {
      test('team 1 falls - team 2 gets everything', () {
        final result = calculator.calculateRoundScores(
          teamOneBase: 100,
          teamTwoBase: 62,
          teamOneCallAmount: 20,
          teamTwoCallAmount: 30,
          failedTeam: 0,
        );

        expect(result['teamOneTotal'], 0);
        expect(result['teamTwoTotal'], 212); 
      });
    });

    group('Team 2 fall (failedTeam = 1)', () {
      test('team 2 falls - team 1 gets everything', () {
        final result = calculator.calculateRoundScores(
          teamOneBase: 100,
          teamTwoBase: 62,
          teamOneCallAmount: 20,
          teamTwoCallAmount: 30,
          failedTeam: 1,
        );

        expect(result['teamOneTotal'], 212); 
        expect(result['teamTwoTotal'], 0);
      });
    });
  });


  group('Edge cases', () {
    test('all scores zero', () {
      final result = calculator.calculateRoundScores(
        teamOneBase: 0,
        teamTwoBase: 0,
        teamOneCallAmount: 0,
        teamTwoCallAmount: 0,
      );

      expect(result['teamOneTotal'], 0);
      expect(result['teamTwoTotal'], 0);
    });

    test('maximum possible score without fall', () {
      final result = calculator.calculateRoundScores(
        teamOneBase: 162,
        teamTwoBase: 0,
        teamOneCallAmount: 200, 
        teamTwoCallAmount: 0,
      );

      expect(result['teamOneTotal'], 362);
      expect(result['teamTwoTotal'], 0);
    });

    test('large number of rounds - shuffler wrap around', () {
     
      expect(
        calculator.computeShuffler(
          firstShuffler: 1,
          roundIndex: 100,
          gameDirection: 0,
        ),
        1, 
      );
    });
  });


  group('Custom maxScore', () {
    test('calculator with maxScore = 100', () {
      final customCalculator = RoundCalculator(maxScore: 100);
      
      final result = customCalculator.calculateFallScores(
        failedTeam: 0,
        teamOneCallAmount: 20,
        teamTwoCallAmount: 30,
      );

      expect(result['teamTwoTotal'], 150); 
      expect(result['teamTwoBase'], 100);
    });
  });
}
