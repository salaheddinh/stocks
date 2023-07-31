import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/common/utils/app_values.dart';
import 'package:stocks/presentation/ticker_chart/bloc/ticker_details_bloc.dart';

class IntervalItem extends StatelessWidget {
  const IntervalItem(
      {super.key, required this.range, required this.isSelected});

  final Range range;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final bloc = BlocProvider.of<TickerDetailsBloc>(context);
        bloc.add(SelectRange(range, bloc.selectedTicker));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppValues.radius)))
            : null,
        child: Text(
          range.value,
          style: isSelected
              ? const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold)
              : const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
