import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/common/utils/status.dart';
import 'package:stocks/domain/entity/resource.dart';
import 'package:stocks/domain/entity/stock.dart';
import 'package:stocks/domain/usecase/get_stocks_usecase.dart';

import '../../../domain/entity/stocks_overall_values.dart';

part 'portfolio_event.dart';

part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({required this.getStocksUseCase})
      : super(const PortfolioState()) {
    on<GetStocks>(_mapGetPortfolioEventToState);
  }

  final GetStocksUseCase getStocksUseCase;

  void _mapGetPortfolioEventToState(
      GetStocks event, Emitter<PortfolioState> emit) async {
    emit(const PortfolioState(status: Status.loading));
    try {
      final result = await getStocksUseCase.getPortfolioStocks();
      if (result is SuccessResource) {
        emit(PortfolioState(
            status: Status.success,
            stocks: result.data,
            stocksOverallValues: getStocksUseCase.getOverAllValues()));
      } else if (result is ErrorResource) {
        emit(PortfolioState(
            status: Status.error, errorMsg: result.error));
      } else {
        emit(const PortfolioState(status: Status.initial));
      }
    } catch (error) {
      emit(const PortfolioState(status: Status.error, errorMsg: "General Error Occurred"));
    }
  }
}
