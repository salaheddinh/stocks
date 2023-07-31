class Stock {
  String symbol;
  String companyName;
  double avgPrice;
  double quantity;
  double ltp;
  double totalInvested;
  double currentValue;
  double pAndL;
  double pAndLPercent;

  String get pAndLTotal => "\$${pAndL.toStringAsFixed(2)}(${pAndLPercent >= 0 ? "+" : ""}${pAndLPercent.toStringAsFixed(2)}%)";

  Stock(
    this.symbol,
    this.companyName,
    this.avgPrice,
    this.quantity,
    this.ltp,
    this.totalInvested,
    this.currentValue,
    this.pAndL,
    this.pAndLPercent,
  );
}

