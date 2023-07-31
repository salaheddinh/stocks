package com.salaheddin.stocks.data.dto.tickerChart

data class TickerResult(
    val indicators: Indicators,
    val meta: Meta,
    val timestamp: List<Int>
)