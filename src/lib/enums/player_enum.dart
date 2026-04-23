enum Player {
  P1,
  P2,
  P3,
  P4;

  int get number => index + 1;

  static Player fromNumber(int n) => Player.values[n - 1];
}
