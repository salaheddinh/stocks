package com.salaheddin.stocks.handler

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import com.google.gson.reflect.TypeToken
import com.salaheddin.stocks.utils.MainCoroutineRule
import com.salaheddin.stocks.data.dto.BaseResponse
import com.salaheddin.stocks.data.dto.portfolio.PortfolioStocksResponse
import com.salaheddin.stocks.data.repositories.PortfolioStocksRepository
import com.salaheddin.stocks.utils.jsonToWord
import com.salaheddin.stocks.utils.mockyData
import kotlinx.coroutines.runBlocking
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Mock
import org.mockito.Mockito
import org.mockito.MockitoAnnotations
import org.mockito.junit.MockitoJUnitRunner

@RunWith(MockitoJUnitRunner::class)
class PortfolioStocksHandlerTest {
    private lateinit var handler: PortfolioStocksHandler

    @Mock
    private lateinit var repository: PortfolioStocksRepository

    @get:Rule
    val coroutineRule = MainCoroutineRule()

    @get:Rule
    val rule = InstantTaskExecutorRule()

    @Before
    fun setUp() {
        MockitoAnnotations.openMocks(this)
        handler = PortfolioStocksHandler(repository)
    }

    @Test
    fun `getStocks returns error and error message when there is no data`() = runBlocking {
        Mockito.`when`(repository.getAllStocks()).thenReturn(BaseResponse.error(-100, "error"))
        val result = handler.getStocks()
        assert(result["status"] == "IsError")
        assert(result["error"] == "error")
        assert(result["data"] == null)
    }

    @Test
    fun `getStocks returns success and data when there is data`() = runBlocking {
        val type = object : TypeToken<PortfolioStocksResponse>() {}.type
        val response = mockyData.jsonToWord<PortfolioStocksResponse>(type)
        Mockito.`when`(repository.getAllStocks()).thenReturn(BaseResponse.success(200, response))
        val result = handler.getStocks()
        assert(result["status"] == "IsSuccess")
        assert(result["data"] != null)
    }
}