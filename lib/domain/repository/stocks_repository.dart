import 'package:stocks/domain/entity/resource.dart';
import 'package:stocks/domain/entity/stock.dart';
import 'package:stocks/domain/entity/ticker_data.dart';

abstract class StocksRepository {
  Future<Resource<List<Stock>>> getPortfolioStocks();
  Future<Resource<TickerData>> getTickerChart(String ticker, String interval, String range);
}
