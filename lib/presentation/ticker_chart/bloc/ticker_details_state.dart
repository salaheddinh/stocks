part of 'ticker_details_bloc.dart';

enum Range {
  oneDay("1d"),
  oneWeek("5d"),
  oneMonth("1mo"),
  threeMonth("3mo"),
  oneYear("1y"),
  fiveYear("5y");

  const Range(this.value);

  final String value;
}

enum Interval {
  oneMinutes("1m"),
  fiveMinutes("5m"),
  ninetyMinutes("90m"),
  oneHour("1h"),
  oneDay("1d"),
  oneMonth("1mo");

  const Interval(this.value);

  final String value;
}

class TickerDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TickerChartState extends TickerDetailsState {
  TickerChartState({
    this.status = Status.initial,
    TickerData? ticker,
    String? errorMsg,
  })
      : ticker = ticker ?? TickerData.empty(),
        errorMsg = errorMsg ?? "";

  final TickerData ticker;
  final String errorMsg;
  final Status status;

  @override
  List<Object?> get props => [ticker, errorMsg, status];

  TickerChartState copyWith({
    TickerData? ticker,
    String? errorMsg,
    Status? status,
  }) {
    return TickerChartState(
      ticker: ticker ?? this.ticker,
      errorMsg: errorMsg ?? this.errorMsg,
      status: status ?? this.status,
    );
  }
}

class RangeSelectorState extends TickerDetailsState {
  RangeSelectorState({
    String? ticker,
    Range? range,
    Interval? interval,
  })  : ticker = ticker ?? "",
        range = range ?? Range.oneMonth,
        interval = interval ?? Interval.ninetyMinutes;

  factory RangeSelectorState.toRange(Range range, String ticker) {
    var interval = Interval.oneMinutes;
    switch (range) {
      case Range.oneDay:
        interval = Interval.oneMinutes;
        break;
      case Range.oneWeek:
        interval = Interval.fiveMinutes;
        break;
      case Range.oneMonth:
        interval = Interval.ninetyMinutes;
        break;
      case Range.threeMonth:
        interval = Interval.oneHour;
        break;
      case Range.oneYear:
        interval = Interval.oneDay;
        break;
      case Range.fiveYear:
        interval = Interval.oneMonth;
        break;
    }
    return RangeSelectorState(ticker: ticker, range: range, interval: interval);
  }

  final String ticker;
  final Range range;
  final Interval interval;

  @override
  List<Object?> get props => [range, interval, ticker];
}
