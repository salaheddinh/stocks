package com.salaheddin.stocks.data.network

import com.salaheddin.stocks.data.dto.portfolio.PortfolioStocksResponse
import retrofit2.Response
import retrofit2.http.*

interface MockyApiServices {
    @GET("v3/2b63ba43-6440-4780-aa13-91e6d8247305")
    suspend fun getPortfolioStocks(): Response<PortfolioStocksResponse>
}