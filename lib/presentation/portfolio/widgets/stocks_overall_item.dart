import 'package:flutter/material.dart';
import 'package:stocks/common/utils/app_values.dart';

import '../../../domain/entity/stocks_overall_values.dart';

class StocksOverallItem extends StatelessWidget {
  const StocksOverallItem({super.key, required this.stocksOverallValues});

  final StocksOverallValues stocksOverallValues;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.halfPadding),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius),
        ),
        elevation: AppValues.elevation_1,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Total performance",
                          style: TextStyle(
                            fontSize: AppValues.fontSize_16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(stocksOverallValues.overallPAndLTotal)
                      ],
                    ),
                    const Text(
                      "*Till last trading day",
                      style: TextStyle(fontSize: AppValues.fontSize_12),
                    )
                  ],
                ),
                const SizedBox(height: AppValues.halfPadding),
                Row(
                  children: [
                    const Text(
                      "Today's performance",
                      style: TextStyle(
                        fontSize: AppValues.fontSize_16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(stocksOverallValues.todayPAndLTotal)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
