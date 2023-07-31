package com.salaheddin.stocks.data.network

import com.salaheddin.stocks.data.dto.BaseResponse

open class ResponseHandler {
    fun <T : Any> handleSuccess(code: Int, data: T): BaseResponse<T> {
        return BaseResponse.success(code, data)
    }

    fun <T : Any> handleException(code: Int, e: Exception): BaseResponse<T> {
        return BaseResponse.error(code, e.message!!)
    }
}
