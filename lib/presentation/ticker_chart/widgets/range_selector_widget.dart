import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/presentation/ticker_chart/bloc/ticker_details_bloc.dart';
import 'package:stocks/presentation/ticker_chart/widgets/range_item.dart';

class RangeSelectorWidget extends StatelessWidget {
  const RangeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TickerDetailsBloc, TickerDetailsState>(
        buildWhen: (previous, current) => current is RangeSelectorState,
        builder: (context, state) {
          if (state is RangeSelectorState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IntervalItem(
                  range: Range.oneDay,
                  isSelected: state.range.value == Range.oneDay.value,
                ),
                IntervalItem(
                  range: Range.oneWeek,
                  isSelected: state.range.value == Range.oneWeek.value,
                ),
                IntervalItem(
                  range: Range.oneMonth,
                  isSelected: state.range.value == Range.oneMonth.value,
                ),
                IntervalItem(
                  range: Range.threeMonth,
                  isSelected: state.range.value == Range.threeMonth.value,
                ),
                IntervalItem(
                  range: Range.oneYear,
                  isSelected: state.range.value == Range.oneYear.value,
                ),
                IntervalItem(
                  range: Range.fiveYear,
                  isSelected: state.range.value == Range.fiveYear.value,
                ),
              ],
            );
          } else {
            return Container();
          }
    });
  }
}

Widget getTextWidgets(List<String> strings) {
  List<Widget> list = <Widget>[];
  for (var i = 0; i < 5; i++) {
    list.add(Text(strings[i]));
  }
  return Row(children: list);
}
