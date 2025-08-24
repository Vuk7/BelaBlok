class GameStats {
  final int totalRounds;
  final double averageScore;
  final String? winner;

  final int teamOneCalls;
  final int teamTwoCalls;
  final int teamOneFails;
  final int teamTwoFails;
  final int teamOneDeclarations;
  final int teamTwoDeclarations;

  const GameStats({
    required this.totalRounds,
    required this.averageScore,
    this.winner,
    required this.teamOneCalls,
    required this.teamTwoCalls,
    required this.teamOneFails,
    required this.teamTwoFails,
    required this.teamOneDeclarations,
    required this.teamTwoDeclarations,
  });


}
