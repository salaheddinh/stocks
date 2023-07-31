package com.salaheddin.stocks.data.dto.tickerChart

data class Quote(
    val close: List<Double>,
    val high: List<Double>,
    val low: List<Double>,
    val `open`: List<Double>,
    val volume: List<Long>
)