import 'package:flutter/material.dart';
import 'package:stocks/common/utils/app_values.dart';

class VerticalSpace extends StatelessWidget {
  final double space;

  const VerticalSpace(
      {Key? key,
        this.space = AppValues.padding,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}

class HorizontalSpace extends StatelessWidget {
  final double space;

  const HorizontalSpace(
      {Key? key,
        this.space = AppValues.padding,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }
}
