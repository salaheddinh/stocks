import 'package:flutter/material.dart';
import 'package:stocks/common/utils/app_values.dart';

import 'spaces.dart';

class ErrorItem extends StatelessWidget {
  const ErrorItem({super.key, required this.msg, required this.retry});

  final String msg;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          msg,
          style: const TextStyle(fontSize: AppValues.fontSize_20),
        ),
        const VerticalSpace(),
        Container(
          decoration: BoxDecoration(
            borderRadius:
            const BorderRadius.all(Radius.circular(AppValues.radius)),
            shape: BoxShape.rectangle,
            color: Theme.of(context).primaryColor,
          ),
          child: GestureDetector(
            onTap: retry,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppValues.largePadding,
                  vertical: AppValues.halfPadding),
              child: Text(
                'retry',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: AppValues.fontSize_16
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
