package com.salaheddin.stocks.handler

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import com.google.gson.reflect.TypeToken
import com.salaheddin.stocks.utils.MainCoroutineRule
import com.salaheddin.stocks.data.dto.BaseResponse
import com.salaheddin.stocks.data.dto.tickerChart.TickerDto
import com.salaheddin.stocks.data.repositories.TickerRepository
import com.salaheddin.stocks.utils.jsonToWord
import com.salaheddin.stocks.utils.yFinanceData
import kotlinx.coroutines.runBlocking
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.anyString
import org.mockito.Mock
import org.mockito.Mockito
import org.mockito.MockitoAnnotations
import org.mockito.junit.MockitoJUnitRunner

@RunWith(MockitoJUnitRunner::class)
class TickersHandlerTest {
    private lateinit var handler: TickersHandler

    @Mock
    private lateinit var repository: TickerRepository

    @get:Rule
    val coroutineRule = MainCoroutineRule()

    @get:Rule
    val rule = InstantTaskExecutorRule()

    @Before
    fun setUp() {
        MockitoAnnotations.openMocks(this)
        handler = TickersHandler(repository)
    }

    @Test
    fun `getTickerChart returns error and error message when there is no data`() = runBlocking {
        Mockito.`when`(repository.getTickerChart(anyString(), anyString(), anyString()))
            .thenReturn(BaseResponse.error(-100, "error"))
        val result = handler.getTickerChart(anyString(), anyString(), anyString())
        assert(result["status"] == "IsError")
        assert(result["error"] == "error")
        assert(result["data"] == null)
    }

    @Test
    fun `getTickerChart returns success and data when there is data`() = runBlocking {
        val type = object : TypeToken<TickerDto>() {}.type
        val response = yFinanceData.jsonToWord<TickerDto>(type)
        Mockito.`when`(repository.getTickerChart(anyString(), anyString(), anyString()))
            .thenReturn(BaseResponse.success(200, response))
        val result = handler.getTickerChart(anyString(), anyString(), anyString())
        assert(result["status"] == "IsSuccess")
        assert(result["data"] != null)
    }
}