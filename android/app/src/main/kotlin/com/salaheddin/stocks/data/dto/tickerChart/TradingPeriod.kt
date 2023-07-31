package com.salaheddin.stocks.data.dto.tickerChart

data class TradingPeriod(
    val end: Int,
    val gmtoffset: Int,
    val start: Int,
    val timezone: String
)