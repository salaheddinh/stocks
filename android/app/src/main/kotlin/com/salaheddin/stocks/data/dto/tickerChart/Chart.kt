package com.salaheddin.stocks.data.dto.tickerChart

data class Chart(
    val error: Error?,
    val result: List<TickerResult>?
)