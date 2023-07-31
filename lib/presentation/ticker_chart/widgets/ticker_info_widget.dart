import 'package:flutter/material.dart';
import 'package:stocks/domain/entity/ticker_data.dart';

class TickerInfoWidget extends StatelessWidget {
  const TickerInfoWidget({super.key, required this.tickerData});

  final TickerData tickerData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tickerData.symbol,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '\$${tickerData.regularMarketPrice}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: tickerData.differenceTodayTotal,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                  text: ' Today',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
