package com.salaheddin.stocks.handler

import com.google.gson.Gson
import com.salaheddin.stocks.data.repositories.TickerRepository
import com.salaheddin.stocks.handler.model.toTicker

class TickersHandler(private val repository: TickerRepository) {

    suspend fun getTickerChart(
        ticker: String, interval: String, range: String,
    ): HashMap<String, String?> {
        val response = repository.getTickerChart(ticker, interval, range)
        return if (response.data == null) {
            hashMapOf(
                "status" to "IsError",
                "error" to (response.message ?: "General Error Occurred"),
            )
        } else {
            val tickerData = response.data.chart.result?.get(0)?.toTicker()
            val gson = Gson()
            val data = gson.toJson(tickerData)
            hashMapOf(
                "status" to "IsSuccess",
                "data" to data,
            )
        }
    }
}