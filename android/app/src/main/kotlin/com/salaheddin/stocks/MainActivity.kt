package com.salaheddin.stocks

import androidx.annotation.NonNull
import androidx.lifecycle.lifecycleScope
import com.salaheddin.stocks.handler.PortfolioStocksHandler
import com.salaheddin.stocks.handler.TickersHandler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.launch
import org.koin.android.ext.android.inject

class MainActivity : FlutterActivity() {
    private val GET_STOCKS_CHANNEL_NAME = "com.salaheddin.stocks/getStocks"
    private val GET_TICKER_CHART_CHANNEL_NAME = "com.salaheddin.stocks/getTickerChart"

    private var getStocksChannel: MethodChannel? = null
    private val portfolioStocksHandler: PortfolioStocksHandler by inject()

    private var getTickerChartChannel: MethodChannel? = null
    private val tickersHandler: TickersHandler by inject()

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        setupChannels(flutterEngine.dartExecutor.binaryMessenger)
    }

    override fun onDestroy() {
        teardownChannels()
        super.onDestroy()
    }

    private fun setupChannels(messenger: BinaryMessenger) {
        getStocksChannel = MethodChannel(messenger, GET_STOCKS_CHANNEL_NAME)
        getStocksChannel?.setMethodCallHandler { call, result ->
            if (call.method == "getStocks") {
                lifecycleScope.launch {
                    val response = portfolioStocksHandler.getStocks()
                    result.success(response)
                }
            } else {
                result.notImplemented()
            }
        }

        getTickerChartChannel = MethodChannel(messenger, GET_TICKER_CHART_CHANNEL_NAME)
        getTickerChartChannel?.setMethodCallHandler { call, result ->
            if (call.method == "getTickerChart") {
                val ticker: String? = call.argument("ticker")
                val interval: String? = call.argument("interval")
                val range: String? = call.argument("range")
                lifecycleScope.launch {
                    val response =
                        tickersHandler.getTickerChart(ticker ?: "", interval ?: "1m", range ?: "1d")
                    result.success(response)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun teardownChannels() {
        getStocksChannel!!.setMethodCallHandler(null)
        getTickerChartChannel!!.setMethodCallHandler(null)
    }
}