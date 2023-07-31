import 'package:flutter/material.dart';
import 'package:stocks/common/utils/app_values.dart';
import 'package:stocks/domain/entity/stock.dart';

class StockItem extends StatelessWidget {
  const StockItem({super.key, required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppValues.halfPadding,
          left: AppValues.halfPadding,
          right: AppValues.halfPadding),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius),
        ),
        elevation: AppValues.elevation_1,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    stock.companyName,
                    style: const TextStyle(
                        fontSize: AppValues.fontSize_18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    stock.pAndLTotal,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Invested \$${stock.totalInvested.toStringAsFixed(2)}",
                  ),
                  const Spacer(),
                  Text(
                    "\$${stock.avgPrice.toStringAsFixed(2)} Avg",
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Quantity ${stock.quantity}",
                  ),
                  const Spacer(),
                  Text(
                    "\$${stock.ltp.toStringAsFixed(2)} LTP",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
