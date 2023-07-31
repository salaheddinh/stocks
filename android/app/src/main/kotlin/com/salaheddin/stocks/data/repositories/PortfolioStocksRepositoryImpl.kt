package com.salaheddin.stocks.data.repositories

import com.salaheddin.stocks.data.dto.BaseResponse
import com.salaheddin.stocks.data.dto.portfolio.PortfolioStocksResponse
import com.salaheddin.stocks.data.network.MockyApiServices
import com.salaheddin.stocks.data.network.ResponseHandler
import java.lang.Exception

class PortfolioStocksRepositoryImpl(
    private val responseHandler: ResponseHandler,
    private val service: MockyApiServices
) : PortfolioStocksRepository {
    override suspend fun getAllStocks(): BaseResponse<PortfolioStocksResponse> {
        val response = service.getPortfolioStocks()
        return if (response.isSuccessful) {
            val body = response.body()!!
            responseHandler.handleSuccess(200, body)
        } else {
            responseHandler.handleException(
                response.code(),
                Exception(response.message())
            )
        }
    }
}