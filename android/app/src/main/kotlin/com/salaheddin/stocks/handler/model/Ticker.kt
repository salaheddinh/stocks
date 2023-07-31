package com.salaheddin.stocks.handler.model

import com.salaheddin.stocks.data.dto.tickerChart.TickerResult

data class Ticker(
    val symbol: String,
    val regularMarketPrice: Double,
    val chartPreviousClose: Double,
    val previousClose: Double,
    val values: List<Double>,
)

fun TickerResult.toTicker(): Ticker {
    return Ticker(
        symbol = meta.symbol,
        regularMarketPrice = meta.regularMarketPrice,
        chartPreviousClose = meta.chartPreviousClose,
        previousClose = meta.previousClose,
        values = indicators.quote[0].close,
    )
}