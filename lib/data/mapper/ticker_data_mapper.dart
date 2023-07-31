import 'package:stocks/data/model/stock_dto.dart';
import 'package:stocks/data/model/ticker_data_dto.dart';
import 'package:stocks/domain/entity/stock.dart';
import 'package:stocks/domain/entity/ticker_data.dart';

import 'base_data_mapper.dart';

class TickerDataMapper extends BaseDataMapper<TickerDataDto, TickerData> {
  @override
  TickerData mapToEntity(TickerDataDto data) {
    final values = data.values.whereType<double>().toList();
    return TickerData(data.symbol, data.regularMarketPrice,
        data.chartPreviousClose, data.previousClose, values);
  }
}
