import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/common/utils/app_values.dart';
import 'package:stocks/common/utils/status.dart';
import 'package:stocks/common/widget/error_widget.dart';
import 'package:stocks/presentation/ticker_chart/bloc/ticker_details_bloc.dart';
import 'package:stocks/presentation/ticker_chart/widgets/chart_widget.dart';
import 'package:stocks/presentation/ticker_chart/widgets/range_selector_widget.dart';
import 'package:stocks/presentation/ticker_chart/widgets/search_widget.dart';
import 'package:stocks/presentation/ticker_chart/widgets/ticker_info_widget.dart';

class TickerLayout extends StatelessWidget {
  const TickerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TickerDetailsBloc, TickerDetailsState>(
      listenWhen: (previous, current) => current is RangeSelectorState,
      listener: (context, state) {
        if (state is RangeSelectorState) {
          BlocProvider.of<TickerDetailsBloc>(context).add(GetTickerChart(
              state.ticker, state.interval.value, state.range.value));
        }
      },
      child: Column(
        children: [
          SearchWidget(),
          BlocBuilder<TickerDetailsBloc, TickerDetailsState>(
              buildWhen: (previous, current) => current is TickerChartState,
              builder: (context, state) {
                if (state is TickerChartState) {
                  switch (state.status) {
                    case Status.initial:
                      return Container();
                    case Status.success:
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppValues.padding,
                            horizontal: AppValues.halfPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TickerInfoWidget(tickerData: state.ticker),
                            ),
                            AspectRatio(
                                aspectRatio: 1.7,
                                child: ChartWidget(
                                  values: state.ticker.values,
                                )),
                          ],
                        ),
                      );
                    case Status.error:
                      return SizedBox(
                        height: 370,
                        child: Center(
                          child: ErrorItem(
                            msg: state.errorMsg,
                            retry: () {
                              final bloc = BlocProvider.of<TickerDetailsBloc>(context);
                              bloc.add(GetTickerChart(bloc.selectedTicker, "1mo", bloc.selectedRange.value));
                            },
                          ),
                        ),
                      );
                    case Status.loading:
                      return const SizedBox(
                        height: 370,
                        child: Center(child: CircularProgressIndicator()),
                      );
                  }
                } else {
                  return Container();
                }
              }),
          const RangeSelectorWidget(),
        ],
      ),
    );
  }
}
