class StatsUtils {
  /// Calculates success rate percentage based on calls and fails
  static int calculateSuccessRate(dynamic calls, dynamic fails) {
    final c = (calls ?? 0) is int ? (calls ?? 0) : int.tryParse((calls ?? '0').toString()) ?? 0;
    final f = (fails ?? 0) is int ? (fails ?? 0) : int.tryParse((fails ?? '0').toString()) ?? 0;
    if (c == 0) return 0;
    return (((c - f) / c) * 100).round();
  }
}
