package com.salaheddin.stocks.data.repositories

import com.salaheddin.stocks.data.dto.BaseResponse
import com.salaheddin.stocks.data.dto.tickerChart.TickerDto
import com.salaheddin.stocks.data.dto.tickerChart.TickerResult

interface TickerRepository {
    suspend fun getTickerChart(
        ticker: String,
        interval: String,
        range: String,
    ): BaseResponse<TickerDto>
}