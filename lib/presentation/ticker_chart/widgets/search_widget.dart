import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/common/utils/app_values.dart';
import 'package:stocks/common/utils/uppercase_text_formatter.dart';
import 'package:stocks/presentation/ticker_chart/bloc/ticker_details_bloc.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: AppValues.elevation_1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppValues.radius),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppValues.padding),
                child: Focus(
                  onFocusChange: (focused) {},
                  child: TextField(
                    inputFormatters: [
                      UpperCaseTextFormatter(),
                    ],
                    onChanged: (val) {},
                    onEditingComplete: () {
                      final bloc = BlocProvider.of<TickerDetailsBloc>(context);
                      bloc.add(
                          SelectRange(bloc.selectedRange, searchController.text));
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    controller: searchController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'search',
                      contentPadding: const EdgeInsets.all(AppValues.padding),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: const SizedBox(
                            height: AppValues.iconSize_20,
                            width: AppValues.iconSize_20),
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
