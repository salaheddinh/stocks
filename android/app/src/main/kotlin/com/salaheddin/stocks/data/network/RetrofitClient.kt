package com.salaheddin.stocks.data.network

import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit

const val MOCKY = "Mocky"
const val YFINANCE = "YFinance"

fun provideRetrofit(okHttpClient: OkHttpClient, baseURL: String): Retrofit {
    return Retrofit.Builder()
        .baseUrl(baseURL)
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
}

fun getMockyBaseURL(): String {
    return "https://run.mocky.io/"
}

fun getYFinanceBaseURL(): String {
    return "https://query1.finance.yahoo.com/"
}

fun provideOkHttpClient(): OkHttpClient {
    return OkHttpClient()
        .newBuilder()
        .addInterceptor { chain ->
            val original = chain.request()
            val requestBuilder = original.newBuilder()
                .addHeader("Content-Type", "application/json")
            val request = requestBuilder.build()
            chain.proceed(request)
        }
        .connectTimeout(60, TimeUnit.SECONDS)
        .readTimeout(60, TimeUnit.SECONDS)
        .writeTimeout(60, TimeUnit.SECONDS)
        .build()
}

fun provideMockyAPI(retrofit: Retrofit): MockyApiServices = retrofit.create(MockyApiServices::class.java)
fun provideYFinanceAPI(retrofit: Retrofit): YFinanceApiServices = retrofit.create(YFinanceApiServices::class.java)


