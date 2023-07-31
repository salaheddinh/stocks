import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/data/mapper/stocks_data_mapper.dart';
import 'package:stocks/data/mapper/ticker_data_mapper.dart';
import 'package:stocks/data/repository/stocks_repository.dart';
import 'package:stocks/presentation/portfolio/portfolio_page.dart';
import 'package:stocks/presentation/ticker_chart/ticker_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentPageIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TickerPage(),
    PortfolioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => StocksRepositoryImpl(
        StocksDataMapper(),
        TickerDataMapper(),
        const MethodChannel('com.salaheddin.stocks/getStocks'),
        const MethodChannel('com.salaheddin.stocks/getTickerChart'),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Stocks",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_currentPageIndex),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.compare_arrows), label: "Stocks"),
            NavigationDestination(
                icon: Icon(Icons.add_chart_rounded), label: "Portfolio"),
          ],
          selectedIndex: _currentPageIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
