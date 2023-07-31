import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/common/utils/status.dart';
import 'package:stocks/domain/entity/resource.dart';
import 'package:stocks/domain/entity/ticker_data.dart';
import 'package:stocks/domain/usecase/get_ticker_data_usecase.dart';

part 'ticker_details_event.dart';

part 'ticker_details_state.dart';

class TickerDetailsBloc extends Bloc<TickerDetailsEvent, TickerDetailsState> {
  TickerDetailsBloc({required GetTickerDataUseCase getTickerDataUseCase})
      : _getTickerDataUseCase = getTickerDataUseCase,
        super(TickerDetailsState()) {
    on<GetTickerChart>(_mapGetTickerDetailsEventToState);
    on<SelectRange>(_mapSelectRangEventToState);
  }

  String _selectedTicker = "";
  Range _selectedRange = Range.oneDay;

  get selectedTicker => _selectedTicker;

  get selectedRange => _selectedRange;

  final GetTickerDataUseCase _getTickerDataUseCase;

  void _mapGetTickerDetailsEventToState(
      GetTickerChart event, Emitter<TickerDetailsState> emit) async {
    emit(TickerChartState(status: Status.loading));
    try {
      final result = await _getTickerDataUseCase.getTickerChart(
          event.ticker, event.interval, event.range);
      if (result is SuccessResource) {
        emit(TickerChartState(status: Status.success, ticker: result.data));
      } else if (result is ErrorResource) {
        emit(TickerChartState(status: Status.error, errorMsg: result.error));
      } else {
        emit(TickerChartState(status: Status.initial));
      }
    } catch (error) {
      emit(TickerChartState(
          status: Status.error, errorMsg: "General Error Occurred"));
    }
  }

  void _mapSelectRangEventToState(SelectRange event, Emitter<TickerDetailsState> emit) {
    _selectedTicker = event.ticker;
    _selectedRange = event.range;
    emit(RangeSelectorState.toRange(selectedRange, selectedTicker));
  }
}
