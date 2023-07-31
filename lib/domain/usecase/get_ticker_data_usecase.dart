import 'package:stocks/domain/entity/resource.dart';
import 'package:stocks/domain/entity/ticker_data.dart';
import 'package:stocks/domain/repository/stocks_repository.dart';

class GetTickerDataUseCase {
  final StocksRepository _repository;

  GetTickerDataUseCase(this._repository);

  Future<Resource<TickerData>> getTickerChart(
      String ticker, String interval, String range) async {
    var response = await _repository.getTickerChart(ticker, interval, range);
    return response;
  }
}
