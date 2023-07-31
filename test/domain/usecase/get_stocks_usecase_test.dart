import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stocks/data/mapper/stocks_data_mapper.dart';
import 'package:stocks/data/mapper/ticker_data_mapper.dart';
import 'package:stocks/data/repository/stocks_repository.dart';
import 'package:stocks/domain/entity/resource.dart';
import 'package:stocks/domain/entity/stock.dart';
import 'package:stocks/domain/repository/stocks_repository.dart';
import 'package:stocks/domain/usecase/get_stocks_usecase.dart';

class StocksRepositoryMock extends Mock implements StocksRepository {}

class StockMock extends Mock implements Stock {}

void main() {
  group('Stocks UseCase', () {
    late StocksRepository stocksRepository;
    late GetStocksUseCase getStocksUseCase;

    late StockMock stock;

    setUp(() {
      stocksRepository = StocksRepositoryMock();
      getStocksUseCase = GetStocksUseCase(stocksRepository);

      stock = StockMock();
    });

    group('constructor', () {
      test('instantiate getStocksUseCase with required parameters', () {
        expect(
          getStocksUseCase,
          isNotNull,
        );
      });
    });

    group('get getPortfolioStocks', () {
      test('call to get error', () async {
        when(
          () => stocksRepository.getPortfolioStocks(),
        ).thenAnswer(
          (_) => Future.value(const ErrorResource('error')),
        );
        final result = await getStocksUseCase.getPortfolioStocks();
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
          () => stocksRepository.getPortfolioStocks(),
        ).thenAnswer(
          (_) => Future.value(SuccessResource([stock])),
        );
        final result = await stocksRepository.getPortfolioStocks();
        expect(
          result.data,
          isNotNull,
        );
        expect(
          result.error,
          null,
        );
      });
    });
  });
}
