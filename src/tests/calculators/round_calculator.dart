import 'package:bela_blok/common/constants.dart';


class RoundCalculator {
  
  final int maxScore;


  RoundCalculator({this.maxScore = maxScoreConst});

  int calculateDifference(int a, int b) {
    return a - b;
  }

  
  int calculateTotal(int baseScore, int callAmount) {
    return baseScore + callAmount;
  }

  int sumAllCalls(int teamOneCalls, int teamTwoCalls) {
    return teamOneCalls + teamTwoCalls;
  }

  int computeShuffler({
    required int firstShuffler,
    required int roundIndex,
    required int gameDirection,
    int totalPlayers = 4,
  }) {
    
    final zeroBased = firstShuffler - 1;
    
    int computed;
    if (gameDirection == 0) {
      // Clockwise: 1→2→3→4→1
      computed = (zeroBased + roundIndex) % totalPlayers;
    } else {
      // Counter-clockwise: 1→4→3→2→1
      computed = (zeroBased - roundIndex) % totalPlayers;
      if (computed < 0) {
        computed += totalPlayers;
      }
    }
    
  
    return computed + 1;
  }

 
  bool isTeamFailed(int? failedTeam, int teamIndex) {
    return failedTeam == teamIndex;
  }

  /// Returns 0 because the failed team loses all points.
  int calculateFailedTeamScore() {
    return 0;
  }

 
  int calculateWinnerScoreOnFall(int allCalls) {
    return maxScore + allCalls;
  }

  
  Map<String, int> calculateFallScores({
    required int failedTeam,
    required int teamOneCallAmount,
    required int teamTwoCallAmount,
  }) {
    final allCalls = sumAllCalls(teamOneCallAmount, teamTwoCallAmount);
    final winnerScore = calculateWinnerScoreOnFall(allCalls);
    final failedScore = calculateFailedTeamScore();

    if (failedTeam == 0) {
      // Team 1 failed
      return {
        'teamOneTotal': failedScore,
        'teamTwoTotal': winnerScore,
        'teamOneBase': 0,
        'teamTwoBase': maxScore,
        'teamOneCallAmount': 0,
        'teamTwoCallAmount': allCalls,
      };
    } else {
      // Team 2 failed
      return {
        'teamOneTotal': winnerScore,
        'teamTwoTotal': failedScore,
        'teamOneBase': maxScore,
        'teamTwoBase': 0,
        'teamOneCallAmount': allCalls,
        'teamTwoCallAmount': 0,
      };
    }
  }

  
  Map<String, int> calculateNormalScores({
    required int teamOneBase,
    required int teamTwoBase,
    required int teamOneCallAmount,
    required int teamTwoCallAmount,
  }) {
    return {
      'teamOneTotal': calculateTotal(teamOneBase, teamOneCallAmount),
      'teamTwoTotal': calculateTotal(teamTwoBase, teamTwoCallAmount),
      'teamOneBase': teamOneBase,
      'teamTwoBase': teamTwoBase,
      'teamOneCallAmount': teamOneCallAmount,
      'teamTwoCallAmount': teamTwoCallAmount,
    };
  }

  
  Map<String, int> calculateRoundScores({
    required int teamOneBase,
    required int teamTwoBase,
    required int teamOneCallAmount,
    required int teamTwoCallAmount,
    int? failedTeam,
  }) {
    // Check for fall
    if (isTeamFailed(failedTeam, 0)) {
      return calculateFallScores(
        failedTeam: 0,
        teamOneCallAmount: teamOneCallAmount,
        teamTwoCallAmount: teamTwoCallAmount,
      );
    }
    
    if (isTeamFailed(failedTeam, 1)) {
      return calculateFallScores(
        failedTeam: 1,
        teamOneCallAmount: teamOneCallAmount,
        teamTwoCallAmount: teamTwoCallAmount,
      );
    }
    
    // Normal calculation
    return calculateNormalScores(
      teamOneBase: teamOneBase,
      teamTwoBase: teamTwoBase,
      teamOneCallAmount: teamOneCallAmount,
      teamTwoCallAmount: teamTwoCallAmount,
    );
  }
}


const maxScoreConst = maxScore;
