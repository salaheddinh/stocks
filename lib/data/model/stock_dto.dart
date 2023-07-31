import 'dart:convert';

class StockDto {
  String symbol;
  String companyName;
  double avgPrice;
  double quantity;
  double ltp;

  StockDto(
      this.symbol, this.companyName, this.avgPrice, this.quantity, this.ltp);

  StockDto.fromMap(Map<String, dynamic> map)
      : symbol = map['symbol'] ?? "",
        companyName = map['companyName'] ?? "",
        avgPrice = map['avgPrice'] ?? 0.0,
        quantity = map['quantity'] ?? 0.0,
        ltp = map['ltp'] ?? 0.0;

  static List<StockDto> toStockList(dynamic map) {
    List<StockDto> myList = [];
    if (map != null) {
      for (dynamic item in map) {
        myList.add(StockDto.fromMap(item));
      }
    }
    return myList;
  }
}
