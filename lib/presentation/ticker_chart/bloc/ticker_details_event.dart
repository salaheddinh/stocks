part of 'ticker_details_bloc.dart';

class TickerDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTickerChart extends TickerDetailsEvent {
  final String ticker;
  final String interval;
  final String range;

  GetTickerChart(this.ticker, this.interval, this.range);

  @override
  List<Object?> get props => [ticker, interval, range];
}

class SelectRange extends TickerDetailsEvent {
  final Range range;
  final String ticker;

  SelectRange(this.range, this.ticker);

  @override
  List<Object?> get props => [range, ticker];
}