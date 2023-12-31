package com.salaheddin.stocks.data.dto.tickerChart

data class Meta(
    val chartPreviousClose: Double,
    val currency: String,
    val currentTradingPeriod: CurrentTradingPeriod,
    val dataGranularity: String,
    val exchangeName: String,
    val exchangeTimezoneName: String,
    val firstTradeDate: Int,
    val gmtoffset: Int,
    val instrumentType: String,
    val previousClose: Double,
    val priceHint: Int,
    val range: String,
    val regularMarketPrice: Double,
    val regularMarketTime: Int,
    val scale: Int,
    val symbol: String,
    val timezone: String,
    val tradingPeriods: List<List<TradingPeriod>>,
    val validRanges: List<String>
)