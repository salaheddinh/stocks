import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/data/repository/stocks_repository.dart';
import 'package:stocks/domain/usecase/get_stocks_usecase.dart';

import 'bloc/portfolio_bloc.dart';
import 'portfolio_layout.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PortfolioBloc>(
      create: (context) => PortfolioBloc(
          getStocksUseCase: GetStocksUseCase(
              RepositoryProvider.of<StocksRepositoryImpl>(context)))
        ..add(
          GetStocks(),
        ),
      child: const PortfolioLayout(),
    );
  }
}
