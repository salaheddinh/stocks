import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/common/utils/status.dart';

import '../../common/widget/error_widget.dart';
import 'bloc/portfolio_bloc.dart';
import 'widgets/stock_item.dart';
import 'widgets/stocks_overall_item.dart';

class PortfolioLayout extends StatelessWidget {
  const PortfolioLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return Container();
          case Status.success:
            return SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  StocksOverallItem(
                      stocksOverallValues: state.stocksOverallValues),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.stocks.length,
                    itemBuilder: (context, index) {
                      return StockItem(stock: state.stocks[index]);
                    },
                  ),
                ],
              ),
            );
          case Status.error:
            return Center(
              child: ErrorItem(
                msg: state.errorMsg,
                retry: () {
                  BlocProvider.of<PortfolioBloc>(context).add(GetStocks());
                },
              ),
            );
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
