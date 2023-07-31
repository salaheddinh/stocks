import 'package:stocks/data/model/stock_dto.dart';
import 'package:stocks/domain/entity/stock.dart';

import 'base_data_mapper.dart';

class StocksDataMapper extends BaseDataMapper<StockDto, Stock> {
  @override
  Stock mapToEntity(StockDto data) {
    final totalInvested = data.quantity * data.avgPrice;
    final currentValue = data.quantity * data.ltp;
    final pAndL = currentValue - totalInvested;
    final pAndLPercent = (pAndL / totalInvested) * 100;
    return Stock(data.symbol, data.companyName, data.avgPrice, data.quantity,
        data.ltp, totalInvested, currentValue, pAndL, pAndLPercent);
  }
}
