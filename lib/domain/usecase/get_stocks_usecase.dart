import 'package:stocks/domain/entity/resource.dart';
import 'package:stocks/domain/entity/stock.dart';
import 'package:stocks/domain/entity/stocks_overall_values.dart';
import 'package:stocks/domain/repository/stocks_repository.dart';

class GetStocksUseCase {
  final StocksRepository _repository;
  var _allStocks = <Stock>[];

  GetStocksUseCase(this._repository);

  Future<Resource<List<Stock>>> getPortfolioStocks() async {
    var response = await _repository.getPortfolioStocks();
    _allStocks = response.data ?? [];
    return response;
  }

  StocksOverallValues getOverAllValues() {
    var overallCurrentValue = 0.0;
    var totalInvestedAmount = 0.0;
    var todayPAndL = 0.0;

    _allStocks.forEach((element) {
      overallCurrentValue += element.currentValue;
      totalInvestedAmount += element.totalInvested;
      todayPAndL += element.pAndL;
    });

    final overallPAndL = overallCurrentValue - totalInvestedAmount;
    final overallPAndLPercent = (overallPAndL / totalInvestedAmount) * 100;
    final todayPAndLPercent = (todayPAndL / totalInvestedAmount) * 100;

    return StocksOverallValues(overallPAndL, overallPAndLPercent, todayPAndL, todayPAndLPercent);
  }
}
