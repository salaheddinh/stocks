package com.salaheddin.stocks.data.network

import com.salaheddin.stocks.data.dto.tickerChart.TickerDto
import retrofit2.Response
import retrofit2.http.*

interface YFinanceApiServices {
    @GET("v8/finance/chart/{ticker}")
    suspend fun getTickerChart(
        @Path("ticker") ticker: String,
        @Query("interval") interval: String,
        @Query("range") range: String,
    ): Response<TickerDto>
}