package com.salaheddin.stocks.data.di

import com.salaheddin.stocks.data.repositories.PortfolioStocksRepository
import com.salaheddin.stocks.data.repositories.PortfolioStocksRepositoryImpl
import com.salaheddin.stocks.data.repositories.TickerRepository
import com.salaheddin.stocks.data.repositories.TickerRepositoryImpl
import org.koin.core.qualifier.named
import org.koin.dsl.module

val RepositoryModule = module {
    single<PortfolioStocksRepository>  { PortfolioStocksRepositoryImpl(get(), get(named("Mocky"))) }
    single<TickerRepository>  { TickerRepositoryImpl(get(), get(named("YFinance"))) }
}