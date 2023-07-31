package com.salaheddin.stocks.data.dto.portfolio

data class PortfolioStockDto(
    var symbol: String,
    var companyName: String,
    var avgPrice: Double,
    var quantity: Double,
    var ltp: Double,
)
