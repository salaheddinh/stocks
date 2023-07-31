class TickerDataDto {
  String symbol;
  double regularMarketPrice;
  double chartPreviousClose;
  double previousClose;
  List<double?> values;

  TickerDataDto(this.symbol,this.regularMarketPrice, this.chartPreviousClose,
      this.previousClose, this.values);

  TickerDataDto.fromMap(Map<String, dynamic> map)
      : symbol = map['symbol'] ?? 0.0,
        regularMarketPrice = map['regularMarketPrice'] ?? 0.0,
        chartPreviousClose = map['chartPreviousClose'] ?? 0.0,
        previousClose = map['previousClose'] ?? 0.0,
        values = List<double?>.from(map['values'] ?? []);
}
