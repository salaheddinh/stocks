class TickerData {
  String symbol;
  double regularMarketPrice;
  double chartPreviousClose;
  double previousClose;
  List<double> values;

  double get differenceToday => regularMarketPrice - chartPreviousClose;
  double get differenceTodayPercent => (differenceToday / regularMarketPrice) * 100;
  String get differenceTodayTotal => "${differenceToday >= 0 ? "+" : ""}\$${differenceToday.toStringAsFixed(2)}(${differenceTodayPercent >= 0 ? "+" : ""}${differenceTodayPercent.toStringAsFixed(2)}%)";

  TickerData(this.symbol,this.regularMarketPrice, this.chartPreviousClose,
      this.previousClose, this.values);

  TickerData.empty()
      : symbol = "",
        regularMarketPrice = 0.0,
        chartPreviousClose = 0.0,
        previousClose = 0.0,
        values = [];
}
