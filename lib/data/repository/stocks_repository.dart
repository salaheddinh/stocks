import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stocks/data/mapper/stocks_data_mapper.dart';
import 'package:stocks/data/mapper/ticker_data_mapper.dart';
import 'package:stocks/data/model/stock_dto.dart';
import 'package:stocks/data/model/ticker_data_dto.dart';
import 'package:stocks/domain/entity/resource.dart';
import 'package:stocks/domain/entity/stock.dart';
import 'package:stocks/domain/entity/ticker_data.dart';
import 'package:stocks/domain/repository/stocks_repository.dart';

class StocksRepositoryImpl extends StocksRepository {
  StocksRepositoryImpl(this._stocksDataMapper, this._tickerDataMapper,
      this._getPortfolioChannel, this._getTickerChartChannel);

  final StocksDataMapper _stocksDataMapper;
  final TickerDataMapper _tickerDataMapper;

  /* final getPortfolioChannel =
      const MethodChannel('com.salaheddin.stocks/getStocks');
  final getTickerChartChannel =
      const MethodChannel('com.salaheddin.stocks/getTickerChart');*/

  final MethodChannel _getPortfolioChannel;
  final MethodChannel _getTickerChartChannel;

  @override
  Future<Resource<List<Stock>>> getPortfolioStocks() async {
    var response = await _getPortfolioChannel.invokeMethod("getStocks");
    final status = response["status"];
    switch (status) {
      case "IsError":
        final error = response["error"];
        return ErrorResource(error);
      case "IsSuccess":
        final stockMap = json.decode(response["data"]);
        final stocks =
            _stocksDataMapper.mapToListEntity(StockDto.toStockList(stockMap));
        return SuccessResource(stocks);
      default:
        return const ErrorResource("General Error Occurred");
    }
  }

  @override
  Future<Resource<TickerData>> getTickerChart(
      String ticker, String interval, String range) async {
    var response = await _getTickerChartChannel.invokeMethod("getTickerChart",
        {"ticker": ticker, "interval": interval, "range": range});
    final status = response["status"];
    switch (status) {
      case "IsError":
        final error = response["error"];
        return ErrorResource(error);
      case "IsSuccess":
        final tickerDataMap = json.decode(response["data"]);
        final tickerData = TickerDataDto.fromMap(tickerDataMap);
        return SuccessResource(_tickerDataMapper.mapToEntity(tickerData));
      default:
        return const ErrorResource("General Error Occurred");
    }
  }
}
