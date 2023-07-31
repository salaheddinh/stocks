import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stocks/common/utils/status.dart';
import 'package:stocks/domain/entity/resource.dart';
import 'package:stocks/domain/entity/stock.dart';
import 'package:stocks/domain/entity/stocks_overall_values.dart';
import 'package:stocks/domain/usecase/get_stocks_usecase.dart';
import 'package:stocks/presentation/portfolio/bloc/portfolio_bloc.dart';

class GetStocksUseCaseMock extends Mock implements GetStocksUseCase {}

class StockMock extends Mock implements Stock {}

class StocksOverallValuesMock extends Mock implements StocksOverallValues {}

void main() {
  group('Portfolio Bloc', () {
    late GetStocksUseCase getStocksUseCase;

    late List<StockMock> stocks;
    late StocksOverallValuesMock stocksOverallValues;

    setUp(() {
      getStocksUseCase = GetStocksUseCaseMock();

      stocks = [StockMock()];

      stocksOverallValues = StocksOverallValuesMock();
    });

    test(
      'initial state [AllGamesStatus.initial]',
      () {
        expect(
          PortfolioBloc(getStocksUseCase: getStocksUseCase)
              .state
              .status
              .isInitial,
          isTrue,
        );
      },
    );

    blocTest<PortfolioBloc, PortfolioState>(
      'emits [AllGamesStatus.loading, AllGamesStatus.error]'
      'when repository returns a unsuccessful outcome ',
      setUp: () {
        when(() => getStocksUseCase.getPortfolioStocks()).thenAnswer(
          (_) => Future.value(
            const ErrorResource('error'),
          ),
        );
      },
      build: () => PortfolioBloc(getStocksUseCase: getStocksUseCase),
      act: (bloc) => bloc.add(GetStocks()),
      expect: () => <PortfolioState>[
        const PortfolioState(status: Status.loading),
        const PortfolioState(status: Status.error, errorMsg: 'error'),
      ],
    );

    blocTest<PortfolioBloc, PortfolioState>(
      'emits [AllGamesStatus.loading, AllGamesStatus.success]'
      'when repository returns a successful outcome ',
      setUp: () {
        when(() => getStocksUseCase.getPortfolioStocks()).thenAnswer(
          (_) => Future.value(
            SuccessResource(stocks),
          ),
        );
        when(() => getStocksUseCase.getOverAllValues()).thenAnswer(
          (_) => stocksOverallValues,
        );
      },
      build: () => PortfolioBloc(getStocksUseCase: getStocksUseCase),
      act: (bloc) => bloc.add(GetStocks()),
      expect: () => <PortfolioState>[
        const PortfolioState(status: Status.loading),
        PortfolioState(status: Status.success, stocks: stocks, stocksOverallValues: stocksOverallValues),
      ],
    );
  });
}
