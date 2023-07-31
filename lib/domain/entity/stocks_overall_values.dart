class StocksOverallValues {
  final double overallPAndL;
  final double overallPAndLPercent;
  final double todayPAndL;
  final double todayPAndLPercent;

  String get overallPAndLTotal => "\$${overallPAndL.toStringAsFixed(2)}(${overallPAndLPercent >= 0 ? "+" : ""}${overallPAndLPercent.toStringAsFixed(2)}%)";
  String get todayPAndLTotal => "\$${todayPAndL.toStringAsFixed(2)}(${todayPAndLPercent >= 0 ? "+" : ""}${todayPAndLPercent.toStringAsFixed(2)}%)";

  const StocksOverallValues(
    this.overallPAndL,
    this.overallPAndLPercent,
    this.todayPAndL,
    this.todayPAndLPercent,
  );

  const StocksOverallValues.empty()
      : overallPAndL = 0.0,
        overallPAndLPercent = 0.0,
        todayPAndL = 0.0,
        todayPAndLPercent = 0.0;

  StocksOverallValues.fromMap(Map<String, dynamic> map)
      : overallPAndL = map['overallPAndL'] ?? "",
        overallPAndLPercent = map['overallPAndLPercent'] ?? "",
        todayPAndL = map['todayPAndL'] ?? 0.0,
        todayPAndLPercent = map['todayPAndLPercent'] ?? 0.0;
}
