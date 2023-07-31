package com.salaheddin.stocks.handler.di

import com.salaheddin.stocks.handler.PortfolioStocksHandler
import com.salaheddin.stocks.handler.TickersHandler
import org.koin.dsl.module

val HandlerModule = module {
    factory { PortfolioStocksHandler(get()) }
    factory { TickersHandler(get()) }
}