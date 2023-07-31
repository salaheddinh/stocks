package com.salaheddin.stocks.data.repositories

import com.salaheddin.stocks.data.dto.BaseResponse
import com.salaheddin.stocks.data.dto.tickerChart.TickerDto
import com.salaheddin.stocks.data.network.ResponseHandler
import com.salaheddin.stocks.data.network.YFinanceApiServices
import java.lang.Exception

class TickerRepositoryImpl(
    private val responseHandler: ResponseHandler,
    private val service: YFinanceApiServices
) : TickerRepository {
    override suspend fun getTickerChart(
        ticker: String,
        interval: String,
        range: String,
    ): BaseResponse<TickerDto> {
        val response = service.getTickerChart(ticker, interval, range)
        return if (response.isSuccessful) {
            val body = response.body()!!
            if (body.chart.result != null) {
                responseHandler.handleSuccess(200, body)
            } else {
                responseHandler.handleException(-100, Exception(body.chart.error?.description))
            }
        } else {
            responseHandler.handleException(
                response.code(),
                Exception(response.message())
            )
        }
    }
}