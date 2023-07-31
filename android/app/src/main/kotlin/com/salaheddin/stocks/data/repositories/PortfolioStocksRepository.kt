package com.salaheddin.stocks.data.repositories

import com.salaheddin.stocks.data.dto.BaseResponse
import com.salaheddin.stocks.data.dto.portfolio.PortfolioStocksResponse

interface PortfolioStocksRepository {
    suspend fun getAllStocks() : BaseResponse<PortfolioStocksResponse>
}