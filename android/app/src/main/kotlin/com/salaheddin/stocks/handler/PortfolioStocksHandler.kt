package com.salaheddin.stocks.handler

import com.google.gson.Gson
import com.salaheddin.stocks.data.repositories.PortfolioStocksRepository

class PortfolioStocksHandler(private val repository: PortfolioStocksRepository) {

    suspend fun getStocks(): HashMap<String, String?> {
        val response = repository.getAllStocks()
        return if (response.data == null) {
            hashMapOf(
                "status" to "IsError",
                "error" to (response.message ?: "General Error Occurred"),
            )
        } else {
            val gson = Gson()
            val stocks = gson.toJson(response.data.stocks)
            hashMapOf(
                "status" to "IsSuccess",
                "data" to stocks,
            )
        }
    }
}