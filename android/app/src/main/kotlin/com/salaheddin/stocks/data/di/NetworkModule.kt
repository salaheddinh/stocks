package com.salaheddin.stocks.data.di

import com.salaheddin.stocks.data.network.ResponseHandler
import com.salaheddin.stocks.data.network.getMockyBaseURL
import com.salaheddin.stocks.data.network.getYFinanceBaseURL
import com.salaheddin.stocks.data.network.provideMockyAPI
import com.salaheddin.stocks.data.network.provideOkHttpClient
import com.salaheddin.stocks.data.network.provideRetrofit
import com.salaheddin.stocks.data.network.provideYFinanceAPI
import org.koin.core.qualifier.named
import org.koin.dsl.module

val NetworkModule = module {
    single(named("Mocky")) {getMockyBaseURL()}
    single(named("YFinance")) {getYFinanceBaseURL()}

    factory { provideOkHttpClient() }

    factory(named("Mocky")) { provideRetrofit(get(), get(named("Mocky"))) }
    factory(named("YFinance")) { provideRetrofit(get(), get(named("YFinance"))) }

    factory(named("Mocky")) { provideMockyAPI(get(named("Mocky"))) }
    factory(named("YFinance")) { provideYFinanceAPI(get(named("YFinance"))) }

    factory { ResponseHandler() }
}