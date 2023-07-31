part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  const PortfolioState({
    this.status = Status.initial,
    List<Stock>? stocks,
    StocksOverallValues? stocksOverallValues,
    String? errorMsg,
  })  : stocks = stocks ?? const [],
        stocksOverallValues =
            stocksOverallValues ?? const StocksOverallValues.empty(),
        errorMsg = errorMsg ?? "";

  final List<Stock> stocks;
  final StocksOverallValues stocksOverallValues;
  final String errorMsg;
  final Status status;

  @override
  List<Object?> get props => [stocks, stocksOverallValues, errorMsg, status];
}
