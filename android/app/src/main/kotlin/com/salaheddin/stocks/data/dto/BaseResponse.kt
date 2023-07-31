package com.salaheddin.stocks.data.dto

import com.google.gson.annotations.SerializedName

data class BaseResponse<out T>(
    @SerializedName("code")
    var code: Int,
    @SerializedName("data")
    val data: T? = null,
    @SerializedName("message")
    var message: String? = "Message is Null"
) {
    companion object {

        fun <T> success(code: Int, data: T?): BaseResponse<T> {
            return BaseResponse(
                code,
                data,
                null,
            )
        }

        fun <T> error(code: Int, msg: String = ""): BaseResponse<T> {
            return BaseResponse(
                code,
                null,
                msg,
            )
        }
    }
}
