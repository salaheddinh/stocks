import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stocks/data/mapper/stocks_data_mapper.dart';
import 'package:stocks/data/mapper/ticker_data_mapper.dart';
import 'package:stocks/data/repository/stocks_repository.dart';
import 'package:stocks/domain/entity/stock.dart';
import 'package:stocks/domain/repository/stocks_repository.dart';

class StocksDataMapperMock extends Mock implements StocksDataMapper {}

class TickerDataMapperMock extends Mock implements TickerDataMapper {}

class PortfolioChannelMock extends Mock implements MethodChannel {}

class TickerChartChannelMock extends Mock implements MethodChannel {}

class StockMock extends Mock implements Stock {}

void main() {
  group('Stocks Repository', () {
    late StocksDataMapper stocksDataMapper;
    late TickerDataMapper tickerDataMapper;
    late MethodChannel getPortfolioChannel;
    late MethodChannel getTickerChartChannel;

    late StocksRepository stocksRepository;

    late StockMock stock;

    setUp(() {
      stocksDataMapper = StocksDataMapperMock();
      tickerDataMapper = TickerDataMapperMock();
      getPortfolioChannel = PortfolioChannelMock();
      getTickerChartChannel = TickerChartChannelMock();
      stocksRepository = StocksRepositoryImpl(stocksDataMapper,
          tickerDataMapper, getPortfolioChannel, getTickerChartChannel);

      stock = StockMock();
    });

    group('constructor', () {
      test('instantiate stocksRepository with required parameters', () {
        expect(
          stocksRepository,
          isNotNull,
        );
      });
    });

    group('get getPortfolioStocks', () {
      test('call to get error', () async {
        when(
          () => getPortfolioChannel.invokeMethod("getStocks"),
        ).thenAnswer(
          (_) => Future.value(
             <String, String>{
              'status': 'IsError',
              'error': 'error',
            },
          ),
        );
        final result = await stocksRepository.getPortfolioStocks();
        expect(
          result.data,
          null,
        );
        expect(
          result.error,
          'error',
        );
      });

      test('call to get success', () async {
        when(
          () => getPortfolioChannel.invokeMethod("getStocks"),
        ).thenAnswer(
          (_) => Future.value(
             <String, String>{
              'status': 'IsSuccess',
              'data': '[{"avgPrice":100.1,"companyName":"Apple","ltp":123.45,"quantity":10.2,"symbol":"APPL"}]',
            },
          ),
        );
        when(
              () => stocksDataMapper.mapToListEntity(any()),
        ).thenAnswer(
              (_) => <Stock>[
                stock
              ],
        );
        final result = await stocksRepository.getPortfolioStocks();
        expect(
          result.data,
          isNotNull,
        );
      });
    });
  });
}
