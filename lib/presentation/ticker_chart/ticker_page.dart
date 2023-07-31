import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/data/repository/stocks_repository.dart';
import 'package:stocks/domain/usecase/get_ticker_data_usecase.dart';
import 'package:stocks/presentation/ticker_chart/bloc/ticker_details_bloc.dart';
import 'package:stocks/presentation/ticker_chart/ticker_layout.dart';

class TickerPage extends StatelessWidget {
  const TickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<TickerDetailsBloc>(
        create: (context) => TickerDetailsBloc(
            getTickerDataUseCase: GetTickerDataUseCase(
                RepositoryProvider.of<StocksRepositoryImpl>(context)))
          ..add(
            SelectRange(Range.oneDay, "TSLA"),
          ),
      ),
    ], child: const TickerLayout());
  }
}
